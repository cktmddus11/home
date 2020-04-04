<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원사진 등록</title>
<link href="../decorator/css/sb-admin.css" rel="stylesheet">
</head>
<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 사진 업로드
		</div>
		<div class="card-body">
			<h3>사진 업로드</h3>
	<form action="picture.do" method="post" enctype="multipart/form-data">
		<input type ="file" name="picture">
		<input type="submit" value="사진등록">
	</form>
		</div>
		<div class="card-footer small text-muted">사진 업로드</div>
	</div>

</html>