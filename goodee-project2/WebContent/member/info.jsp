<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ����</title>
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
	<%-- nw.onload = function(){ // session���� id�ϸ� �̰� ���ʿ���� 
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
			<i class="fas fa-chart-area"></i> �� ����
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
					<th>���̵�</th>
					<td>${mem.mem_id}</td>
				</tr>
				<tr>
					<th>�̸�</th>
					<td>${mem.mem_name}</td>
				</tr>
				<tr>
					<th>�������</th>
					<td>${mem.mem_birth}</td>
				</tr>
				<tr>
					<th>�б�</th>
					<td>${mem.school}</td>
				</tr>
				<tr>
					<th>�а�</th>
					<td>${mem.mem_dept}</td>
				</tr>
				<tr>
					<th>����</th>
					<td>${mem.mem_nickname}</td>
				</tr>
				<tr>
					<td colspan="2"><a href="${path}/board/list.do1?id=${mem.mem_id}">[�� �ۼ���]</a>
					<a href="" onclick="win_updatepw()">[��й�ȣ ����]</a> <c:if
							test="${info.id != 'admin' && sessionScope.login != 'admin'}">
							<a href="#" onclick="secession()">[ȸ��Ż��]</a>
						</c:if></td>
				</tr>
			</table>
		</div>
		<div class="card-footer small text-muted">�� ���� ����</div>
	</div>
</body>
</html>