<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<script>
function idsend(d){
	opener.document.f.id.value = d;
	self.close();
}
</script>
</head>
<body>
	<h2>아이디</h2>
	&nbsp; 
	${id}**
	<br>
	<input type="submit" value="아이디 전송" onclick="idsend('${id}')">
	
</body>
</html>