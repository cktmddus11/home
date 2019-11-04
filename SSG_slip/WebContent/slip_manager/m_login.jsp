<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Form</title>
<link rel ="stylesheet" type="text/css" href="../resources/css/login.css"> 
</head>
<body>
<form action="m_loginlink.jsp" method="post">
  <div id="login_box">
    <h2>Login</h2>
    <h3>관리자 확인 페이지 입니다.</h3>
    <ul id="input_button">
      <li id="id_pass">
        <ul>
          <li>
            <span>ID</span>
            <input type="text" name="id">
          </li> <!-- id -->
          <li id="pass">    
            <span>PW</span>
            <input type="password" name="pwd">          
          </li> <!-- pass -->
        </ul>
      </li>
      <li id="login_btn">
        <button>로그인</button>
      </li>
    </ul>    
  </div> <!-- login_box -->
</form>
</body>
</html>