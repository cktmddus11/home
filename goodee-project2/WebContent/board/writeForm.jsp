<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:set var="path" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src= "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<title>게시판 글쓰기</title>
<script>
	function inputcheck(){
		f = document.f;
		if(f.title.value==""){
			alert("제목을 입력하세요.");
			f.subject.focus(); 
			return false;
		}
/* 		if(f.content.value==""){
			alert("내용을 입력하세요.");
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
			<i class="fas fa-chart-area"></i> 자유게시판
		</div>
		<div class="card-body">
			<form action="write.do1" method="post" enctype="multipart/form-data" name="f">
		<table class="w3-table-all">
			<caption> 게시판 글쓰기	</caption>
			<input type="hidden" name="mem_id" value="${mem.mem_id}"/>
			<tr>
				<td>닉네임</td>
				<td>${mem.mem_nickname}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"
				style="width : 100%;"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" name="content" id="content1"></textarea></td>
			</tr>               
			<script>
				CKEDITOR.replace("content1", {
					filebrowserImageUploadUrl : "imgupload.do1"
					//filebrowserImageUploadUrl : 이미지 업로드 설정
					//imgupload.do ; 업로드를 위한 url지정 
				});
			</script>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="file1"></td>
			</tr>		
			<tr>
				<td colspan="2"><button onclick="javascript:inputcheck()">게시물 등록</button>				
			</tr>	
		</table>
	</form>
		</div>
		<div class="card-footer small text-muted">자유로운 글쓰기</div>
	</div>
	
</body>
</html>