<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("euc-kr");
request.setAttribute("name", request.getParameter("name"));
request.setAttribute("age", request.getParameter("age"));
request.setAttribute("gender", Integer.parseInt(request.getParameter("gender")));
request.setAttribute("year",request.getParameter("year"));
Calendar cal = Calendar.getInstance();
int today = cal.get(Calendar.YEAR);
request.setAttribute("today", today);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	�̸� : ${name}<br>
	���� : ${age}<br>
	���� : ${gender==1?"����" :"����"}<br>
	����⵵: ${year}<br>
	���� : ��${today - year}<br>
	
</body>
</html>