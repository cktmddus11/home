<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="../decorator/css/sb-admin.css" rel="stylesheet">
<script>
function check(f){
	if(f.afterpass.value != f.checkafterpass.value){
		alert("���� ��й�ȣ�� ���� ��й�ȣ ���Է��� �ٸ��ϴ�.");
		f.checkafterpass.value = "";
		f.checkafterpass.focus();
		return false;
	}
}
</script>
</head>
<body>
	<div class="card mb-3" id="evaluation">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> ��й�ȣ ����
		</div>
		<div class="card-body">
			<form action="password.do" method="post" name="f"
				onsubmit="return check(this)">
				<!-- <input type="hidden" name="id2" value=""> -->
				<table class="w3-table-all">
					
					<tr>
						<th>���� ��й�ȣ</th>
						<td><input type="password" name="beforepass" />
					</tr>
					<tr>
						<th>���� ��й�ȣ</th>
						<td><input type="password" name="afterpass" />
					</tr>
					<tr>
						<th>���� ��й�ȣ ���Է�</th>
						<td><input type="password" name="checkafterpass" />
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="��й�ȣ ����"></td>
					</tr>
				</table>
			</form>


		</div>
		<div class="card-footer small text-muted">��й�ȣ�� �����ϼ���</div>
	</div>
</body>
</html>