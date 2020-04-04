<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "jsp.member.model.MemberBean" %>
<%@ page import = "jsp.member.model.MemberDAO" %>

<% request.setCharacterEncoding("utf-8");  %>
  <jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
  <jsp:setProperty property="*" name="memberBean"/>    

<%

MemberDAO dao = MemberDAO.getInstance();
dao.insertMember(memberBean);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<script>
	alert("가입되었습니다.");
	window.location.href = "u_index.jsp";
	</script>
</body>
</html>