<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="../decorator/css/sb-admin.css" rel="stylesheet">
<script>
function check(f){
	if(f.afterpass.value != f.checkafterpass.value){
		alert("변경 비밀번호와 변경 비밀번호 재입력이 다릅니다.");
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
			<i class="fas fa-chart-area"></i> 비밀번호 변경
		</div>
		<div class="card-body">
			<form action="password.do" method="post" name="f"
				onsubmit="return check(this)">
				<!-- <input type="hidden" name="id2" value=""> -->
				<table class="w3-table-all">
					
					<tr>
						<th>현재 비밀번호</th>
						<td><input type="password" name="beforepass" />
					</tr>
					<tr>
						<th>변경 비밀번호</th>
						<td><input type="password" name="afterpass" />
					</tr>
					<tr>
						<th>변경 비밀번호 재입력</th>
						<td><input type="password" name="checkafterpass" />
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="비밀번호 변경"></td>
					</tr>
				</table>
			</form>


		</div>
		<div class="card-footer small text-muted">비밀번호를 변경하세요</div>
	</div>
</body>
</html>