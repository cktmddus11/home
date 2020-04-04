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
PreparedStatement pstmt2 = null;
Statement stmt = null;
Statement stmt2 = null;
ResultSet rs = null;
ResultSet rs2 = null;

int date= Integer.parseInt(request.getParameter("date"));
String task = request.getParameter("task");


Class.forName("com.mysql.jdbc.Driver");

try{
	String jdbcDriver =  "jdbc:mysql://localhost:3306/slip2?useUnicode=true&characterEncoding=utf8";
	String user = "root";
	String pass = "1234";
	conn = DriverManager.getConnection(jdbcDriver, user, pass);
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select *from calendar where id=41730062 and date="+date);
	if(!rs.next()){
		pstmt = conn.prepareStatement(
				"insert into calendar values(null,?,?)");
		
			pstmt.setInt(1, 41730062);
			pstmt.setInt(2, date);
			pstmt.executeUpdate();
	}
	stmt2 = conn.createStatement();
	rs2 = stmt2.executeQuery("select no from calendar where id=41730062 and date="+date);
	
	while(rs2.next()){
		int no = rs2.getInt("no");
		pstmt2 = conn.prepareStatement(
				"insert into schedule values (?, null, ?)" );
		pstmt2.setInt(1, no);
		pstmt2.setString(2, task);
		pstmt2.executeUpdate();
				
	}	
	
	
	
}finally{
	if(rs != null) try{ rs.close();}catch(SQLException ex){ System.out.println(ex);}
	if(rs2 != null) try{ rs.close();}catch(SQLException ex){ System.out.println(ex);}
	if(stmt != null) try{ stmt.close();}catch(SQLException ex){ System.out.println(ex);}
	if(stmt2 != null) try{ stmt.close();}catch(SQLException ex){ System.out.println(ex);}
	if(pstmt != null) try{ pstmt.close();}catch(SQLException ex){ System.out.println(ex);}
	if(pstmt2 != null) try{ pstmt2.close();}catch(SQLException ex){ System.out.println(ex);}
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
	alert("추가 되었습니다.");
	window.location.href = "calendar.jsp";
	</script>
</body>
</html>