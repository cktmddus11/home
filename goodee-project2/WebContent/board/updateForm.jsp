<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%--
1. num 파라미터 정보를 변수에 저장. 
2. num을 이용하여 db에서 게시물 정보를 조회
	Board b = new BoardDao.selectOne(num)
3. 조회수 증가시키키
	void BoardDao.readcntadd(num)
4. 2번에서 조회된 게시물 화면에 출력
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 수정</title>
<script type="text/javascript" src= "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script>
function file_delete(){
	document.f.file2.value=""; // hidden에있는거 지움
	file_desc.style.display ="none"; // id가 저거인를 화면에서 지움
}
</script>

</head>
<body>
	<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 자유게시판
		</div>
		<div class="card-body">
		<form action="update.do1" name = "f" method="post" 
	enctype="multipart/form-data">
			<table class="w3-table-all">
				<input type="hidden" name="num" value="${b.num}">
			<input type="hidden" name="file2" 
			value="${empty b.file?'':b.file}">
				<tr>
					<th width="20%">닉네임</th>
					<td width="80%" style="text-align: left">${b.nickname}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td style="text-align: left">
					<input type="text" name="title" style="width : 100%"value="${b.title}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea row="15" name="content"  id="content1" style="width:100%; height : 200px;">${b.content}</textarea></td>
					<script>
				CKEDITOR.replace("content1", {
					filebrowserImageUploadUrl : "imgupload.do1"
					//filebrowserImageUploadUrl : 이미지 업로드 설정
					//imgupload.do ; 업로드를 위한 url지정 
				});
			</script>
				</tr>	
				<tr>
				<td>첨부파일</td>
					<td style="text-align : left">
					<c:if test="${!empty b.file}">
					<div id="file_desc">${b.file}
					<a href="javascript:file_delete()">[첨부파일 삭제]</a>
					</div>
					</c:if>
					<input type="file" name="file"></td>
				</tr>
				<tr>
					<td colspan="2">
					<a href="javascript:document:f.submit()">[게시물수정]</a>
				</tr>
			</table>
			</form>
			
		</div>
		<div class="card-footer small text-muted">자유로운 글쓰기</div>
	</div>

</body>
</html>