<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ select���� ������ Ȯ��</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<% request.setCharacterEncoding("euc-kr"); 
	String sql = request.getParameter("sql");%>
	<form method="post"><%-- form ��action �Ӽ��� ���� ���� 
	�ڽ��� �������� �ٽ� ȣ���� --%>
		<textarea cols="60" rows="5" name="sql">
		<%=((sql==null)?"":sql)%>  
		</textarea>
		<input type="submit" value="����" />
	</form>
	<%
	if(sql != null && !sql.trim().equals("")){
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://localhost:3307/classdb", "scott", "1234");
	try{
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	/* 
	int cnt = 0;
	while(rs.next()){
		cnt++;	
	}
	rs = pstmt.executeQuery(); */
	ResultSetMetaData rsmt = rs.getMetaData();
	
	String sql2 = "select count(*) from ("+sql+") a";
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	ResultSet rs2 = pstmt2.executeQuery();
	rs2.next();
	int cnt = rs2.getInt(1);
	 
	%>
	
	<table class="w3-table-all">
		<tr>
		<td style="text-align:right;"
		colspan="<%=rsmt.getColumnCount()%>">��ȸ�� ���ڵ� ���� : <%=cnt %></td>
		</tr>
		<tr class="w3-red">
			<% for(int i = 1;i<=rsmt.getColumnCount();i++) {%>
				<th><%=rsmt.getColumnName(i) %>
			<%} %>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<%for(int i = 1;i<=rsmt.getColumnCount();i++){	 %>
			<td><%=rs.getString(i) %>
			<%} %>
		</tr>
		<% } %>
	</table>
	<% 
	}catch(Exception e){
		%>
		<h2>���� ���� �Դϴ�. <%=e.getMessage() %><br>
				sql ���� : <%= sql%></h2>
		<% 
	}
	%>
	<% 
	}else{
		%>
		<script>
		alert("sql������ �Է��ϼ���.");
		</script>
		<% 
	}
	%>

</body>
</html>