<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<script type="text/javascript">
function pwclose(){
	self.close();
}
</script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	&nbsp; 
	**${pw}
	<br>
	<input type="button" value="닫기" onclick="javascript:pwclose()">
</body>
</html>