<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <!--  �±� ���̺귯�� uri �� ���Ͽ� ���� set�̶�� �±׸� ���
  prefix  c  -->
 <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL Core �±� ���� : taglib ���þ� ǥ���ؾ��Ѵ�.</title>
</head>
<body>
	<h3>�Ӽ� ���� �±� : set, remove, out �±�</h3>
	<% session.setAttribute("test", "Hello JSTL"); %>
	<!--  �Ӽ���ȸ -->
	<c:set var="test" value="${'Hello JSTL' }" scope="session"/> <!-- scope �����ϸ� page -->
	<!-- c : ���ξ� c�Ʒ� set�� ��� -->
	<!--  ���� ��������� c:out�� �� ���ȿ� ���� -->
	test �Ӽ� : ${sessionScope.test}<br>
	test �Ӽ� : <c:out value="${test }" /><br>
		<!--  �Ӽ������ -->
	<c:remove var="test" />
	test �Ӽ� : ${test}
</body>
</html>