<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
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
function goJoinForm(){
	location.href="join.jsp";
}
</script>
</head>
<body>
	<h2>Login page</h2>
	<hr />
	<form method="post" name="loginInfo" action="loginPro.jsp" onsubmit="return checkValue()">
		<table>
		 <tr>
			<td>ID : </td>
			<td><input type="text" name="id"></td>
		 </tr>
		 <tr>
			<td>password : </td>
			<td><input type="text" name="password"></td>
		 </tr>
		</table>
		<br />
		<input type="submit" value="로그인" />
		<input type="button" value="회원가입" onclick="goJoinForm()">
	</form>
	<%
	// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
	// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
	String msg = request.getParameter("msg");
	if(msg!=null && msg.equals("0")) 
    {
        out.println("<br>");
        out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
    }
    else if(msg!=null && msg.equals("-1"))
    {    
        out.println("<br>");
        out.println("<font color='red' size='5'>학번을 확인해 주세요.</font>");
    }
	
	%>
	
</body>
</html>