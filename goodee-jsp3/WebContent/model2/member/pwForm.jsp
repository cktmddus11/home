<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã��</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<form name="f" method="post" action="pw.me" onsubmit="return check()">
		<table>
			<caption>��й�ȣ ã��</caption>
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id">
			</tr>
			<tr>
				<th>�̸���</th>
				<td><input type="text" name="email">
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><input type="text" name="tel">
			</tr>
			<tr>
				<td colspan="2"><input type="submit"  value="��й�ȣ ã��">
			</tr>
		</table>
	</form>
</body>
</html>