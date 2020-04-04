<%@page import="model1.BoardDao"%>
<%@page import="model1.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. �Ķ���� �������� Board ��ü�� ����
2. ��й�ȣ ����	
	��й�ȣ ��ġ�ϴ� ��� ����
		�Ķ���� �������� �ش� �Խù��� ������ �����ϱ�
		÷�������� ������ ���� ��� file2 �Ķ������ ���� �ٽ������ϱ�
	��й�ȣ ����ġ
		��й�ȣ ���� �޽��� ����ϰ�, updateForm.jsp �� ������ �̵�
3. ���� ���� : �������� �޽��� ����ϰ�, info.jsp �� ������ �̵�
    ���� ���� : �������� �޽��� �����  updateForm.jsp �������� �̵�
 --%>
<%

String uploadPath = application.getRealPath("/")+"model1/board/file/";
System.out.println(uploadPath);
int size = 1024 * 1024 * 10;
MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");

Board board = new Board();
int num = Integer.parseInt(multi.getParameter("num"));
String file1 = multi.getFilesystemName("file1");
String file2 = multi.getParameter("file2");
String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");


if(file1 == null || file1.equals("")){ // ���� ������ �߰��������� file1�� ���̴ϱ�
	// file2���ִ� �ɷ� board��ü�� ������ -> ���������ͷ� �־� 
	board.setFile1(file2);
}else{
	board.setFile1(file1);
}
board.setNum(num);
board.setName(name);
board.setPass(pass);
board.setSubject(subject);
board.setContent(content);

String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
String url = "updateForm.jsp?num="+num;

BoardDao dao = new BoardDao();
Board dbBoard = dao.selectOne(num);

if(dbBoard.getPass().equals(pass)){
	if(dao.update(board)){
		msg = "�Խù� �����Ϸ�";
		url = "info.jsp?num="+num;
	}else{
		msg = "�Խù���������";
	}
}

%>
<script>
alert("<%=msg %>");
location.href="<%=url %>";
</script>