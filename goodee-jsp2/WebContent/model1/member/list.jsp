<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. �α׾ƿ� ���� : �α����� �ʿ��մϴ�. �޼��� ���
							loginForm.jsp �������� �̵�
2. �α��� ���� 
					�Ϲ� ����� : �����ڸ� ������ �ŷ��Դϴ�. �޽��� ���
										main.jsp �� ������ �̵�
					������ 
3. db���� ��� ȸ�������� ��ȸ�Ͽ� List<Member> ��ü�� ����
	List<Member> list = new MemberDao().lsit() 

 --%>    
<%
String login = (String) session.getAttribute("login");
if(login != null ){
 	if(!login.equals("admin")){
 		%>
 		<script>alert("�����ڸ� ������ �ŷ��Դϴ�."); 
 		location.href="main.jsp";
 		</script>
 		<% 
 	}else{
 		List<Member> list = new MemberDao().list();
 		%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����� ����</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<table>
		<caption>ȸ�� ���</caption>
		<tr>
			<th>���̵�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>��ȭ</th>
			<th>&nbsp;</th>
		</tr>
		<%for(Member m : list){ %>
		<tr>
			<td><a href="info.jsp?id=<%=m.getId() %>"><%=m.getId() %></a></td>
			<td><%=m.getName() %></td>
			<td><%=m.getGender() %></td>
			<td><%=m.getTel() %></td>
			<td><a href="updateForm.jsp?id=<%=m.getId() %>">[����]</a>
			<%if(!m.getId().equals("admin")) {%>
				<a href="delete.jsp?id=<%=m.getId() %>">[����Ż��]</a>
			<%} %>
			</td>
		<tr>
		<%} %>
</table>
</body>
</html>
 		<% 
 	}
}else{
	%>
	<script>alert("�α����� �ʿ��մϴ�.");
	location.href="loginForm.jsp"</script>
	<% 
}
%> 
 
