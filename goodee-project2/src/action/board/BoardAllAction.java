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

		if (login == null || login.trim().equals("")) { // �α��� �ȵ�������
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���.");
			request.setAttribute("url", "../loginForm.do");
			return false;
			// MainAction �� �� Ŭ���� ��ӹ޾Ƽ� ��Ŭ������ ���� �����
			// �������� ���⼭ �ɷ��� doExecute�� ���� �ȵ�?
		} else { // �α��� ��������
			if (!login.equals("admin") && id != null && !login.equals(id)) { // �α��������� admin�� �ƴϸ鼭 �α��������� �Ķ���� ������ ��ġ����
				System.out.print(request.getRequestURI());
				if (request.getRequestURI().contains("member")) { // ������
					request.setAttribute("msg", "���θ� �����մϴ�.");
					request.setAttribute("url", "main.do");
					return false;
				} else {
					request.setAttribute("msg", "���θ� �����մϴ�.");
					request.setAttribute("url", "../main/main.do");
					return false;
				}
			}
		}
		// ���� ���ǹ� �� �ƴϸ� �α��λ��¿��߸� MainAction Ŭ������ doExecute�޼���ȣ���
		return true;
	}
	private boolean checklogin2(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");

		if (login == null || login.trim().equals("")) { // �α��� �ȵ�������
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���.");
			request.setAttribute("url", "loginForm.do");
			return false;
			// MainAction �� �� Ŭ���� ��ӹ޾Ƽ� ��Ŭ������ ���� �����
			// �������� ���⼭ �ɷ��� doExecute�� ���� �ȵ�?
		}
		return true;
		// ���� ���ǹ� �� �ƴϸ� �α��λ��¿��߸� MainAction Ŭ������ doExecute�޼���ȣ���
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
			// �˻�����
			if (column != null && column.trim().equals("")) { // �Է³��� ����?
				column = null;
			}
			if (find != null && find.trim().equals("")) {
				find = null;
			}
			if (column == null || find == null) { // �ΰ��� �־���� �˻��ǰ�
				column = null;
				find = null;
			}
			String mem_id = request.getParameter("id") == null ? "" : request.getParameter("id");
			int boardcnt = dao.boardCount(column, find, mem_id);
			

			System.out.println("���̵� " + mem_id);
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
			String msg = "�Խù� ��� ����";
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

				int num = dao.maxnum(); // �Խù��� max��
				b.setNum(++num); // �Խù� �ִ밪 + 1

				if (dao.insert(b)) {
					msg = "�Խù� ��� ����";
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
		// upload��� �̸����� ������ �������� - �������� �Ķ���� �̸�
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.do");
	}

	public ActionForward info(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num);
		// request.getRequestURI() : /jspstudy2/model2/info.do
		// ���� �� �󼼺��Ⱑ �ƴҶ��� ��ȸ�� �������� �ʰ�
		if (request.getRequestURI().contains("board/info.do")) {
			dao.readcntadd(num);
		}

		int up = dao.upselect(num);
		request.setAttribute("upcnt", up);
		System.out.println(b);
		request.setAttribute("b", b);
		// System.out.println(b);
		// =============��� ���̺�========

		List<Comment> list = dao.commentselect(num);
		System.out.println("��� ��� : " + list);
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

				// ÷������ ������ �ȵ� ���
				if (board.getFile() == null || board.getFile().equals("")) {
					board.setFile(multi.getParameter("file2")); // ����
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (dao.update(board)) {
				msg = "�Խù� �����Ϸ�";
				url = "info.do1?num=" + board.getNum();
			} else {
				msg = "�Խù���������";
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
				msg = "���� �Խñ� �Դϴ�.";
				url = "list.do1";
			} else {
				if (dao.delete(num)) {
					msg = "���� �Ǿ����ϴ�.";
					url = "list.do1";
				} else {
					msg = "������ ���� �߻�";
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

				if (dao.selectinfo(num, login)) { // ���� �Խñ��̸� ��õ�ȵǰ�
					msg = "���� ���� ��õ�� �Ұ����մϴ�.";
					url = "info.do1?num=" + num;
				} else { // ������ �ƴϸ� ��õ����
					if (dao.insert2(num, login)) {
						msg = "��õ�ϼ̽��ϴ�";
						url = "info.do1?num=" + num;
					} else {
						msg = "�̹� ��õ�� �Խù��Դϴ�.";
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
			String comment_id = request.getParameter("comment_id"); // ����ۼ��� ���̵�
			int num = Integer.parseInt(request.getParameter("num")); // ���� ��ȣ
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
				request.setAttribute("msg", "��� �߰� ����");
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
			msg = "���� ����";
		}else {
			msg = "���� ����";
		}
		request.setAttribute("msg", msg);
		return new ActionForward(false, "commentdelete.jsp");
		
	}

}
