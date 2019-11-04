<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");

Connection conn = null;
PreparedStatement pstmt = null;

int date= Integer.parseInt(request.getParameter("date"));
int no= Integer.parseInt(request.getParameter("no"));
String task = request.getParameter("task");


Class.forName("com.mysql.jdbc.Driver");

try{
	String jdbcDriver =  "jdbc:mysql://localhost:3306/slip2?useUnicode=true&characterEncoding=utf8";
	String user = "root";
	String pass = "1234";
	conn = DriverManager.getConnection(jdbcDriver, user, pass);
			
	String sql = "update schedule set task=? where sch_no=?";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, task);
	pstmt.setInt(2, no);
	
	pstmt.execute();
}finally{
	
	if(pstmt != null) try{ pstmt.close();}catch(SQLException ex){ System.out.println(ex);}
	if(conn != null) try{ conn.close();}catch(SQLException ex){ System.out.println(ex);}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<script>
	alert("수정 되었습니다.");
	window.location.href = "calendar.jsp";
	</script>
</body>
</html>