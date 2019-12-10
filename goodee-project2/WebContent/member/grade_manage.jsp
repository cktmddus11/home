<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
<style type="text/css">
#table1 {
	width: 50%;
}

@media ( max-width : 700px) {
	#grademanage {
		margin: auto;
		float: none;
		width: auto;
	}
}

#change tr:hover {
	background-color: #7e848380;
}
</style>
<script>
	/* 	$(function() {
	 $("#tradd").click(function() {
	 $.ajax({
	 type : "POST",
	 url : "${path}/member/select2.do",
	 success : function(data) {

	 console.log(data);
	 $("#table1").append(data);
	 },
	 error : function(e) {
	 alert(e.status);
	 }
	 })
	 })

	 }) */
	function check() {
		if (document.gradeform.semester.value == "") {
			alert("�б�/�г��� �������ּ���");
			return false;
		}
		return true;
	}
	function selectgrade(s) {
		console.log(s);
		$.ajax({
			type : "POST",
			url : "${path}/member/grade_info.do",
			data : {
				semester : s
			},
			success : function(data) {
				console.log(data);
				$("#table2").html(data);
				/* $("#change tr").dblclick(function(){
					var str = "";
					var arr = new Array();
				
					var tr = $(this); // ���� ���õ� <tr>
					var td = tr.children();
					
					td.each(function(i){
						arr.push(td.eq(i).text());
					});
					grade = arr[0];
					subject = arr[1];
					credit = arr[2];
					login = "${sessionScope.login}"
					
					var op = "width=500, height=150, left=50, top=150";
					var opener = open("updatedelete.do", "", op);
					opener.document.getElementById("grade").value = grade;
					
				}) */
			},
			error : function(e) {
				alert(e.status);
			}
		})
	}

	function deletegrade() {
		if (document.gradeform.semester.value == "") {
			alert("�б�/�г��� �������ּ���");
			return false;
		}
		//console.log($('input[name=semester2]').val());
		var con_test = confirm("������ �ۼ��� ������ �����˴ϴ�"
			+" ���� �Ͻðڽ��ϱ�?");
		if(con_test == true){
			$.ajax({
				type : "POST",
				url : "${path}/member/gradedelete.do",
				data : {
					semester : $('input[name=semester2]').val(),
					subject_no : $('input[name=subject_no]').val(),
				},
				success : function(data) {
					alert(data.trim())
					location.reload()
				},
				error : function(e) {
				  alert(e.status);
		       }
			});
		}
		else if(con_test == false){
		  return false;
		}
		
		return true;
	}
	
/* 		
	function gradeupdate(){

		$.ajax({
			type : "POST",
			url : "${path}/member/gradeupdate.do",
			data : {
				subject_no : $('input[name=subject_no]').val(),
				semester_code :  $('input[name=semester2]').val(),
			},
			success : function(data){
				var op = "width=500, height=300, left=600, top=200";
				var w = window.open("gradeupdate.do","", op);
				w.location.href="${path}/member/gradeupdate.do"
			},
			error : function(e) {
			  alert(e.status);
	       }
		});
			
		} */
	
	
</script>
</head>
<body>
	<div class="card mb-3" id="grademanage">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> ���� ����
		</div>
		<div class="card-body">

			<form name="gradeform" method="post" action="subjectinsert.do">
				<div>
					<div id="left" style="width: 15%; float: left;">
						<select id="semestr_code" name="semester" multiple size=6
							onchange="selectgrade(this.value)">
							<option value="1-1">1�г� 1�б�</option>
							<option value="1-2">1�г� 2�б�</option>
							<option value="2-1">2�г� 1�б�</option>
							<option value="2-2">2�г� 2�б�</option>
							<option value="3-1">3�г� 1�б�</option>
							<option value="3-2">3�г� 2�б�</option>
							<option value="4-1">4�г� 1�б�</option>
							<option value="4-2">4�г� 2�б�</option>
						</select>
					</div>
					<div id="right" style="width: 50%; float: left;">
						<table class="w3-table-all" id="table1">
							<tr>
								<td>����</td>
								<td colspan="2">���� ����</td>
								<td>���� ����</td>
							</tr>
							<tr>
								<td><select name="grade">
										<option value="4.5">A+</option>
										<option value="4.0">A0</option>
										<option value="3.5">B+</option>
										<option value="3.0">B0</option>
										<option value="2.5">C+</option>
										<option value="2.0">C0</option>
										<option value="1.5">D+</option>
										<option value="1.0">D0</option>
										<option value="0.0">F</option>
										<option value="-0.1">P</option>
										<option value="-0.2">NP</option>
								</select></td>

								<td colspan="2"><select name="subject">
										<c:forEach var="info" items="${subjectinfo}">
											<option
												value="${info.subject_no},${info.credit},${mem.school_num}">����
												: ${info.subject}, ���� : ${info.credit},���� :
												${info.professor}</option>
										</c:forEach>
								</select></td>
								<td><input type="submit" name="btn" value="���� ����"
									onclick="return check()"></td>
							</tr>
						</table>
					</div>
				</div>
				<br>
			</form>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			
			<div id="table2"></div>
		</div>
		<div class="card-footer small text-muted">���� �����ư�� ���� ������ �����ϼ���</div>
	</div>

</body>
</html>