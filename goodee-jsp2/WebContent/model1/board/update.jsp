<%@page import="model1.BoardDao"%>
<%@page import="model1.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. 파라미터 정보들을 Board 객체에 저장
2. 비밀번호 검증	
	비밀번호 일치하는 경우 수정
		파라미터 내용으로 해당 게시물의 내용을 수정하기
		첨부파일의 변경이 없는 경우 file2 파라미터의 내용 다시저장하기
	비밀번호 불일치
		비밀번호 오류 메시지 출력하고, updateForm.jsp 로 페이지 이동
3. 수정 성공 : 수정성공 메시지 출력하고, info.jsp 로 페이지 이동
    수정 실패 : 수정실패 메시지 출력후  updateForm.jsp 페이지로 이동
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


if(file1 == null || file1.equals("")){ // 새로 파일을 추가안했으면 file1이 널이니까
	// file2에있는 걸로 board객체에 저장해 -> 원본데이터로 넣어 
	board.setFile1(file2);
}else{
	board.setFile1(file1);
}
board.setNum(num);
board.setName(name);
board.setPass(pass);
board.setSubject(subject);
board.setContent(content);

String msg = "비밀번호가 틀렸습니다.";
String url = "updateForm.jsp?num="+num;

BoardDao dao = new BoardDao();
Board dbBoard = dao.selectOne(num);

if(dbBoard.getPass().equals(pass)){
	if(dao.update(board)){
		msg = "게시물 수정완료";
		url = "info.jsp?num="+num;
	}else{
		msg = "게시물수정실패";
	}
}

%>
<script>
alert("<%=msg %>");
location.href="<%=url %>";
</script>