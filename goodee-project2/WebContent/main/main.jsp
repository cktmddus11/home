<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인 페이지</title>
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
$(function() { // 화면 로딩되면 실행할 함수
	// 성적현황 로드
	grade();
	// 자유게시판 로드
	boardlist();
	// 과목 리스트 로드
	subjectlist();
	// 강의평 리스트 로드
	evallist();
})
// 성적현황 함수
function grade(){
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
}
function boardlist(){
	$.ajax({
		type : "POST",
		url : "${path}/main/boardlist.do",
		dataType: "json",
		success : function(data) {
			var boardtable = $("#boardtable > tbody")
			if(data.success){
				var list3 = data.list3;
				var html = "";
				
				$.each(list3, function(idx,val){
					boardtable.append($('<tr>')
					  .append($('<td>',	{html : "<i class='fab fa-hotjar'></i>"+"&nbsp;"+val.nickname}))
					  .append($('<td>',	{html : "<a href='${path}/board/info.do1?num="+val.num+"'>"+val.title+"</a>"}))
					  .append($('<td>',	{text : val.up}))
					  .append($('<td>',	{text : val.readcnt})))
				});
				
			}else{
				var message = data.message;
				boardtable.append('<tr><td colspan="4">'+message+'</td></tr>');
			}
			
		},
		error : function(e) {
			alert(e.status);
		}
	})
}
function subjectlist(){
	$.ajax({
		type : "POST",
		url : "${path}/main/subjectlist.do",
		dataType: "json",
		success : function(data) {
			var subjectlist = $("#change > tbody")
			var semester3 = data.semester3;
			$('select[name=select2]').val(semester3).prop("selected","selected");
			if(data.success){
				var gradeInfo = data.gradeInfo;
				var html = "";
				
				$.each(gradeInfo, function(idx,val){
					subjectlist.append($('<tr>')
					  .append($({html : "<input type='hidden' name='subject_no' value='"+val.subject_no+"'>"}))
					  .append($('<td>',	{html : "<a href='subjectview.do?no="+val.subject_no+">"+val.subject+"}</a>"}))
					  .append($('<td>',	{html : "<button id='btn2' onclick='return writeform2click("+val.subject_no+")>강의평 작성</button>"})))
				});
				
			}else{
				$("select[name=select2]").hide();
				$("select[name=select2]").next().hide();
				$("select[name=select2]").next().next().hide();
				
				var message = data.message;
				subjectlist.append('<tr><td colspan="2">'+message+'</td></tr>');
			}
		},
		error : function(e) {
			alert(e.status);
		}
	})
}
function evallist(){
	$.ajax({
		type : "POST",
		url : "${path}/main/evallist.do",
		dataType: "json",
		success : function(data) {
			var evallist = $("#evaltable > tbody")
			if(data.success){
				var list2 = data.list2;
				var html = "";
				
				$.each(list2, function(idx,val){
					var mem_id = val.mem_id.substring(0, 3)+"**"
					var eval_text = val.eval_text.substring(0, 20)
					evallist.append($('<tr>')
					  .append($('<td>', {text : mem_id}))
					  .append($('<td>', {text : val.dept}))
					  .append($('<td>',	{html : "<a href='subjectview.do?no='"+val.subject_no+"'>"+val.subject+"</a>"}))
					  .append($('<td>', {text : eval_text})))
				});
				
			}else{
				var message = data.message;
				subjectlist.append('<tr><td colspan="4">'+message+'</td></tr>');
			}
		},
		error : function(e) {
			alert(e.status);
		}
	})
}

</script>
</head>
<body>
	<!-- 1. 자유게시판 -->
	<%@ include file="/main/board.jsp" %>
	<!-- 2. 수강한 과목 리스트 (누르면 강의평 작성이동), 3. 성적현황-->
	<%@ include file="/main/subjectandgrade.jsp" %>
	<!-- 4. 학과 관련없이 최근 작성된 강의평  -->
	<%@ include file="/main/evallist.jsp" %>
	

</body>
</html>