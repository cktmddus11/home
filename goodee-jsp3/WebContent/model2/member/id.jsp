<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
<script>
function idsend(d){
	opener.document.f.id.value = d;
	self.close();
}
</script>
</head>
<body>
	<h2>���̵�</h2>
	&nbsp; 
	${id}**
	<br>
	<input type="submit" value="���̵� ����" onclick="idsend('${id}')">
	
</body>
</html>