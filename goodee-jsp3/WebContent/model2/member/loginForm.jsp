<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<!--  <link rel="stylesheet" href="/jspstudy1/model/css/main.css"> -->
<!--  ../ ���������� �̵� : ����ι��
/javascript1/css/main.css ; ���� ��� ��� webcontent���� ����-->
<script>
function win_open(page){
	var op = "width=500, height=230, left=50, top=150";
	nw = open(page+".me","id", op);
}
</script>
</head>
<body>
	<form action="login.me" method="post" name="f">
		<table>
			<caption>�α���</caption>
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="�α���">
				<input type="button" value="ȸ������" 
				onclick="location.href='joinForm.me'">
				<input type="button" value="���̵�ã��" onclick="win_open('idForm')">
				<input type="button" value="��й�ȣ ã��" onclick="win_open('pwForm')">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>