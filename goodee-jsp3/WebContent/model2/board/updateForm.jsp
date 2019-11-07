<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%--
 1. num ���� �Խù��� db���� ��ȸ�Ͽ� ȭ�� ����ϱ� 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel = "stylesheet" href="../../css/main.css">
<script>
function file_delete(){
	document.f.file2.value=""; // hidden���ִ°� ����
	file_desc.style.display ="none"; // id�� �����θ� ȭ�鿡�� ����
}
</script>
<title>����</title>
</head>
<body>
	<form action="update.do" name = "f" method="post" 
	enctype="multipart/form-data">
			<input type="hidden" name="num" value="${b.num}">
			<input type="hidden" name="file2" 
			value="${empty b.file1?'':b.file1}">
			<table>
				<caption>�Խ��� ���� ȭ��</caption>
				<tr>
					<td>�۾���</td>
					<td><input type="text" name="name" value="${b.name}"/></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pass"/></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="subject" value="${b.subject}"/></td>
				</tr>	
				<tr>
					<td>����</td>
					<td><textarea row="15" name="content">${b.content}</textarea></td>
				</tr>	
				<tr>
					<td>÷������</td>
					<td style="text-align : left">
					<c:if test="${!empty b.file1}">
					<div id="file_desc">${b.file1}
					<a href="javascript:file_delete()">[÷������ ����]</a>
					</div>
					</c:if>
					<input type="file" name="file1"></td>
				</tr>	
				<tr>
					<td colspan="2">
					<a href="javascript:document:f.submit()">[�Խù�����]</a>
				</tr>
			</table>
	
	</form>
</body>
</html>