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
<script src="https://kit.fontawesome.com/8694cef49f.js" crossorigin="anonymous"></script>
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
$(function() { // ȭ�� �ε��Ǹ� ������ �Լ�
	// ������Ȳ �ε�
	grade();
	// �����Խ��� �ε�
	boardlist();
	// ���� ����Ʈ �ε�
	subjectlist();
	// ������ ����Ʈ �ε�
	evallist();
})
// ������Ȳ �Լ�
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
			if(data.success){
				var list3 = data.list3;
				var html = "";
				var boardtable = $("#boardtable > tbody")
				$.each(list3, function(idx,val){
					boardtable.append($('<td>',	{html : "<i class='fab fa-hotjar'></i>"+val.}))
					  .append($('<td>',	{html : "<img src='"+val.STF_PT_RT+"' class='profileImg'/>"}))
					  .append($('<td>',	{text : val.STF_NM}))
					  .append($('<td>',	{text : val.RNK_NM}))
					  .append($('<td>',	{text : val.DPT_NM})));
				})
			}else{
				var message = data.message;
				
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
			
		},
		error : function(e) {
			alert(e.status);
		}
	})
}

</script>
</head>
<body>
	<!-- 1. �����Խ��� -->
	<%@ include file="/main/board.jsp" %>
	<!-- 2. ������ ���� ����Ʈ (������ ������ �ۼ��̵�), 3. ������Ȳ-->
	<%@ include file="/main/subjectandgrade.jsp" %>
	<!-- 4. �а� ���þ��� �ֱ� �ۼ��� ������  -->
	<%@ include file="/main/evallist.jsp" %>
	

</body>
</html>