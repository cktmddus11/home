<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 수강한 과목 리스트 누르면 강의평 작성이동-->   
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
}
function writeform2click(a){

	var subjectno = a;
	console.log($('select[name=select2]').val(),  subjectno)
	location.href="${path}/member/writeForm2.do?no="+subjectno+"&semester="+$('select[name=select2]').val();
}
</script> 
<div class="card mb-3" id="subject">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 수강 과목
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
				<thead>
				<tr>
					<th>수업</th>
					<th>강의평 작성</th>
				</tr>
				</thead>
				<tbody>
					
				</tbody>
				<%-- <c:if test="${!empty gradeInfo}">
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
				</c:if> --%>
			</table>
		
		
		</div>

		<div class="card-footer small text-muted">누르면 해당 과목 강의평 작성으로 이동</div>
	</div>
	<!--  성적현황 -->
	<div id="grade2"></div>