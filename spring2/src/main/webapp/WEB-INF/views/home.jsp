<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page session="false" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spittr</title>
<link rel="stylesheet" tyle="text/css" 
		href="<c:url value="/resources/style.css"/>">
</head>
<body>
	<!-- <h1>Welcome to Spittr</h1> -->
	<!-- 다국어 처리 -->
	<h1><s:message code="spittr.welcome"/></h1>
	
	
	<a href="<c:url value="/spittles" />">Spittles</a> |
	<a href="<c:url value="/spitter/register" />">Register</a>
</body>
</html>