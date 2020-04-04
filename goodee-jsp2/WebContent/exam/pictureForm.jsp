<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사진 파일 등록</title>
<link rel="styleSheet" href="./css/csy.css">
<script>
	function checkinput(f) {
		var a = f.file1.value;
		if (a.indexOf(".") >= 0) {
			a = a.substring(a.lastIndexOf("\\") + 1, a.length);
			opener.document.getElementById("img").src = "upload/" + a;
			opener.document.getElementById("file2").value = "upload/" + a;
			self.close();
			return true;
		} else {
			opener.document.getElementById("img").src = ""
			self.close();
			return true;
		}
	}
</script>
</head>
<body>
	<form action="picture.jsp" method="post" name="f"
		onsubmit="return checkinput(this)" enctype="multipart/form-data">
		<table>
			<tr>
				<th>파일</th>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>

		</table>
	</form>
</body>
</html>
