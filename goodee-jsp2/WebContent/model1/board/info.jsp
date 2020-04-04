<%@page import="model1.Board"%>
<%@page import="model1.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. num 파라미터 정보를 변수에 저장 
2. num 을 이용하여 db에서 게시물 정보를 조회
	Board b = new BoardDao.selectOne(num);
3. 조회수 증가시키기
	void BoardDao.readcntadd(num)
4. 2번에서 조회된 게시물 화면에 출력
 --%>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDao dao = new BoardDao();
Board b = dao.selectOne(num);
dao.readcntadd(num); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세 보기</title>
<link rel = "stylesheet" href="../css/main.css">
</head>
<body>
	<table>
		<caption>게시물 상세보기</caption>
		<tr>
			<th width="20%">글쓴이</th>
			<td width="80%" style="text-align:left"><input type="text" value="<%=b.getName()%>"></td>
		</tr>
		<tr>	
			<th>제목</th>
			<td style="text-align : left"><input type="text" value="<%=b.getSubject()%>"></td>
		</tr>
		<tr>	
			<th>내용</th>
			<td><table style="width:100%; height:250px;">
               <td style="border-width:0px; vertical-align:top; text-align:left">
              <%=b.getContent() %>
           	</td>     
     		</table>
     		</td>
     	</tr>
	<table>
	<tr>
		<th> 첨부파일</th>
		<td>
			<a href="file/"<%=b.getFile1() %>"><%=b.getFile1() %></a>
		</td>
	</tr>
	<tr>	
		<td colspan="2">
		<a href = "replyForm.jsp?num=<%=num %>">[답변]</a>
		<a href = "updateForm.jsp?num=<%=num %>">[수정]</a>
		<a href = "deleteForm.jsp?num=<%=num %>">[삭제]</a>
		<a href = "list.jsp">[목록]</a>
	</tr>
	</table>
</body>
</html>