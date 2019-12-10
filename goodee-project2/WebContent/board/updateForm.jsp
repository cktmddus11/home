<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%--
1. num �Ķ���� ������ ������ ����. 
2. num�� �̿��Ͽ� db���� �Խù� ������ ��ȸ
	Board b = new BoardDao.selectOne(num)
3. ��ȸ�� ������ŰŰ
	void BoardDao.readcntadd(num)
4. 2������ ��ȸ�� �Խù� ȭ�鿡 ���
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ����</title>
<script type="text/javascript" src= "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script>
function file_delete(){
	document.f.file2.value=""; // hidden���ִ°� ����
	file_desc.style.display ="none"; // id�� �����θ� ȭ�鿡�� ����
}
</script>

</head>
<body>
	<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> �����Խ���
		</div>
		<div class="card-body">
		<form action="update.do1" name = "f" method="post" 
	enctype="multipart/form-data">
			<table class="w3-table-all">
				<input type="hidden" name="num" value="${b.num}">
			<input type="hidden" name="file2" 
			value="${empty b.file?'':b.file}">
				<tr>
					<th width="20%">�г���</th>
					<td width="80%" style="text-align: left">${b.nickname}</td>
				</tr>
				<tr>
					<th>����</th>
					<td style="text-align: left">
					<input type="text" name="title" style="width : 100%"value="${b.title}"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><textarea row="15" name="content"  id="content1" style="width:100%; height : 200px;">${b.content}</textarea></td>
					<script>
				CKEDITOR.replace("content1", {
					filebrowserImageUploadUrl : "imgupload.do1"
					//filebrowserImageUploadUrl : �̹��� ���ε� ����
					//imgupload.do ; ���ε带 ���� url���� 
				});
			</script>
				</tr>	
				<tr>
				<td>÷������</td>
					<td style="text-align : left">
					<c:if test="${!empty b.file}">
					<div id="file_desc">${b.file}
					<a href="javascript:file_delete()">[÷������ ����]</a>
					</div>
					</c:if>
					<input type="file" name="file"></td>
				</tr>
				<tr>
					<td colspan="2">
					<a href="javascript:document:f.submit()">[�Խù�����]</a>
				</tr>
			</table>
			</form>
			
		</div>
		<div class="card-footer small text-muted">�����ο� �۾���</div>
	</div>

</body>
</html>