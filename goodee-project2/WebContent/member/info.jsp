<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내 정보</title>
<style type="text/css">
#my {
	float : left;
	width : 80%;
}

@media ( max-width : 700px) {
	#my {
		margin: auto;
		float: none;
		width: auto;
	}
}
</style>
<script>

function win_updatepw(){
	var op = "width=500, height=230, left=50, top=150";
	nw = open("passwordForm.do", "pw", op);
	<%-- nw.onload = function(){ // session으로 id하면 이거 할필요없음 
			nw.document.f.id2.value = "<%=dao.getId() %>"; 
	} --%>
}
function secession(){
	$.ajax({
		url : "${path}/member/secession.do",
		type : "POST", 
		success : function(data){
			alert(data),
			location.href='logout.do'
		}, error : function(e){
			alert(e.status);
		}
	})
}
</script>
</head>
<body>
	<div class="card mb-3" id="my">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 내 정보
		</div>
		<div class="card-body">
			<table class="w3-table-all">
			<input type="hidden" name="picture"value=""/>
				<tr>
					<td rowspan="0">
					<img src="picture/${mem.mem_img}" width="150"
						height="180">
						
						</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${mem.mem_id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${mem.mem_name}</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${mem.mem_birth}</td>
				</tr>
				<tr>
					<th>학교</th>
					<td>${mem.school}</td>
				</tr>
				<tr>
					<th>학과</th>
					<td>${mem.mem_dept}</td>
				</tr>
				<tr>
					<th>별명</th>
					<td>${mem.mem_nickname}</td>
				</tr>
				<tr>
					<td colspan="2"><a href="${path}/board/list.do1?id=${mem.mem_id}">[내 작성글]</a>
					<a href="" onclick="win_updatepw()">[비밀번호 수정]</a> <c:if
							test="${info.id != 'admin' && sessionScope.login != 'admin'}">
							<a href="#" onclick="secession()">[회원탈퇴]</a>
						</c:if></td>
				</tr>
			</table>
		</div>
		<div class="card-footer small text-muted">내 정보 관리</div>
	</div>
</body>
</html>