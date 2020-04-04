<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <!-- 
   ===========================
    5. Member ��ü�� ȭ�鿡 ���
    
    --> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
function inputcheck(f){
	<c:if test="${sessionScope.login !='admin'}">
		if(f.pass.value==""){
			alert("��й�ȣ�� �Է��ϼ���");
			f.pass.focus();
			return false;
		}
	</c:if>	
}
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	//nw = open("pictureForm.jsp", "picture", op);
	open("pictureForm.me", "picture", op);
}
function win_updatepw(){
	var op = "width=500, height=230, left=50, top=150";
	open("passwordForm.me", "password", op);
}

</script>
</head>
<body>
	<form action="update.me" name="f" method="post" 
	onsubmit="return inputcheck(this)">
		<input type="hidden" name="picture" value="${info.picture}"> <!-- �������ε忡�� hidden�� �Ѱ��ִϱ� �˾Ƽ� �����ٲ�ɷ� ��� �������� -->	
		<table>
			<caption>ȸ�� ���� ����</caption>
			<tr>
				<td rowspan="4" valign="bottom">
				<img src="picture/${info.picture}" width="100" height="120" id="pic"><br>
				<font size="1"><a href="javascript:win_upload()">���� ����</a></font></td>
				<th>���̵�</th>
				
				<td><input type="text" name="id" value="${info.id}" readonly></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pass"></td>	
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name" value="${info.name}"></td>	
			</tr>
			<tr>
				<th>����</th>
				<td><input type="radio" name="gender" value="1" ${info.gender==1?"checked":"" }>��
				<input type="radio" name="gender" value="2"  ${info.gender==2?"checked":""}>��</td>	
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td colspan="2"><input type="text" name="tel" value="${info.tel}"></td>	
			</tr>
			<tr>
				<th>�̸���</th>
				<td colspan="2"><input type="text" name="email" value="${info.email}" ></td>	
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="ȸ������">
				<c:if test="${info.id != 'admin'}">
					<input type="button" value="��й�ȣ ����"  onclick="javascript:win_updatepw()"/>
					</c:if>
				</td>	
			</tr>
			
		</table>
	</form>
</body>
</html>
