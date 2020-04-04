<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Custom fonts for this template-->
<link href="../decorator/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="../decorator/css/sb-admin.css" rel="stylesheet">
<style>
.bg-dark {
	background-color:#f67178 !important;
}
</style>
<script type="text/javascript">
	function check() {
		var f = document.f1;
		if (f.id.value == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (f.password.value == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		f.submit();
	}
</script>
</head>

<body class="bg-dark">

	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Login</div>
			<div class="card-body">
				<form name="f1" method="post" action="login.do">
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" name="id" class="form-control"
								placeholder="Id" required="required"
								autofocus="autofocus"> <label for="inputEmail"></label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="password" name="password" class="form-control"
								placeholder="Password" required="required"> 
								<label for="inputPassword"></label>
						</div>
					</div>
					<!-- <div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox" value="remember-me">
								Remember Password
							</label>
						</div>
					</div> -->
					<a class="btn btn-primary btn-block" href="#" onclick="return check()">Login</a>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="JoinForm.do">회원가입</a> <!-- <a
						class="d-block small" href="forgot-password.html">비밀번호를 찾기</a> -->
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
