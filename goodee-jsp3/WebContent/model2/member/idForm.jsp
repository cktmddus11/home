<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
function check(){
	var f = document.f;
	if(f.email.value == ""){
		f.email.focus();
		alert("�̸����� �Է��ϼ���.");
		return false;
	}
	if(f.tel.value == ""){
		f.tel.focus();
		alert("��ȭ��ȣ�� �Է��ϼ���.");
		return false;
	}
}
</script>
</head>
<body>

	<form name="f" method="post" action="id.me" onsubmit="return check()">
		<table>
			<caption>���̵� ã��</caption>
			<tr>
				<th>�̸���</th>
				<td><input type="text" name="email">
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><input type="text" name="tel">
			</tr>
			<tr>
				<td colspan="2"><input type="submit"  value="���̵� ã��">
			</tr>
		</table>
	</form>
</body>
</html>