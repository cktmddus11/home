<%@page import="model1.Member"%>
<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 1. id �Ķ���� ���� ��ȸ 
		2. �α��� ���� ����. 
			�α׾ƿ� ���� : '�α����� �ʿ��մϴ�. ' �޼��� ���. loginForm.jsp �̵�
		3. �α��� ����
			id �� ���� login���� �ٸ� ���, �Ǵ� admin�� �ƴѰ��
				'�������� ��ȸ�����մϴ�.' �޽��� ���. main.jsp �̵�
	 	4. db���� id���� �ش��ϴ� ������ ��ȸ. 
	 	5. ��ȸ�� ������ ȭ�鿡 ����ϱ� 					
--%>    
<%
String login = (String)session.getAttribute("login");
String id = request.getParameter("id");

if(login != null){
	if(!id.equals(login) && !login.equals("admin")){
		%>
		<script>
		alert("�������� ��ȸ�����մϴ�.");
		location.href="main.jsp";
		</script>
		<% 
	}else{
		MemberDao dao = new MemberDao();
		Member info = dao.selectOne(id);
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ��ȸ</title>
<link rel ="stylesheet" href="../css/main.css">
</head>
<body>
	<table>
		<caption>ȸ�� ���� ����</caption>
		<tr>
			<td rowspan="6"> <img src="picture/<%=info.getPicture() %>" width="150"
			height="180"></td>
			<th>���̵�</th>
			<td><%=info.getId() %></td>
		</tr>
		<tr>
			<th>�̸�</th>
			<td><%=info.getName() %></td>
		</tr>
		<tr>
			<th>����</th>
			<td><%=info.getGender()==1?"��":"��" %></td>
		</tr>		
		<tr>
			<th>��ȭ</th>
			<td><%=info.getTel() %></td>
		</tr>	
		<tr>
			<th>�̸���</th>
			<td><%=info.getEmail() %></td>
		</tr>
		<tr>
			<td colspan="2"><a href="updateForm.jsp?id=<%=info.getId() %>">[����]</a>
			<br>
			<%if(!id.equals("admin") && !login.equals("admin")){ %> 
			<a href="deleteForm.jsp?id=<%=info.getId()%>">[Ż��]</a>
			<%} %>
			</td>
		</tr>
		</table>
</body>
</html>		
		
		<% 
	}
}else{
	%>
	<script>
	alert("�α����� �ʿ��մϴ�.");
	location.href="loginForm.jsp";
	</script>
	<% 
}

%>    
