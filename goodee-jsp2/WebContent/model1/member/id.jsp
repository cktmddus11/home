<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String email = request.getParameter("email");
String tel = request.getParameter("tel");
MemberDao dao = new MemberDao();
String id = dao.selectID(email, tel);

if(id == null){ // id�� ��ã�� ���
	%>
	<script>
	alert("������ �´� id�� �����ϴ�.");
	location.href="idForm.jsp";
	</script>
	<% 
}else{ // id �� ã�� ���
	/* String id2 = id.substring(0, 3);  // tes 
	String displayid = id2; // �Ѱ��� id
	int len = id.length() - id2.length(); // 5 - 3 = 2
	for(int i = 0;i<len;i++){
		id2 += "*";
	} */
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵�</title>
<script>
<%-- function send(){
	opener.document.f.id.value ="<%=displayid %>";
	self.close();
} --%>
function idsend(id){
	opener.document.f.id.value = id;
	self.close();
}
</script>
</head>
<body>
	<h2>���̵�</h2>
	<%-- <%=id2 %> --%>
	<%=id.substring(0, id.length() -2) + "**" %>
	<br>
	<!-- <input type="submit" value="���̵�����" onclick="send()"/> -->
	<input type="submit" value="���̵�����" onclick="idsend('<%=id.substring(0, id.length()-2) %>')"/>
</body>
</html>
<%
}
%>