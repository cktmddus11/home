<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ȸ������</title>

<!-- Custom fonts for this template-->
<link href="../decorator/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="../decorator/css/sb-admin.css" rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script type="text/javascript">
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	open("pictureForm.do", "", op);
}

	function check() {
		var f = document.f;
		if (f.id.value == "") {
			alert("���̵� �Է����ּ���.");
			return false;
		}
		if(f.idDuplication.value != "idCheck"){
			alert("���̵� �ߺ�üũ�� ���ּ���");
			return false;
		}
		
		if (f.password.value == "") {
			alert("��й�ȣ�� �Է����ּ���.");
			return false;
		}
		if (f.name.value == "") {
			alert("�̸��� �Է����ּ���.");
			return false;
		}
		if (f.nickname.value == "") {
			alert("������ �Է����ּ���.");
			return false;
		}
		if (f.birth.value == "") {
			alert("��������� �Է����ּ���.");
			return false;
		}
		if (f.select1.value == "") {
			alert("�б��� �������ּ���.");
			return false;
		}
		if (f.select2.value == "") {
			alert("�а��� �������ּ���.");
			return false;
		}
		if (f.password.value != f.password2.value) {
			alert("��й�ȣ�� Ȯ�����ּ���");
			return false;
		}
		f.submit();
	}
	// ���̵� �ߺ�üũ ȭ�� open
	function openIdChk(){
		window.name = "parentForm"
		window.open("IdCheckForm.do", 
				"chkForm","width=500, height = 300, resizable=no, scrollbars=no");
	}
	// ���̵� �Է�â�� �� �Է½� hidden�� idUncheck�� �����Ѵ�.
	// �̷��� �ϴ� ������ �ߺ�üũ �� �ٽ� ���̵� â�� ���ο� ���̵� 
	// �Է����� �� �ٽ� �ߺ� üũ�� �ϵ��� �Ѵ�. 
	function inputIdChk(){
		document.f.idDuplication.value = "idUncheck";
	}
	function selectdept(s) {
		var $target = $("#select2");
		$.ajax({
			type : "POST",
			url : "${path}/member/select.do",
			data : {
				school_num : s.value
			},
			success : function(data) {
				$("#select2").html(data);
			},
			error : function(e) {
				alert(e.status);
			}

		})
	}
</script>
<style>
.bg-dark {
	background-color: #f67178 !important;
}
</style>
</head>

<body class="bg-dark">

	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">ȸ������</div>
			<div class="card-body">
			
				<form name="f" method="post" action="join.do">
				<input type="hidden" name="picture" value="">
				<table style="width : 100%">
					<tr>
					<td><div class="form-group" >
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" name="id" id="userInfo" class="form-control"
										required="required" onkeydown="inputIdChk()"> <label for="id">���̵�</label>	
								</div>
								
							</div>
							<div>
								<input type="button" value="�ߺ�Ȯ��" onclick="openIdChk()">
								<input type="hidden" name="idDuplication" value="idUncheck"><!-- idUncheck �ߺ�üũ ���� ó�� -->
							</div>
						</div>
					</div>
					</td>
					</tr>
					<tr>
					<td>
			
				<img src="" width="200" height="200" id="pic" style="float : float"><br>
				<a href="javascript:win_upload()" style="text-align : right">�������</a>
				<br>
				</td>
				</tr>
					
				<tr>
				
					<td>	
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" name="name" class="form-control"
										required="required"> <label for="name">�̸�</label>
								</div>
							</div>
						</div>
					</div>
					</td>
					
				
					</tr>
					<tr>
					<td>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="password" id="password" name="password"
										class="form-control" required="required"> <label
										for="password">��й�ȣ</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="password" id="password2" name="password2"
										class="form-control" required="required" autofocus="autofocus">
									<label for="password2">��й�ȣ Ȯ��</label>
								</div>
							</div>
						</div>
					</div>
					</td>
					</tr>
					<tr>
					<td>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" name="nickname" class="form-control"
										required="required"> <label for="nickname">�г���</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" name="birth" class="form-control"
										required="required"> <label for="birth">�������</label>
								</div>
							</div>
						</div>
					</div>
</td>
</tr>
<tr>
<td>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<select id="select1" name="select1" onchange="selectdept(this)">
										<option value="">==����==</option>
										<c:forEach var="s" items="${select_info}">
											<option value="${s.school_num}">${s.school}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<select id="select2" name="select2">
										<option value="">==����==</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					</td>
					</tr>
					<tr><td>
					<a class="btn btn-primary btn-block" href="#"
						onclick="return check()">Register</a></td></tr>
						</table>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="loginForm.do">Login Page</a> <a
						class="d-block small" href="forgot-password.html">Forgot
						Password?</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../decorator/vendor/jquery/jquery.min.js"></script>
	<script src="../decorator/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../decorator/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
