<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
<script type="text/javascript">
function check(f){
	if(f.afterpass.value != f.checkafterpass.value){
		alert("���� ��й�ȣ�� ���� ��й�ȣ ���Է��� �ٸ��ϴ�.");
		f.checkafterpass.value="";
		f.checkafterpass.focus();
		return false;
	}
	if(f.beforepass.value == ""){
		alert("���� ��й�ȣ�� �Է��ϼ���.");
		f.beforepass.focus();
		return false;
	}
	if(f.afterpass.value == ""){
		alert("������ ��й�ȣ�� �Է��ϼ���.");
		f.afterpass.focus();
		return false;
	}
	if(f.checkafterpass.value == ""){
		alert("������ ��й�ȣ Ȯ���� �Է��ϼ���.");
		f.checkafterpass.focus();
		return false;
	}
}

</script>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="password.me" method="post" name="f" onsubmit="return check(this)">
	<table>
		<caption>��й�ȣ ����</caption>
		<tr>
			<th>���� ��й�ȣ</th>
			<td><input type="password" name="beforepass"/>
		</tr>
		<tr>
			<th>���� ��й�ȣ</th>
			<td><input type="password" name="afterpass"/>
		</tr>
		<tr>
			<th>���� ��й�ȣ ���Է�</th>
			<td><input type="password" name="checkafterpass"/>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="��й�ȣ ����"></td>
		</tr>
		</table>
	</form>
</body>
</html>