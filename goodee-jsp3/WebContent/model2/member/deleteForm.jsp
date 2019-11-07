<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원탈퇴 비밀번호 입력 화면 </title>
<link rel = "stylesheet" href="../../css/main.css">
<script>
function check(){
	if(confirm("탈퇴하시겠습니까?") != 0){
		return true;
	}else{
		alert("탈퇴를 취소하셨습니다.");
		return false;
	}
}
</script>
</head>
<body>
	<form action="delete.me" method="post" onsubmit = "return check()">
		<input type="hidden" name="id" value="${param.id}">
		<table>
			<caption>회원 비밀번호 입력</caption>
			<tr>
				<th> 회원 비밀번호 입력</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="탈퇴하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>