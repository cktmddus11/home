<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/slip?useUnicode=true&characterEncoding=utf8";
	String mysql_id="root";
	String mysql_pw="1234";
	
	String building = request.getParameter("building");
    String dept = request.getParameter("dept");
    String layer = request.getParameter("layer");
    String lecturenum = request.getParameter("lecturenum");
    String yoil = request.getParameter("yoil");
    String lecturename = request.getParameter("lecturename");
    String professor = request.getParameter("professor");
    String start = request.getParameter("start");
    String end = request.getParameter("end");
    
    
	try{
		Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);
		
		String sql = "insert into test (building, dept, layer, lecturenum, yoil, lecturename, professor, start, end) values (?,?,?,?,?,?,?,?,?)";
		//System.out.println(sql);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		
		pstmt.setString(1, building);
		pstmt.setString(2, dept);
		pstmt.setString(3, layer);
		pstmt.setString(4, lecturenum);
		pstmt.setString(5, yoil);
		pstmt.setString(6, lecturename);
		pstmt.setString(7, professor);
		pstmt.setString(8, start);
		pstmt.setString(9, end);
		
		//System.out.println(building);
		//System.out.println(pstmt);
		
		pstmt.execute();
		pstmt.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
	
	%>
	
	
	<script>
	alert("추가 되었습니다.");
	window.location.href = "m_list.jsp";
	</script>
</body>
</html>