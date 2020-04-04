
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jdbc 예제1</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<% 
	// 드라이버 로딩 : 마리아 드라이버를 자바에서 사용하기 위해
	// JVM에 로딩하는 과정
	Class.forName("org.mariadb.jdbc.Driver");
	// 커넥션 할당받기 - 한번 연결되서 생성된 객체를 
	// 이 연결객체를 활용하여 쿼리문을 날림
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://localhost:3307/classdb", "scott", "1234");
	String sql = "select *From student";
	// 쿼리문 전송을 위한 Statement 또는 PrepareStatemen 
	/* conn.createStatement() 또는 conn.prepareStatement */
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//-  DML(insert, update, delete)문 인 경우
	/* int updateCount = stmt.executeUpdate(sql); 
	DDL(create, alert, drop등 )영향받은 레코드 수 반환
	- select 구문의 경우 ResultSet 객체에 담음
	*/
	ResultSet rs = pstmt.executeQuery();
	
	ResultSetMetaData rsmt = rs.getMetaData();
	
	%>
	<table class="w3-table-all">
		<tr class="w3-red">
			<% for(int i = 1;i<=rsmt.getColumnCount();i++) {%>
				<th><%=rsmt.getColumnName(i) %>
			<%} %>
		</tr>
		<!--  ResultSet 의 논리적인 커서이동을 통해  각 컬럼의 
		데이터럴 바인딩 해옴
		커서가 이동한 지점에 레코드가 존재하면 true 반환, 
		없으면 false 리턴	
		 -->
		<% while(rs.next()){ %>
		<tr>
			<%for(int i = 1;i<=rsmt.getColumnCount();i++){	 %>
			<td><%=rs.getString(i) %>
			<%} %>
		</tr>
		<% } %>
	</table>
	
	<%
	pstmt.close();
	conn.close();
	%>
</body>
</html>