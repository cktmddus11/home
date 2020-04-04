
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
<title>jdbc ����1</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<% 
	// ����̹� �ε� : ������ ����̹��� �ڹٿ��� ����ϱ� ����
	// JVM�� �ε��ϴ� ����
	Class.forName("org.mariadb.jdbc.Driver");
	// Ŀ�ؼ� �Ҵ�ޱ� - �ѹ� ����Ǽ� ������ ��ü�� 
	// �� ���ᰴü�� Ȱ���Ͽ� �������� ����
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://localhost:3307/classdb", "scott", "1234");
	String sql = "select *From student";
	// ������ ������ ���� Statement �Ǵ� PrepareStatemen 
	/* conn.createStatement() �Ǵ� conn.prepareStatement */
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//-  DML(insert, update, delete)�� �� ���
	/* int updateCount = stmt.executeUpdate(sql); 
	DDL(create, alert, drop�� )������� ���ڵ� �� ��ȯ
	- select ������ ��� ResultSet ��ü�� ����
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
		<!--  ResultSet �� ������ Ŀ���̵��� ����  �� �÷��� 
		�����ͷ� ���ε� �ؿ�
		Ŀ���� �̵��� ������ ���ڵ尡 �����ϸ� true ��ȯ, 
		������ false ����	
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