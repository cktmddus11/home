<%@page import="model1.Member"%>
<%@page import="model1.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%-- 
1. id �� �ش��ϴ� ������ db���� ��ȸ
2. -������ �����ϸ� ��й�ȣ ����
	-> db �� ��й�ȣ�� �Էµ� ��й�ȣ Ȯ��
		�´� ��� : session �α��� ���� ���. Ȯ�� �޽��� ���.
		Ʋ�� ��� :  '��й�ȣ�� Ʋ���ϴ�' �޽��� 
	- id �� ������ ȭ�鿡 '���̵� Ȯ���ϼ���' �޽��� ���
		=> loginForm.jsp �������� �̵�

 --%>
<meta charset="EUC-KR">
<title>�α��� action </title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//                            Model������ �ϴ� DAO data access object
	// MemberDao Ŭ���� : Model ��� Ŭ���� 
	// Model : dbms �� �����ִ� ����� ���� Ŭ����
	Member mem = new MemberDao().selectOne(id);
	// public , string �Ű����� ����Ÿ�� Member
	if(mem != null){ //id ����
		// pass ȭ�鿡 �Է��� ��й�ȣ, mem.getPass db ��й�ȣ
		if(pass.equals(mem.getPass())){ // ��й�ȣ �´� ��� . �α���
			session.setAttribute("login", id);
			%>
			<script>alert("<%=mem.getName()%>�α��εǾ����ϴ�.");
			location.href="main.jsp"</script>
			<%
		}else {
			%>
			<script>alert("��й�ȣ�� Ʋ���ϴ�. ");
			location.href="loginForm.jsp"</script>
			<%
		}
	}else{ // id ���� ���
		%>
		<script>alert("���̵� Ȯ���ϼ���.");
		location.href="loginForm.jsp";</script>
		<%
	}
	%>
</body>
</html>