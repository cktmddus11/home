<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������</title>
<script src="https://kit.fontawesome.com/8694cef49f.js"
	crossorigin="anonymous"></script>
<style type="text/css">
#board, #grade {
	float: left;
	width: 47%;
	margin-right: 20px;
	margin-left: 20px;
}

#subject ,#evaluation,{
	float: left;
	width: 47%
}

@media ( max-width : 700px) {
	#board, #evaluation, #subject, #grade {
		margin: auto;
		float: none;
		width: auto;
	}
}
a {
	text-decoration:none;
	color : #000;
}
</style>
<script>
$(function() {
	
	$.ajax({
		type : "POST",
		url : "${path}/member/gradeview2.do",
		success : function(data) {
			console.log(data);
			$("#grade2").html(data);
			$("#setting").click(function() {
				if ($("#scoresetting").css("display") == "none") {
					$('#scoresetting').css("display", "block")
				} else {
					$('#scoresetting').css("display", "none")
				}
			})
		},
		error : function(e) {
			alert(e.status);
		}
	})

})
function writeform2click(a){

	var subjectno = a;
	console.log($('select[name=select2]').val(),  subjectno)
	location.href="${path}/member/writeForm2.do?no="+subjectno+"&semester="+$('select[name=select2]').val();
}

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
}


	
</script>
</head>
<body>
	<!-- �����Խ��� -->
	<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> <a href="${path}/board/list.do1">�����Խ���</a>
		</div>
		<div class="card-body">
				<table class="w3-table-all">
				<tr>
					<td>�ۼ���</td>
					<td>����</td>
					<td>��õ��</td>
					<td>��ȸ��</td>
				</tr>
				<c:forEach var="board" items="${list3}" varStatus="status">
				<c:if test="${status.index le 6}">
				<tr> 
					<td><i class="fab fa-hotjar"></i>&nbsp;${board.nickname}</td>
					<td><a href="${path}/board/info.do1?num=${board.num}">${board.title}</a></td>
					<td>${board.up}</td>
					<td>${board.readcnt}</td>
				</tr>
				</c:if>
				</c:forEach>
				</table>
		</div>
		<div class="card-footer small text-muted">�����ο� �۾���</div>
	</div>
	<!-- ������ ���� ����Ʈ ������ ������ �ۼ��̵�-->
	<div class="card mb-3" id="subject">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> ���� ����
		</div>
		<div class="card-body">
		<select name="select2" onchange="semester(this.value)">
				<option value="1-1" <c:if test="${semester3 eq '1-1'}">selected</c:if>>1�г� 1�б�</option>
				<option value="1-2" <c:if test="${semester3 eq '1-2'}">selected</c:if>>1�г� 2�б�</option>
				<option value="2-1" <c:if test="${semester3 eq '2-1'}">selected</c:if>>2�г� 1�б�</option>
				<option value="2-2" <c:if test="${semester3 eq '2-2'}">selected</c:if>>2�г� 2�б�</option>
				<option value="3-1" <c:if test="${semester3 eq '3-1'}">selected</c:if>>3�г� 1�б�</option>
				<option value="3-2" <c:if test="${semester3 eq '3-2'}">selected</c:if>>3�г� 2�б�</option>
				<option value="4-1" <c:if test="${semester3 eq '4-1'}">selected</c:if>>4�г� 1�б�</option>
				<option value="4-2" <c:if test="${semester3 eq '4-2'}">selected</c:if>>4�г� 2�б�</option>
			</select><br>
			<br>
			<table id="change" class="w3-table-all" style="width : 100%;">
				<tr>
					<td>����</td>
					<td>������ �ۼ�</td>
				</tr>
				<c:if test="${!empty gradeInfo}">
				<c:forEach var = "list" items="${gradeInfo}">
				<tr>
					<input type="hidden" name="subject_no" value="${list.subject_no}">
					<td><a href="subjectview.do?no=${list.subject_no}">${list.subject}</a></td>
				<td><button id="btn2" onclick="return writeform2click(${list.subject_no})">������ �ۼ�</button></td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty gradeInfo}">
					<tr>
						<td colspan="2">�������� �ۼ��Ϸ��� ��������-������������ ������ ����ؾ��մϴ�</td>
					</tr>
				</c:if>
			</table>
		
		
		</div>

		<div class="card-footer small text-muted">������ �ش� ���� ������ �ۼ����� �̵�</div>
	</div>
	<div id="grade2"></div>
	<!-- �а� ���þ��� �ֱ� �ۼ��� ������  -->
	<div class="card mb-3" id="evaluation">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> �ۼ��� ������
		</div>
		<div class="card-body">
			<table class="w3-table-all" style="width: 100%">
				<tr>
					<th>���̵�</th>
					<th>�а���</th>
					<th>�����</th>
					<th>������</th>
				</tr>
				<c:forEach items="${list2}" var="a" varStatus="status">
					<c:if test="${status.index le 6}">
					<tr>
						<td>${fn:substring(a.mem_id, 0,3)}**</td>
						<td>${a.dept}</td>
						<td><a href="subjectview.do?no=${a.subject_no}">${a.subject}</a></td>
						<td>${fn:substring(a.eval_text, 0, 20)}</td>
					</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
		<div class="card-footer small text-muted">�б� ���� �������� ���� �ֽ��ϴ�</div>
	</div>
	<!-- ���� ����Ȯ�� ������ ���� �󼼺��� �������� -->
	

</body>
</html>