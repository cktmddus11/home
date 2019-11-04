<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SLIP Login page</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/u_sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
function checkValue(){
	inputForm = eval("document.loginInfo");
	if(!inputForm.id.value){
		alert("학번을 입력하세요");
		inputForm.id.focus();
		return false;
	}
	if(!inputForm.password.value){
		alert("비밀번호를 입력하세요");
		inputForm.password.focus();
		return false;
	}
}

</script>
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
            <div class="col-lg-5 d-none d-lg-block" style="background:url(https://www.doowon.ac.kr:442/data/downNews/mb_1492764454321.PNG) no-repeat; background-size:cover;"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">SLIP LOGIN</h1>
                  </div>
                  <form class="user" method="post" name="loginInfo" action="loginPro.jsp" onsubmit="return checkValue()">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" name="id" aria-describedby="emailHelp" placeholder="학번을 입력해주세요">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" name="password" placeholder="Password">
                    </div>
                
                   <div class="btn btn-primary btn-user btn-block">
                     <input type="submit" value="로그인" />
                   </div>
                    </form>
    <%
	// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
	// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
	String msg = request.getParameter("msg");
	if(msg!=null && msg.equals("0")) 
    {
        //out.println("<br>");
        //out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
        %>
        <script>alert("비밀번호를 확인해주세요.");</script>
        <%
    }
    else if(msg!=null && msg.equals("-1"))
    {    
        //out.println("<br>");
       // out.println("<font color='red' size='5'>학번을 확인해 주세요.</font>");
    	  %>
          <script>alert("학번을 확인해주세요.");</script>
          <%
    }
	
	%>
                  <div class="text-center">
                    <a class="small" href="u_forgot-password.html">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="u_register.jsp">Create an Account!</a>
                  </div>
                </div>
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