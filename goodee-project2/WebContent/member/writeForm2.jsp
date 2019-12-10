<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list4" value="${requestScope.list4}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �ۼ�2</title>
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
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
})
function check(){
	var value1 = null;
	for(var i = 0;i<f.homework_info.length;i++){
		if(f.homework_info[i].checked == true){
			value1 = f.homework_info[i].value;
		}
	}

	if(value1 == null){
		alert("������ �����ϼ���.");
		f.homework_info[0].focus();
		return false;
	}
	var value2 = null;
	for(var i = 0;i<f.grade_info.length;i++){
		if(f.grade_info[i].checked == true){
			value2 = f.grade_info[i].value;
		}
	}

	if(value2 == null){
		alert("������ �����ϼ���.");
		f.grade_info[0].focus();
		return false;
	}
	var value3 = null;
	for(var i = 0;i<f.attendance_info.length;i++){
		if(f.attendance_info[i].checked == true){
			value3 = f.attendance_info[i].value;
		}
	}

	if(value3 == null){
		alert("����� �����ϼ���.");
		f.attendance_info[0].focus();
		return false;
	}
	if(f.eval_text.value == ""){
		alert("�������� �ۼ��ϼ���");
		f.eval_text.focus();
		return false;
	}
	
	//����
	var sum = 0;
	var len = $(".starR1.on").length+$(".starR2.on").length;
	for(i = 0;i<len;i++){
		sum = sum + 0.5;
	}
	
	if(sum == 0){
		alert("����(����)�� �������ּ���");
		return false;
	}
	
	var checkmsg = "������ �ۼ��� ������ �Ұ��� �մϴ�. �����Ͻðڽ��ϱ�?";
	if(confirm(checkmsg) == true){
		$.ajax({
			type : "POST",
			url : "${path}/member/writesubmit.do",
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			data : {
				homework_info : value1,
				grade_info : value2,
				attendance_info : value3,
				score : sum,
				eval_text : f.eval_text.value,
				subject_no : ${list4[0].subject_no},
				semester : $("input[name=semester]").val(),
			}, 
			success : function(data) {
				alert("���强��");
				location.href="writeForm.do";
			},
			error : function(e) {
				alert(e.status);
		 	}
		})
	}else{
		alert("����ϼ̽��ϴ�.");
		return false;
	}
	
	
}
</script>
</head>
<body>
	<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> ������ �ۼ�
		</div>
		<div class="card-body">
			<h1>${list4[0].subject} ������ �ۼ�</h1>
			<form method="post" action="#" name="f">
				<table id="table3" class="w3-table-all" style="width: 100%;">
					<input type="hidden" value="${list4[0].subject_no}">
					<input type="hidden" name="semester"value="${semester}"> 
					<tr>
						<th>����</th>
						<th><div class="starRev">
								<span class="starR1">��1_��</span> <span class="starR2">��1_��</span>
								<span class="starR1">��2_��</span> <span class="starR2">��2_��</span>
								<span class="starR1">��3_��</span> <span class="starR2">��3_��</span>
								<span class="starR1">��4_��</span> <span class="starR2">��4_��</span>
								<span class="starR1">��5_��</span> <span class="starR2">��5_��</span>
							</div></th>
						<th>������</th>
					</tr>
					<tr>
						<td>����</td>
						<td><input type="radio" name="homework_info" value="1">����
							<input type="radio" name="homework_info" value="2">���� <input
							type="radio" name="homework_info" value="3">����</td>
						<td rowspan="3"><textarea name="eval_text" row="7"
								style="width: 100%; height: 100px"></textarea>
					</tr>
					<tr>
						<td>����</td>
						<td><input type="radio" name="grade_info" value="1">����
							<input type="radio" name="grade_info" value="2">���� <input
							type="radio" name="grade_info" value="3">���</td>
					</tr>
					<tr>
						<td>���</td>
						<td><input type="radio" name="attendance_info" value="1">����ȣ��
							<input type="radio" name="attendance_info" value="2">�������</td>
					</tr>
				</table>
				<br>
				<button id="btn3" onclick="return check()">������ �ۼ�</button>
			</form>
		</div>
		<div class="card-footer small text-muted">�����ο� �۾���</div>
	</div>


</body>
</html>