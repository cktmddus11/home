<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- 파일업로드 시 반드시 
enctype="multipart/form-data" 설정해야함
=> 파라미터 정보와 선택된 파일의 내용까지 서버로 전송하도록 설정

method="post"여야 함

주의사항
	upload.jsp 페이지에서는 request객체를 사용할 수 없다.
	cos.jsp 파일에 설정된 MultipartRequest 객체를 사용하여
	ㅍ파라미터와 파일의 정보를 사용할 수 있다. 	
 -->
<title>파일 업로드 예제</title>
</head>
<body>
	<form action="upload.jsp" method="post"
	enctype="multipart/form-data">
		<table>
			<tr>
				<th>올림사람</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송">
			</tr>
		</table>
	</form>
</body>
</html>