<%@page import="model1.BoardDao"%>
<%@page import="model1.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 1. num 값의 게시물을 db에서 조회하여 화면에 출력하기 --%>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDao dao = new BoardDao();
// b: num값에 해당하는 게시물의 db 정보 저장
Board b = dao.selectOne(num);


%>
<html>
<head>
<meta charset="EUC-KR">
<title>수정</title>
<link rel="stylesheet" href="../css/main.css">
<script>
	function file_delete(){
		document.f.file2.value="";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
<form action="update.jsp" name = "f" method="post" 
	enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%=b.getNum()%>">
			<input type="hidden" name="file2" value="<%=b.getFile1()==null?"":b.getFile1()%>">
			<table>
				<caption>게시판 수정 화면</caption>
				<tr>
					<td>글쓴이</td>
					<td><input type="text" name="name" value="<%=b.getName() %>"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" value="<%=b.getSubject() %>"/></td>
				</tr>	
				<tr>
					<td>내용</td>
					<td><textarea row="15" name="content"><%=b.getContent() %></textarea></td>
				</tr>	
				<tr>
					<td>첨부파일</td>
					<td style="text-align : left">
					<% if(b.getFile1() != null && (!b.getFile1().equals(""))){ %>
					<div id="file_desc"><%=b.getFile1() %>
					<a href="javascript:file_delete()">[첨부파일 삭제]</a>
					</div>
					<%} %>
					<input type="file" name="file1"></td>
				</tr>	
				<tr>
					<td colspan="2">
					<a href="javascript:document:f.submit()">[게시물수정]</a>
				</tr>
			</table>
	
	</form>
</body>
</html>