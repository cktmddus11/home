<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã��</title>
<script type="text/javascript">
function pwclose(){
	self.close();
}
</script>
</head>
<body>
	<h2>��й�ȣ ã��</h2>
	&nbsp; 
	**${pw}
	<br>
	<input type="button" value="�ݱ�" onclick="javascript:pwclose()">
</body>
</html>