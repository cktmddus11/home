<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert page</title>
</head>
<body>
<% //request.getRequestURL() %>
<%
request.setCharacterEncoding("utf-8");

int date= Integer.parseInt(request.getParameter("date"));
%>
	<h2>insert page</h2>
	<hr />
	<form method="post" action="<%= request.getContextPath() %>/gg/schedule_insert.jsp?date=<%=date %>">
	 <table>
		<tr>
			<td> Date </td>
			<td><input type="text" value="<%= date%>" name="date" disabled /></td>
		</tr>
		<tr>
			<td> task :  </td>
			<td><textarea rows=10 cols=10 style="text-align:center;" name="task"></textarea></td>
		</tr>
		
		
	 </table>
	 <input type="submit" value="추가">
	</form>
	
</body>
</html>