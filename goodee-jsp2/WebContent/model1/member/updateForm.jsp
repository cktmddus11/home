<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!--  admin�� ��� �������� ����ڴ� �ڱ� ���븸 ����
    �α��� ���� Ȯ�� 
    
    1. id �ĸ����� ��ȸ
    2. login ���� ��ȸ
    	�α����� �ȵȰ�� "�α����ϼ���" �޽��� ��� loginForm.jsp������ �̵�
    3. �α��� �Ȱ�� : �α����� admin�� �ƴϸ鼭 �ٸ������ ������ ��ȸ�ϸ�
    							"�� ���� ������ �����մϴ�. main.jsp" ������ �̵�
    4. �������̰ų� admin�� ��� -> id�� ������ db���� �о Member ��ü�� ����
    5. Member ��ü�� ȭ�鿡 ���
    
    --> 
    
    
<%
String id = request.getParameter("id");
String login = (String)session.getAttribute("login");
if(login == null){
	%>
	<script>
	alert("�α����ϼ���.");
	location.href="loginForm.jsp";
	</script>
	<% 
}else{
	if(!login.equals("admin") && !id.equals(login)){
		%>
		<script>
		alert("�� ���� ������ �����մϴ�.");
		location.href="main.jsp";
		</script>
		<% 
	}else{
		Member dao = new MemberDao().selectOne(id);
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
<link rel="stylesheet" href="../css/main.css">
<script>
function inputcheck(f){
	<%if(!login.equals("admin")){ %>
		if(f.pass.value==""){
			alert("��й�ȣ�� �Է��ϼ���");
			f.pass.focus();
			return false;
		}
	<%}%>	
}
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	//nw = open("pictureForm.jsp", "picture", op);
	open("pictureForm.jsp", "picture", op);
}
function win_updatepw(){
	var op = "width=500, height=230, left=50, top=150";
	open("passwordForm.jsp", "password", op);
}

</script>
</head>
<body>
	<form action="update.jsp" name="f" method="post" 
	onsubmit="return inputcheck(this)">
		<input type="hidden" name="picture" value="<%=dao.getPicture() %>"> <!-- �������ε忡�� hidden�� �Ѱ��ִϱ� �˾Ƽ� �����ٲ�ɷ� ��� �������� -->	
		<table>
			<caption>ȸ�� ���� ����</caption>
			<tr>
				<td rowspan="4" valign="bottom">
				<img src="picture/<%=dao.getPicture() %>" width="100" height="120" id="pic"><br>
				<font size="1"><a href="javascript:win_upload()">���� ����</a></font></td>
				<th>���̵�</th>
				
				<td><input type="text" name="id" value="<%=dao.getId() %>" readonly></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pass"></td>	
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name" value="<%=dao.getName() %>"></td>	
			</tr>
			<tr>
				<th>����</th>
				<td><input type="radio" name="gender" value="1" <%=dao.getGender()==1?"checked":"" %>>��
				<input type="radio" name="gender" value="2"  <%=dao.getGender()==2?"checked":"" %>>��</td>	
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td colspan="2"><input type="text" name="tel" value="<%=dao.getTel() %>"></td>	
			</tr>
			<tr>
				<th>�̸���</th>
				<td colspan="2"><input type="text" name="email" value="<%=dao.getEmail()%>" ></td>	
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="ȸ������">
					<input type="button" value="��й�ȣ ����"  onclick="javascript:win_updatepw()"/>
				</td>	
			</tr>
			
		</table>
	</form>
</body>
</html>
		<% 
	}
}


%>       
