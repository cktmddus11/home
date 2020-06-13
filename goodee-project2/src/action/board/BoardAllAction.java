package action.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement.ParseInfo;
import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.Comment;

public class BoardAllAction {
	private boolean checklogin(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		String id = request.getParameter("id");

		if (login == null || login.trim().equals("")) { // 로그인 안돼있으면
			request.setAttribute("msg", "로그인 후 거래하세요.");
			request.setAttribute("url", "../loginForm.do");
			return false;
			// MainAction 이 이 클래스 상속받아서 이클래스를 먼저 들려서
			// 가기전에 여기서 걸려서 doExecute가 실행 안됨?
		} else { // 로그인 돼있으면
			if (!login.equals("admin") && id != null && !login.equals(id)) { // 로그인정보가 admin이 아니면서 로그인정보와 파라미터 정보가 일치하지
				System.out.print(request.getRequestURI());
				if (request.getRequestURI().contains("member")) { // 않으면
					request.setAttribute("msg", "본인만 가능합니다.");
					request.setAttribute("url", "main.do");
					return false;
				} else {
					request.setAttribute("msg", "본인만 가능합니다.");
					request.setAttribute("url", "../main/main.do");
					return false;
				}
			}
		}
		// 위에 조건문 다 아니면 로그인상태여야만 MainAction 클래스의 doExecute메서드호출됨
		return true;
	}
	private boolean checklogin2(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");

		if (login == null || login.trim().equals("")) { // 로그인 안돼있으면
			request.setAttribute("msg", "로그인 후 거래하세요.");
			request.setAttribute("url", "loginForm.do");
			return false;
			// MainAction 이 이 클래스 상속받아서 이클래스를 먼저 들려서
			// 가기전에 여기서 걸려서 doExecute가 실행 안됨?
		}
		return true;
		// 위에 조건문 다 아니면 로그인상태여야만 MainAction 클래스의 doExecute메서드호출됨
	}
	BoardDao dao = new BoardDao();

	public ActionForward list(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if (checklogin2(request, response)) {
			int limit = 10;
			int pageNum = 1;

			try {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			} catch (NumberFormatException e) {
			}

			String column = request.getParameter("column");
			String find = request.getParameter("find");
			// 검색조건
			if (column != null && column.trim().equals("")) { // 입력내용 띄어쓰기?
				column = null;
			}
			if (find != null && find.trim().equals("")) {
				find = null;
			}
			if (column == null || find == null) { // 두개다 있어야지 검색되게
				column = null;
				find = null;
			}
			String mem_id = request.getParameter("id") == null ? "" : request.getParameter("id");
			int boardcnt = dao.boardCount(column, find, mem_id);
			

			System.out.println("아이디 " + mem_id);
			List<Board> list = dao.list(pageNum, limit, column, find, mem_id);
			int maxpage = (int) ((double) boardcnt / limit + 0.95);
			int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
			int endpage = startpage + 9;
			if (endpage > maxpage) {
				endpage = maxpage;
			}
			int boardnum = boardcnt - (pageNum - 1) * limit;

			request.setAttribute("boardcnt", boardcnt);
			request.setAttribute("list", list);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("boardnum", boardnum);
			request.setAttribute("pageNum", pageNum);

			return new ActionForward();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward write(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if (checklogin(request, response)) {
			String uploadPath = request.getServletContext().getRealPath("/") + "/board/file/";
			String msg = "게시물 등록 실패";
			String url = "writeForm.do1";
			try {
				File f = new File(uploadPath);
				if (!f.exists())
					f.mkdirs();
				MultipartRequest multi = new MultipartRequest(request, uploadPath, 10 * 1024 * 1024, "euc-kr");

				Board b = new Board();
				b.setMem_id(multi.getParameter("mem_id"));
				b.setTitle(multi.getParameter("title"));
				b.setContent(multi.getParameter("content"));
				b.setFile(multi.getFilesystemName("file1"));

				int num = dao.maxnum(); // 게시물의 max값
				b.setNum(++num); // 게시물 최대값 + 1

				if (dao.insert(b)) {
					msg = "게시물 등록 성공";
					url = "list.do1";
				}
			} catch (IOException e) {
				throw new ServletException(e);
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletContext().getRealPath("/") + "/board/imgfile/";
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		// upload라는 이름으로 파일을 전달해줌 - 내부적인 파라미터 이름
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.do");
	}

	public ActionForward info(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num);
		// request.getRequestURI() : /jspstudy2/model2/info.do
		// 수정 등 상세보기가 아닐때는 조회수 증가되지 않게
		if (request.getRequestURI().contains("board/info.do")) {
			dao.readcntadd(num);
		}

		int up = dao.upselect(num);
		request.setAttribute("upcnt", up);
		System.out.println(b);
		request.setAttribute("b", b);
		// System.out.println(b);
		// =============댓글 테이블========

		List<Comment> list = dao.commentselect(num);
		System.out.println("댓글 목록 : " + list);
		request.setAttribute("list", list);
		return new ActionForward();

	}

	public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if (checklogin(request, response)) {
			Board board = new Board();
			String uploadPath = request.getServletContext().getRealPath("/") + "/board/file/";
			MultipartRequest multi;
			String msg = null;
			String url = null;

			try {
				multi = new MultipartRequest(request, uploadPath, 10 * 1024 * 1024, "euc-kr");
				board.setNum(Integer.parseInt(multi.getParameter("num")));
				board.setMem_id(multi.getParameter("mem_id"));
				board.setTitle(multi.getParameter("title"));
				board.setContent(multi.getParameter("content"));
				board.setFile(multi.getFilesystemName("file"));

				// 첨부파일 수정이 안된 경우
				if (board.getFile() == null || board.getFile().equals("")) {
					board.setFile(multi.getParameter("file2")); // 원본
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (dao.update(board)) {
				msg = "게시물 수정완료";
				url = "info.do1?num=" + board.getNum();
			} else {
				msg = "게시물수정실패";
			}

			request.setAttribute("url", url);
			request.setAttribute("msg", msg);
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if (checklogin(request, response)) {
			int num = Integer.parseInt(request.getParameter("num"));

			Board b = dao.selectOne(num);
			String msg = null;
			String url = null;
			if (b == null) {
				msg = "없는 게시글 입니다.";
				url = "list.do1";
			} else {
				if (dao.delete(num)) {
					msg = "삭제 되었습니다.";
					url = "list.do1";
				} else {
					msg = "삭제중 오류 발생";
					url = "info.do1?num=" + num;
				}
			}
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward up(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		if (checklogin(request, response)) {
			try {
				int num = Integer.parseInt(request.getParameter("num"));
				String login = (String) request.getSession().getAttribute("login");

				String msg = null;
				String url = null;

				if (dao.selectinfo(num, login)) { // 본인 게시글이면 추천안되게
					msg = "본인 글은 추천이 불가능합니다.";
					url = "info.do1?num=" + num;
				} else { // 본인이 아니면 추천가능
					if (dao.insert2(num, login)) {
						msg = "추천하셨습니다";
						url = "info.do1?num=" + num;
					} else {
						msg = "이미 추천한 게시물입니다.";
						url = "info.do1?num=" + num;
					}
				}
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return new ActionForward(false, "../alert.jsp");
				
			} catch (Exception e) {

			}
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward commentinsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		if (checklogin(request, response)) {
			String comment_id = request.getParameter("comment_id"); // 댓글작성자 아이디
			int num = Integer.parseInt(request.getParameter("num")); // 원글 번호
			String content = request.getParameter("comment");
			int comment_max = dao.selectmax();

			Comment c = new Comment();
			c.setNum(num);
			c.setContent(content);
			c.setComment_num(++comment_max);
			c.setComment_id(comment_id);

			if (dao.insertcomment(c)) {
				request.setAttribute("msg", null);
				request.setAttribute("url", "info.do1?num=" + num);
				return new ActionForward(false, "../alert.jsp");
			} else {
				request.setAttribute("msg", "댓글 추가 실패");
				request.setAttribute("url", "info.do1?num=" + num);
				return new ActionForward(false, "../alert.jsp");
			}
		}
		return new ActionForward(false, "../alert.jsp");
	}
	public ActionForward commentdelete(HttpServletRequest request, HttpServletResponse response){
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		String msg = null;
		if(dao.commentdelete(comment_num)) {
			msg = "삭제 성공";
		}else {
			msg = "삭제 실패";
		}
		request.setAttribute("msg", msg);
		return new ActionForward(false, "commentdelete.jsp");
		
	}

}
