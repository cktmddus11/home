<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>build_view select </title>
</head>
<body>
	<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String build, lecture, dept;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/slip2", "root", "1234");
		Statement stmt = conn.createStatement();
		String sql = "select build, lecture, dept from build_view";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			build = rs.getString(1);
			lecture = rs.getString(2);
			dept = rs.getString(3);
			%>
			<tr>
				<td><%=build %></td>
				<td><%=lecture %></td>
				<td><%=dept %></td>
			</tr>
			<% 
		}
		rs.close();
		conn.close();
		stmt.close();
	}catch(Exception e){
		out.println(e);
	}
	%>
</body>
</html>