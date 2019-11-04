<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 처리</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<%
	try{
		String sk = request.getParameter("sk");
		String sv = request.getParameter("sv");
		
		String address;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/slip2?useUnicode=true&characterEncoding=utf8", "root", "1234");
		Statement stmt = conn.createStatement();
		
		String sql = "select address from build_view where "+sk+" like '%"+sv+"%'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			address = rs.getString(1);
			%>
		<script>
		$(document).ready(function(){
			$('#add').attr('value', '<%=address %>');
			 $('#address').click(function(){
		    	 $('#search_value').attr('value', '<%=sv %>');
		      });
		});
		</script>
			<% 
		}
		
	}catch(Exception e){
		out.println(e);
	}
%>
</body>
</html>