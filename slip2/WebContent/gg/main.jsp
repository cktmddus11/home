<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<script>
	function logoutPro(){
		location.href = "logout.jsp"
	}
</script>
</head>
<body>
	<h2>Main page</h2>
	<hr />
	<% if(session.getAttribute("sessionID")==null){%>
		<li><a href="join.jsp">회원가입</a></li>
		<li><a href="login.jsp">로그인</a></li>
<%	}
	else{%>
		<font color="red"><%=session.getAttribute("sessionID") %></font>
		<br><br>
    	<input type="button" value="로그아웃" onclick="logoutPro()" />
  <%}%>
	
	
</body>
</html>