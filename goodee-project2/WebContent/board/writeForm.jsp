<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:set var="path" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src= "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<title>�Խ��� �۾���</title>
<script>
	function inputcheck(){
		f = document.f;
		if(f.title.value==""){
			alert("������ �Է��ϼ���.");
			f.subject.focus(); 
			return false;
		}
/* 		if(f.content.value==""){
			alert("������ �Է��ϼ���.");
			f.content.focus();
			return;
		}
 */		
 		return true;
	}
</script>
</head>
<body>
<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> �����Խ���
		</div>
		<div class="card-body">
			<form action="write.do1" method="post" enctype="multipart/form-data" name="f">
		<table class="w3-table-all">
			<caption> �Խ��� �۾���	</caption>
			<input type="hidden" name="mem_id" value="${mem.mem_id}"/>
			<tr>
				<td>�г���</td>
				<td>${mem.mem_nickname}</td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="title"
				style="width : 100%;"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><textarea rows="15" name="content" id="content1"></textarea></td>
			</tr>               
			<script>
				CKEDITOR.replace("content1", {
					filebrowserImageUploadUrl : "imgupload.do1"
					//filebrowserImageUploadUrl : �̹��� ���ε� ����
					//imgupload.do ; ���ε带 ���� url���� 
				});
			</script>
			<tr>
				<td>÷������</td>
				<td><input type="file" name="file1"></td>
			</tr>		
			<tr>
				<td colspan="2"><button onclick="javascript:inputcheck()">�Խù� ���</button>				
			</tr>	
		</table>
	</form>
		</div>
		<div class="card-footer small text-muted">�����ο� �۾���</div>
	</div>
	
</body>
</html>