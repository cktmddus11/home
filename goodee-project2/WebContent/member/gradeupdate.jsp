<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
	<div class="card mb-3" id="subject">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 己利 荐沥
		</div>
		<div class="card-body">
			<table id="change" class="w3-table-all">
			<tr>
					<td>荐诀</td>
					<td>己利</td>
			</tr>
			<tr>
					<td>${list[0].subject}</td>
					<td>${list[0].mem_grade}己利</td>
			</tr>
			</table>
		</div>
		<div class="card-footer small text-muted">己利 荐沥</div>
	</div>
</body>
</html>