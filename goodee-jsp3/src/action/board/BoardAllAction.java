package action.board;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model1.Board;
import model1.BoardDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();
	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello",  "Hello, World");
		return new ActionForward();
	}
	/* 
	 * 1. multipart/form-data Ÿ���� �����̹Ƿ� MultipartRequest ��ü����
	 *  2. �Ķ���� ���� model1.Board��ü ����
 	3. �Խù� ��ȣ num ���� ��ϵ� num�� �ִ밪�� ��ȸ. �ִ밪 + 1 ��ϵ� �Խù� ��ȣ
 		db ���� maxnum�� ���ؼ� +1  ������ num �����ϱ� 
	4. board ������ db �� ����ϱ�.
		��� ���� : �޽��� ���. list.me ������ �̵�
		��� ���� : �޽��� ���. writeForm.me ������ �̵�
	 * 
	 * */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String uploadPath = request.getServletContext().getRealPath("/")+"model2/board/file/";
		String msg = "�Խù� ��� ����";
		String url = "writeForm.do";
		try {
			File f = new File(uploadPath);
			if(!f.exists()) f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, uploadPath, 10 * 1024 * 1024, "euc-kr");
			
			Board b = new Board();
			b.setName(multi.getParameter("name"));
			b.setPass(multi.getParameter("pass"));
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setFile1(multi.getFilesystemName("file1"));

			int num = dao.maxnum(); // �Խù��� max��
			b.setNum(++num); // �Խù� �ִ밪 + 1
			b.setGrp(num);
			if(dao.insert(b)) {
				msg = "�Խù� ��� ����";
				url = "list.do";
			}
		} catch (IOException e) {
			throw new ServletException(e);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	/* 
	 * 	1. �� �������� 10 ���� �Խù��� ����ϱ�.
			pageNum �Ķ���Ͱ��� ���� => ���� ���� 1�� ����.
		2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��. 
		3. ȭ��ܿ� �ʿ��� ������ �Ӽ����� ����ϰ� 
	 * 
	 * */
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int limit = 10;
		int pageNum = 1;
		
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e) {}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		// �˻�����
		if(column != null && column.trim().equals("")) { // �Է³��� ����?
			column = null;
		}if(find != null && find.trim().equals("")) {
			find = null;
		}if(column == null || find == null) { // �ΰ��� �־���� �˻��ǰ� 
			column = null;
			find = null;
		}

		int boardcnt = dao.boardCount(column, find);
		List<Board> list = dao.list(pageNum, limit, column, find);
		
		int maxpage = (int)((double) boardcnt / limit + 0.95);
		int startpage = ((int)(pageNum / 10.0 + 0.9)-1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		int boardnum = boardcnt - (pageNum -1) * limit;
	
		request.setAttribute("boardcnt", boardcnt);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage",  startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num); 
		// request.getRequestURI() : /jspstudy2/model2/info.do 
		// ���� �� �󼼺��Ⱑ �ƴҶ��� ��ȸ�� �������� �ʰ� 
		if(request.getRequestURI().contains("board/info.do")) {
			dao.readcntadd(num); 
		}
		System.out.println(b);
		request.setAttribute("b", b);
		return new ActionForward();
		
	}
	/* 
	 * 1. �Ķ���� ���� Board ��ü�� �����ϱ�
	���� ���� : num, grp, grplevel, grpstep
	��� ���� : name, pass, subject, content => �������
	2. ���� grp ���� ����ϴ� �Խù����� grpstep���� 1 �����ϱ�
	3. Board ��ü�� db�� insert �ϱ�
	num : maxnum +1
	grp : ���۰� ����
	grplevel : ���� + 1
	grpstep : ���� + 1
	4. ��� ���� �� : "�亯 ��� �Ϸ�" �޽��� ��� ��,  list.jsp�� ������ �̵�
 	��� ���� �� : "�亯 ��Ͻ� �����߻�" �޽��� ��� ��, replyForm.jsp�� ������ �̵�
	 * 
	 * */
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		Board b = new Board();
		// ��� ����
		b.setName(request.getParameter("name"));
		b.setPass(request.getParameter("pass"));
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));
		// ���� ����
		b.setNum(Integer.parseInt(request.getParameter("num")));
		b.setGrp(Integer.parseInt(request.getParameter("grp")));
		b.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));
		b.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
		
		dao.getStepAdd(b.getGrp(), b.getGrpstep());
		
		int grplevel = b.getGrplevel();
	 	int grpstep = b.getGrpstep();
	 	int num = dao.maxnum();
	 	String msg = "�亯��Ͻ� �����߻�";
	 	String url = "replyForm.do?num="+b.getNum();
	 	
	 	b.setNum(++num);
	 	b.setGrplevel(grplevel+1);
	 	b.setGrpstep(grpstep + 1); 
	 	System.out.println("������ ����"+b);
	 	if(dao.insert(b)){
	 		msg = "�亯 ��� �Ϸ�";
	 		url = "list.do";
	 	}
	 	request.setAttribute("msg", msg);
	 	request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	/* 
	 * 1.  �Ķ������������ Board ��ü�� ����
		2. ��й�ȣ ����
			��й�ȣ ��ġ�ϴ� ��� ����
			�Ķ���� �������� �ش� �Խù��� ������ �����ϱ�
			÷�������� ������ ���� ��� file2 �Ķ������ ������ �ٽ� �����ϱ�
			��й�ȣ ����ġ               ���������ʾ����� file1 = file2 
			��й�ȣ ���� �޽��� ����ϰ�, updateForm.do �� ������ �̵�
		3. ���� ���� : �������� �޽��� ����ϰ�, info.do �� ������ �̵�
			���� ���� : ���� ���� �޽��� ����� updateForm.do �������� �̵�
	 * 
	 * */
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		Board board = new Board();
		String uploadPath =	request.getServletContext().getRealPath("/")+"model2/board/file/";
		MultipartRequest multi;
		String msg = null;
		String url = null;
		
		try {
			multi = new MultipartRequest(request, uploadPath, 10 *1024 * 1024, "euc-kr");
			board.setNum(Integer.parseInt(multi.getParameter("num")));
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			url = "updateForm.do?num="+board.getNum();
			// ÷������ ������ �ȵ� ���
			if(board.getFile1() == null || board.getFile1().equals("")){
				board.setFile1(multi.getParameter("file2")); // ����
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		Board dbBoard = dao.selectOne(board.getNum());
		
		if(dbBoard.getPass().equals(board.getPass())){
			if(dao.update(board)){
				msg = "�Խù� �����Ϸ�";
				url = "info.do?num="+board.getNum();
			}else{
				msg = "�Խù���������";
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false, "../alert.jsp");
		
	}
	/* 
	 * 	1. num, pass �Ķ���͸� ������ ����
	2. �Էµ� ��й�ȣ�� db ��й�ȣ ����
		Ʋ����� : ��й�ȣ ���� �޽��� ���, deleteForm.jsp ������ �̵�
	3. ��й�ȣ�� �´� ��� : �Խù� ����
		���� ���� : ���� ���� �޽��� ���, list.jsp ������ �̵�
		���� ���� : ���� ���� �޽��� ���, info.jsp
	 * 
	 * */
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");

		Board b = dao.selectOne(num);
		String msg = null;
		String url = null;
		if(b == null){
			msg = "���� �Խñ� �Դϴ�.";
			url = "list.do";
		}else{
			String dbpass = b.getPass();
			if(dbpass.equals(pass)){
				if(dao.delete(num)){
					msg = "���� �Ǿ����ϴ�.";
					url = "list.do";
				}else{
					msg = "������ ���� �߻�";
					url = "info.do?num="+num;
				}
			}else{
				msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
				url = "deleteForm.do?num="+num;
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false, "../alert.jsp");
		
		
	}
	/* CKEDITOR ���� �̹����� �Խ��� ���뿡 �߰��ϱ�*/
	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletContext().getRealPath("/")+
				"model2/board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		// upload��� �̸����� ������ �������� - �������� �Ķ���� �̸�
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
		
	}
	
}