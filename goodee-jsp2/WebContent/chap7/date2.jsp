<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*, java.text.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��¥ ���� Ȯ��â</title>
</head>
<body>
<%
/* getAttribute(String name)
���� �Ӽ����� name�� �Ӽ��� ���� Object Ÿ������ �����Ѵ�. 
�ش� �Ǵ� �Ӽ����� ���� ��쿡�� null ���� �����Ѵ�.*/
String date = (String) session.getAttribute("date");
if(date == null){
	%>
	<script>
	alert('��¥ ����� �ŷ��ϼ���. data1.jsp�� �̵��մϴ�.');
	location.href="data1.jsp";
	</script>
<% }else{ %>
		<p>�ݰ����ϴ�. ��ϵ� ��¥ : <%=date %></p>
	
	<%
	session.invalidate(); //���� ������ ������ ��ȿȭ ��Ų��
	//session.removeAttribute("date");
	// ���ǼӼ����� "date" �� �Ӽ��� ����
}


%>


</body>
</html>