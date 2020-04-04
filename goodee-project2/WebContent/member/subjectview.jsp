<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ���� ������</title>
<script type="text/javascript"
	src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<style>
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
</style>
<script>
$(function(){

	var star = $('.starRev span')
	var score2 = $("#score").val();
	var score = score2 * 2 // 3.5 =>7��

	
	$('.starRev').find('span').each(function(i, e){
	    if(i < score){
			$(this).addClass('on');
	    }
	});

	$.each(function (index, item) {

				console.log($(star).parent().children('span').index());
			 /*  $(star).parent().children('span').removeClass('on');
			  $(star).addClass('on').prevAll('span').addClass('on'); */
			})
	
	
	
})
 /* function graphs() {
	var a = ${list[0].subject_no};
	$.ajax({
		type : "POST",
		url : "${path}/member/graph3.do",
		data : {subject_no : a},
		success : function(data) {
			console.log(data);
			//barGraphprint(data);
			
		},
		error : function(e) {
			alert(e.status);
		}
	})
}
$(document).ready(function() {
	graphs();
})  */
</script>
</head>
<body>
	<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> ������ �� ������
		</div>
		<div class="card-body">
			<h2>${list[0].subject} &nbsp;������</h2>
			<input type="hidden" id="score" value="${list6}">
			<div style="width: 45%; float: left">
				<table id="table3" class="w3-table-all" style="width: 100%">
					<tr>
						<th>����&nbsp;&nbsp;<c:if test="${list6 eq 0.0}">
						�ۼ��� �������� �����ϴ�.
						</c:if>
							<div class="starRev">
						<span class="starR1">��1_��</span>
						<span class="starR2">��1_��</span>
						<span class="starR1">��2_��</span>
						<span class="starR2">��2_��</span>
						<span class="starR1">��3_��</span>
						<span class="starR2">��3_��</span>
						<span class="starR1">��4_��</span>
						<span class="starR2">��4_��</span>
						<span class="starR1">��5_��</span>
						<span class="starR2">��5_��</span>
							
							</div>
						</th>
						<th></th>
					</tr>
					<tr>
						<td>����</td>
						<td>
						<c:forEach var="list" items="${list3}">
							<label>${list.homework} => ${list.cnt}</label>
						</c:forEach>
						</td>
						
					</tr>
					<tr>
						<td>����</td>
						<td><c:forEach var="list" items="${list4}">
							<label>${list.grade} => ${list.cnt}</label>
						</c:forEach> </td>
					</tr>
					<tr>
						<td>���</td>
						<td><c:forEach var="list" items="${list5}">
							<label>${list.attendance} => ${list.cnt}</label>
						</c:forEach></td>
					</tr>
				</table>
			</div>

			<div style="width: 50%; float: right;">
				<table class="w3-table-all">
					<tr>
						<td>���̵�</td>
						<td>�г�/�б�</td>
						<td>������</td>
					</tr>
					<c:if test="${!empty list}">
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${fn:substring(list.mem_id, 0,3)}**</td>
							<td>${list.semester} ������</td>
							<td>${list.eval_text}</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr><td colspan="2">�ۼ��� �������� �����ϴ�. </td></tr>
					</c:if>
				</table>
			</div>
		</div>
		<div class="card-footer small text-muted">�������� Ȯ���ϼ���</div>
	</div>


</body>
</html>