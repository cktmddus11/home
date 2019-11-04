<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout page</title>
</head>
<body>
<%
	session.invalidate(); // 모든 세션 정보 삭제
	response.sendRedirect("u_index.jsp");
%>
</body>
</html>