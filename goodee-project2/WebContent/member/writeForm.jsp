<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>강의평 작성 강의 선택 페이지</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function semester(s){
	$.ajax({
		type : "POST",
		url : "${path}/member/subject_info.do",
		data : {semester : s}, 
		success : function(data) {
			console.log(data);
			$("#change").html(data);
		},
		error : function(e) {
			alert(e.status);
		}
	})
	return true;
}
function writeform2click(a){

	var subjectno = a;
	console.log($('select[name=select2]').val(),  subjectno)
	location.href="${path}/member/writeForm2.do?no="+subjectno+"&semester="+$('select[name=select2]').val();
}
</script>
<style>
#change tr:hover {background-color: #7e848380;}
#change a {color : #000000}
</style>
</head>
<body>
<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 강의평 작성 과목 선택
		</div>
		<div class="card-body">
			<select name="select2" onchange="semester(this.value)">
				<option value="1-1">1학년 1학기</option>
				<option value="1-2">1학년 2학기</option>
				<option value="2-1">2학년 1학기</option>
				<option value="2-2">2학년 2학기</option>
				<option value="3-1">3학년 1학기</option>
				<option value="3-2">3학년 2학기</option>
				<option value="4-1">4학년 1학기</option>
				<option value="4-2">4학년 2학기</option>
			</select><br>
			<br>
			<table id="change" class="w3-table-all" style="width : 100%;">
				<tr>
					<td>수업</td>
					<td>강의평 작성</td>
				</tr>
				<c:if test="${!empty gradeInfo}">
				<c:forEach var = "list" items="${gradeInfo}">
				<tr>
					<input type="hidden" name="subject_no" value="${list.subject_no}">
					<td><a href="subjectview.do?no=${list.subject_no}">${list.subject}</a></td>
					<td><button id="btn2" onclick="return writeform2click(${list.subject_no})">강의평 작성</button></td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty gradeInfo}">
					<tr>
						<td colspan="2">강의평을 작성하려면 학점계산기-성적관리에서 수업를 등록해야합니다</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div class="card-footer small text-muted">자유로운 글쓰기</div>
	</div>
</body>
</html>