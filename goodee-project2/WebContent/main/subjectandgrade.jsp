<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ������ ���� ����Ʈ ������ ������ �ۼ��̵�-->   
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
			<i class="fas fa-chart-area"></i> ���� ����
		</div>
		<div class="card-body">
		<select name="select2" onchange="semester(this.value)">
				<option value="1-1">1�г� 1�б�</option>
				<option value="1-2">1�г� 2�б�</option>
				<option value="2-1">2�г� 1�б�</option>
				<option value="2-2">2�г� 2�б�</option>
				<option value="3-1">3�г� 1�б�</option>
				<option value="3-2">3�г� 2�б�</option>
				<option value="4-1">4�г� 1�б�</option>
				<option value="4-2">4�г� 2�б�</option>
			</select><br>
			<br>
			<table id="change" class="w3-table-all" style="width : 100%;">
				<thead>
				<tr>
					<th>����</th>
					<th>������ �ۼ�</th>
				</tr>
				</thead>
				<tbody>
					
				</tbody>
				<%-- <c:if test="${!empty gradeInfo}">
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
				</c:if> --%>
			</table>
		
		
		</div>

		<div class="card-footer small text-muted">������ �ش� ���� ������ �ۼ����� �̵�</div>
	</div>
	<!--  ������Ȳ -->
	<div id="grade2"></div>