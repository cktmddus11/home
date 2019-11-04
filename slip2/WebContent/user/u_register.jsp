<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SLIP Register page</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/u_sb-admin-2.min.css" rel="stylesheet">

<style>
.styled-select {
   background: url(http://i62.tinypic.com/15xvbd5.png) no-repeat 96% 0;
   height: 29px;
   overflow: hidden;
   width: 240px;
}

.styled-select select {
   background: transparent;
   border: none;
   font-size: 14px;
   font-color: #D8D8D8;
   height: 29px;
   padding: 5px; /* If you add too much padding here, the options won't show in IE */
   width: 268px;
}

.styled-select.slate {
   background: url(http://i62.tinypic.com/2e3ybe1.jpg) no-repeat right center;
   height: 34px;
   width: 240px;
}

.styled-select.slate select {
   border: 1px solid #ccc;
   font-size: 16px;
   font-color: #D8D8D8;
   height: 34px;
   width: 268px;
   
}

</style>
<script>
function checkpw(){
	if(register.passwd.value==register.passwdcheck.value){
		return true;
	}
	else {
		alert("비밀번호를 확인해주세요");
		return false;
	}
	
}
</script>
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block" style="background:url(https://www.doowon.ac.kr:442/data/downNews/mb_1492764454321.PNG) no-repeat; background-size:cover;"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">회원 가입</h1>
              </div>
              <form class="user" name="register" method="post" action="<%= request.getContextPath() %>/user/join_insert.jsp" onsubmit="return checkpw()">
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" name="name" placeholder="이름 입력">
                </div>
           
                <div class="styled-select slate">
                 <select name ="dept">
					<option value="보육복지과">보육복지과</option>
					<option value="뷰티아트과">뷰티아트과</option>
					<option value="방송영상제작전공">방송영상제작전공</option>
					<option value="컴퓨터공학과">컴퓨터공학과</option>
					<option value="스마트 IT학과">스마트 IT학과</option>
					<option value="스마트 자동차과">스마트 자동차과</option>
					<option value="호텔관광과">호텔관광과</option>
					<option value="호텔조리과">호텔조리과</option>
					<option value="의료복지행정과">의료복지행정과</option>
				</select>
			</div> 
<P></P>
                
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" name="id" placeholder="학번 입력">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" name="passwd" placeholder="비밀번호">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" name="passwdcheck" placeholder="비밀번호 확인">
                  </div>
                </div>
                <div class="btn btn-primary btn-user btn-block">
                <input type="submit" value="회원가입">
                </div>
                
              </form>
              <div class="text-center">
                <a class="small" href="u_forgot-password.html">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="u_login.html">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>