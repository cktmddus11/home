<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String email = request.getParameter("email");
String tel = request.getParameter("tel");
String id = request.getParameter("id");
MemberDao dao = new MemberDao();
String pw = dao.selectPW(email, tel, id);

if(pw == null){
	%>
	<script>
	alert("������ �´� pw�� �����ϴ�.");
	location.href="pwForm.jsp";
	</script>
	<% 
}else{
	System.out.println(pw);
	String pw2 = pw.substring(pw.length()-2); // 22
	String pw3 = "";

	int len = pw.length() - pw2.length();
	for(int i = 0;i<len;i++){
		 pw3 += "*";
	}
	pw3 += pw2;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ</title>
<script>
function pwclose(){
	self.close();
}
</script>
<link rel="stylesheet" href="../css/main.css">

</head>
<body>
	<h2>��й�ȣ</h2> 
	&nbsp; 
	<%=pw3 %>
	<br>
	<input type="button" value="�ݱ�" onclick="javascript:pwclose()">

</body>
</html>

	<% 
}

%>