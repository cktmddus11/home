<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���</title>
<link href="../decorator/css/sb-admin.css" rel="stylesheet">
</head>
<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> ���� ���ε�
		</div>
		<div class="card-body">
			<h3>���� ���ε�</h3>
	<form action="picture.do" method="post" enctype="multipart/form-data">
		<input type ="file" name="picture">
		<input type="submit" value="�������">
	</form>
		</div>
		<div class="card-footer small text-muted">���� ���ε�</div>
	</div>

</html>