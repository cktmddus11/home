<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spitter</title>
<link rel="stylesheet" style="text/css" href="<c:url value="/resources/style.css"/>">
</head>
<body>
<h1>Spitter</h1>
	<div class="spittleView">
		<div class="spittleMessage">
			<c:out value="${spittle.message }"></c:out>
		</div>
		<div>
			<span class="spittleTime">
				<c:out value="${spittle.time }"/>
			</span>
		</div>
	</div>
</body>
</html>