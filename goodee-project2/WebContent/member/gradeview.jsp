<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>성적 상세보기</title>
<script type="text/javascript"
	src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script src="chart1.js"></script>
<style type="text/css">
table {
	width: auto;
}

#gradeview {
	float: left;
	width: 47%;
}

@media ( max-width : 700px) {
	#gradeview {
		margin: auto;
		float: none;
		width: auto;
	}
}

#board, #evaluation {
	float: left;
	width: 47%;
	margin-right: 20px;
	margin-left: 20px;
}

#subject, #grade {
	float: left;
	width: 47%
}
</style>
<script>
	function gradeview() {
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
	function semester(s) {
		$.ajax({
			
			
			type : "POST",
			url : "${path}/member/grade_info2.do",
			data : {
				semester : s
			},
			success : function(data) {
				console.log(data);
				$("#change").html(data);
			},
			error : function(e) {
				alert(e.status);
			}
		})
	}
	$(document).ready(function() {
		graphs();
		gradeview();
	})
	function graphs() {
		$.ajax("${path}/member/graph.do", {
			success : function(data) { //콜백함수
				lineGraphprint(data);

			},
			error : function(e) {
				alert("서버 오류:" + e.status);
			}
		})
		$.ajax("${path}/member/graph2.do", {
			success : function(data) { //콜백함수
				pieGraphprint(data);

			},
			error : function(e) {
				alert("서버 오류:" + e.status);
			}
		})

	}
</script>
</head>
<body>

	<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 성적
		</div>
		<div class="card-body">
			<div id="canvas1">
				<canvas id="piecanvas"></canvas>
			</div>
		</div>
		<div class="card-footer small text-muted">성적 변화</div>
	</div>
	<div class="card mb-3" id="gradeview">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 성적 상세보기
		</div>
		<div class="card-body">
			<select name="select2" onchange="semester(this.value)">
				<option value="1-1" <c:if test="${semester3 eq '1-1'}">selected</c:if>>1학년 1학기</option>
				<option value="1-2" <c:if test="${semester3 eq '1-2'}">selected</c:if>>1학년 2학기</option>
				<option value="2-1" <c:if test="${semester3 eq '2-1'}">selected</c:if>>2학년 1학기</option>
				<option value="2-2" <c:if test="${semester3 eq '2-2'}">selected</c:if>>2학년 2학기</option>
				<option value="3-1" <c:if test="${semester3 eq '3-1'}">selected</c:if>>3학년 1학기</option>
				<option value="3-2" <c:if test="${semester3 eq '3-2'}">selected</c:if>>3학년 2학기</option>
				<option value="4-1" <c:if test="${semester3 eq '4-1'}">selected</c:if>>4학년 1학기</option>
				<option value="4-2" <c:if test="${semester3 eq '4-2'}">selected</c:if>>4학년 2학기</option>
			</select><br> <br>
			<c:set var="gs" value="${requestScope.list2}" />
			<table id="change" class="w3-table-all">
				<tr>
					<td colspan="3" style="text-align: right">이수학점 :
						${gs[0].sum_credit} &nbsp;&nbsp;&nbsp; ${gs[0].grade_avg}/4.5</td>
				</tr>
				<tr>
					<td>성적</td>
					<td>수업</td>
					<td>학점</td>
					
				</tr>
				<c:forEach var="list" items="${gradeInfo}">
					<tr>
						<td>${list.grade}</td>
						<td>${list.subject}</td>
						<td>${list.credit}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="card-footer small text-muted">학년/학기별 성적으로 확인하세요</div>
	</div>
	<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 성적
		</div>
		<div class="card-body">
			<div id="canvas2">
				<canvas id="linecanvas"></canvas>
			</div>
		</div>
		<div class="card-footer small text-muted">성적 변화</div>
	</div>
	<div id="grade2"></div>
	

	
	
</body>
</html>