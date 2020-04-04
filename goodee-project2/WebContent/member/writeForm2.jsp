<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="list4" value="${requestScope.list4}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>강의평 작성2</title>
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
		alert("과제를 선택하세요.");
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
		alert("성적을 선택하세요.");
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
		alert("출결을 선택하세요.");
		f.attendance_info[0].focus();
		return false;
	}
	if(f.eval_text.value == ""){
		alert("강의평을 작성하세요");
		f.eval_text.focus();
		return false;
	}
	
	//별점
	var sum = 0;
	var len = $(".starR1.on").length+$(".starR2.on").length;
	for(i = 0;i<len;i++){
		sum = sum + 0.5;
	}
	
	if(sum == 0){
		alert("총점(별점)을 선택해주세요");
		return false;
	}
	
	var checkmsg = "강의평 작성시 수정이 불가능 합니다. 저장하시겠습니까?";
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
				alert("저장성공");
				location.href="writeForm.do";
			},
			error : function(e) {
				alert(e.status);
		 	}
		})
	}else{
		alert("취소하셨습니다.");
		return false;
	}
	
	
}
</script>
</head>
<body>
	<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 강의평 작성
		</div>
		<div class="card-body">
			<h1>${list4[0].subject} 강의평 작성</h1>
			<form method="post" action="#" name="f">
				<table id="table3" class="w3-table-all" style="width: 100%;">
					<input type="hidden" value="${list4[0].subject_no}">
					<input type="hidden" name="semester"value="${semester}"> 
					<tr>
						<th>총점</th>
						<th><div class="starRev">
								<span class="starR1">별1_왼</span> <span class="starR2">별1_오</span>
								<span class="starR1">별2_왼</span> <span class="starR2">별2_오</span>
								<span class="starR1">별3_왼</span> <span class="starR2">별3_오</span>
								<span class="starR1">별4_왼</span> <span class="starR2">별4_오</span>
								<span class="starR1">별5_왼</span> <span class="starR2">별5_오</span>
							</div></th>
						<th>강의평</th>
					</tr>
					<tr>
						<td>과제</td>
						<td><input type="radio" name="homework_info" value="1">많음
							<input type="radio" name="homework_info" value="2">보통 <input
							type="radio" name="homework_info" value="3">적음</td>
						<td rowspan="3"><textarea name="eval_text" row="7"
								style="width: 100%; height: 100px"></textarea>
					</tr>
					<tr>
						<td>성적</td>
						<td><input type="radio" name="grade_info" value="1">잘줌
							<input type="radio" name="grade_info" value="2">보통 <input
							type="radio" name="grade_info" value="3">깐깐</td>
					</tr>
					<tr>
						<td>출결</td>
						<td><input type="radio" name="attendance_info" value="1">직접호명
							<input type="radio" name="attendance_info" value="2">전자출결</td>
					</tr>
				</table>
				<br>
				<button id="btn3" onclick="return check()">강의평 작성</button>
			</form>
		</div>
		<div class="card-footer small text-muted">자유로운 글쓰기</div>
	</div>


</body>
</html>