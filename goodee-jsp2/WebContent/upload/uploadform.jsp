<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- ���Ͼ��ε� �� �ݵ�� 
enctype="multipart/form-data" �����ؾ���
=> �Ķ���� ������ ���õ� ������ ������� ������ �����ϵ��� ����

method="post"���� ��

���ǻ���
	upload.jsp ������������ request��ü�� ����� �� ����.
	cos.jsp ���Ͽ� ������ MultipartRequest ��ü�� ����Ͽ�
	���Ķ���Ϳ� ������ ������ ����� �� �ִ�. 	
 -->
<title>���� ���ε� ����</title>
</head>
<body>
	<form action="upload.jsp" method="post"
	enctype="multipart/form-data">
		<table>
			<tr>
				<th>�ø����</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="����">
			</tr>
		</table>
	</form>
</body>
</html>