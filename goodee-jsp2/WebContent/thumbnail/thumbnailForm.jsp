<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<%--
	thumbnail �̹��� ���� : ū �̹����� ���� �̹����� ����.
 --%>
<title>���� �̹��� �ø���</title>
</head>
<body>
	<form action="thumbnail.jsp" method="post" 
		enctype="multipart/form-data">
		�����̹��� : <input type="file" name="picture">
		<input type="submit" value="������̹��� ����">
	</form>
</body>
</html>