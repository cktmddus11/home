<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<script>
function check(f){
	if(f.pass.value==""){
		alert("��й�ȣ�� �Է��ϼ���.");
		f.pass.focus();
		return  false;
	}
}
</script>
<link rel = "stylesheet" href="../css/main.css">
</head>
<body>
	<form action="delete.jsp" name="f" method="post" onsubmit="return check(this)">
		<input type="hidden" name="num" value="<%=request.getParameter("num") %>">
		<table>
			<caption>�Խñ� ����ȭ�� </caption>
			<tr>
				<th>�Խñ� ��й�ȣ</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="�Խñ� ����"></td>
			</tr>
		</table>
	</form>
</body>
</html>