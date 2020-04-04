<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update page</title>
</head>
<body>
<h2>update page</h2>
	<hr />
<% //request.getRequestURL() %>
<%
request.setCharacterEncoding("utf-8");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

int date= Integer.parseInt(request.getParameter("date"));
int no= Integer.parseInt(request.getParameter("no"));

request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");

try{
	String jdbcDriver =  "jdbc:mysql://localhost:3306/slip2?useUnicode=true&characterEncoding=utf8";
	String user = "root";
	String pass = "1234";
	conn = DriverManager.getConnection(jdbcDriver, user, pass);
	stmt = conn.createStatement();
	String sql = "select sch_no, task from calendar_view where id=41730062 and date="+date+
			" and sch_no="+no;
	System.out.println(sql);
	
	rs = stmt.executeQuery(sql);
	
	
	while(rs.next()){
		no = rs.getInt(1);
		String task = rs.getString(2);
		%>
		<form method="post" action="<%= request.getContextPath() %>/gg/schedule_update.jsp?date=<%=date %>&no=<%= no%>">
	 <table>
		<tr>
			<td> date :  </td>
			<td><input type="text" value="<%= date%>" name="date" disabled /></td>
		</tr>
		<tr>
			<td> task :  </td>
			<td><textarea rows=10 cols=10 style="text-align:center;"name="task" value="<%=task %>"><%=task %></textarea></td>
		</tr>
		
		
	 </table>
	 <input type="submit" value="수정">
	</form>
		<% 
	}
	
	
}finally{
	if(rs != null) try{ rs.close();}catch(SQLException ex){ System.out.println(ex);}
	if(stmt != null) try{ stmt.close();}catch(SQLException ex){ System.out.println(ex);}
	if(conn != null) try{ conn.close();}catch(SQLException ex){ System.out.println(ex);}
}

%>
	
	
	
</body>
</html>