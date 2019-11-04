<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/slip?useUnicode=true&characterEncoding=utf8";
	String mysql_id="root";
	String mysql_pw="1234";
	
	 int num= Integer.parseInt(request.getParameter("num")); //삭제할 정보의 id
	
	try{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = DriverManager.getConnection(url, mysql_id, mysql_pw);
		pstmt = conn.prepareStatement("delete from test where id ="+num);
		pstmt.executeUpdate();
		
		System.out.println(pstmt);
		System.out.println(num);
		
		
		 %>
		 <script>
		
		 
		alert("삭제가 완료되었습니다 ");
		window.location.href = "m_list.jsp";
		</script>
		 <% 
		
		pstmt.close();
		conn.close();

	}catch(SQLException e){
		out.println(e.toString());
	}
	
	
	
	%>
		
	
	

</body>
</head>
</html>