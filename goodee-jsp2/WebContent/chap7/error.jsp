<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- ���� �������� ���� ó�� �������� --%>
<%@ page isErrorPage="true" %> <!--  Exception �⺻��ü ��밡�� 
�ͽ��÷ξ�� 513����Ʈ ������ ��� ��ü���� HTTP ���� �޽��� â ���  -->
<!DOCTYPE html> 
<html>
<head>
<meta charset="EUC-KR">
<!--  ���� ���������� Excepiotn ���� �߻��� 
error.jsp ���� �̵� -->
<title>���� ������</title>
</head>
<body>
	<h1> �ĸ����� name �� �Է����ּ���</h1>
	<h1>��� ���� �߻��� ����η� ��ȭ ��� </h1>
	<h1>����� : ȫ�浿, ��ȭ : 1234 </h1>
	<%=exception.getClass().getName() %>
	<% exception.printStackTrace(response.getWriter()); %>
	<!-- ������������ ��� �뷮�� 500����Ʈ �̸��� ���
	���������� ���� �������� �ƴ� http ������������ ����� �� 
	���� �׷��Ƿ� 500����Ʈ �̻��� �ǵ��� 
 ������������ �޽����� ����ؾ���. �̺κ��� 500����Ʈ�� 
 �ѱ�� ���� �޽����� -->>

</body>
</html>