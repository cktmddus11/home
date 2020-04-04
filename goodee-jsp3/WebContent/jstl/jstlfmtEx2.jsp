<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� �±� ����2</title>
</head>
<body>
	<h3>Format �� ���ڸ� �Ϲ� ���ڷ� �ٽ� ����</h3>
	<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/><br>
	<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/><br>
	�� : ${num1 + num2} <br> <!-- var�� ���ϸ� �׳� ��µǴµ� var���ؼ� ����                        
	 var�� �����ϰ� �־ ��¾ȵ� -->
	�� : <fmt:formatNumber value="${num1+num2 }" pattern="##,###" var="num3" />${num3}<br> 
	<h3>Format �� ��¥�� �Ϲ� ��¥�� ����</h3>
	<fmt:parseDate value="2019-10-30 12:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="day"/>
	��¥ : ${day }<br>
	<!--  format ���� �Ǵ� ���ڸ� ����ȭ -->
	<!--  parse ����ȭ �Ȱ� ���� �Ǵ� ���ڷ�  -->
	<h3>2019-10-30�� ���� ����ϱ�</h3>
	<c:set var="today" value="<%=new java.util.Date() %>"></c:set> 
	<fmt:formatDate value = "${today}" pattern="yyyy-MM-dd"  var="today2"/>
	${today2} : <fmt:formatDate value="${today}" pattern="E����" />
	
</body>
</html>