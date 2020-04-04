<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt �±� : ���ڵ�</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr"/>
	<form method="post" name="f">
		�̸� : <input type="text" name="name" value="${param.name }"><br>
		�Ի��� : <input type="text" name="hiredate" value="${param.hiredate}">
		yyyy-MM-dd ���·� �Է�<br>
		�޿� : <input type="text" name="salary" value="${param.salary}"><br>
		<input type="submit" value="����">
	</form>
	<hr>
	�̸� : ${param.name }<br>
	�Ի��� : ${param.hiredate }<br>
	�޿� : ${param.salary}<br>
	
	<h3>�Ի����� yyyy�� MM�� dd�� E���� ���·� ���<br>
	�޿��� ���ڸ�����, �� ����ϱ�<br>
	������ �޿� * 12 ����ϰ�, ���ڸ����� , �� ���</h3>
	<c:catch var="formatexception">
		<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="hiredate"/>
	</c:catch>
	<c:if test="${formatexception == null}">
		<fmt:formatDate value="${hiredate}" pattern="yyyy�� MM�� dd�� E����" var="hiredate2"/>
 		<fmt:formatNumber  value="${param.salary}" pattern="##,###" var="salary"/>
		<fmt:formatNumber value="${param.salary * 12}" pattern="##,###" var="total"/> 
		�̸� : ${param.name }<br>
		�Ի��� : ${hiredate2}<br>
		�޿� : ${salary}<br>
		���� : ${total}
	</c:if>
	<c:if test="${formatexception != null }">
		<font color='red' >�Ի����� yyyy-MM-dd ���·� �Է��ϼ���</font>
	</c:if>
	
</body>
</html>