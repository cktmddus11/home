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
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://localhost:3306/classdb","scott", "1234");
	String sql = "select * from member where id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	// db�κ��� id�� �ش��ϴ� ���� �б�
	if(rs.next()){ // id ����
		//String id2 = rs.getString("id");
		//String password = rs.getString("pass");
		String dbPass = rs.getString("pass");
		if(pass.equals(dbPass)){
	/* 	if(id2.equals(id) && password.equals(pass)){ 
			List<String> list = new ArrayList(); */
			//list.add(id2);
			// list.add(password);
			//session.setAttribute("login", list);
			session.setAttribute("login", id);
			String name=rs.getString("name");
			%>
			<script>alert("<%=name%>�α��εǾ����ϴ�.");
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