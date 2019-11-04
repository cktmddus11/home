<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar view page</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	String date = request.getParameter("date");
	Object obj  = session.getAttribute("sessionID");
	int id = (Integer)obj;

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/slip2", "root", "1234");
	Statement stmt = conn.createStatement();
	String sql = "select task from calendar_view where date="+date+" and id="+id;
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		String task = rs.getString("task");
		%>
		<li><%=task %></li>
		<% 
	}
	conn.close();
	stmt.close();
	rs.close();
	
}catch(Exception e) {
	out.println(e);
}
%>
	
</body>
</html>