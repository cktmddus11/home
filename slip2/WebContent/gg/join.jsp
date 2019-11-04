<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join page</title>
</head>
<body>
<% //request.getRequestURL() %>
	<h2>Join page</h2>
	<hr />
	<form method="post" action="<%= request.getContextPath() %>/gg/join_insert.jsp">
	 <table>
		<tr>
			<td> ID : </td>
			<td><input type="text" name="id" /></td>
		</tr>
		<tr>
			<td> Name :  </td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td> password :  </td>
			<td><input type="text" name="passwd" /></td>
		</tr>
		<tr>
			<td> department : </td>
			<td><input type="text" name="dept" /></td>
		</tr>
		
	 </table>
	 <input type="submit" value="회원가입">
	</form>
	
</body>
</html>