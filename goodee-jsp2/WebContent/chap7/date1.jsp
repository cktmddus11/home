<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.text.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��¥ ���� ������</title>
</head>
<body>
<!--  ��Ű�� �� �������� ������� ���¸� �����ϱ�
���� ������ �����ߴٸ� ������ �� ��������
�� �����̳�  ���¸� ���� �ϱ� ���� ���� 

session ��ü�� �� �������� ���εǹǷ� 
�ش� �� �������� ���� �ʴ� �� ���� â����
������ �������� ��� ���� session ��ü�� 
�����ϰ� �ȴ�. 
-->
	<%
	Date date = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a");
	String date2 = sf.format(date);
	// ���� �Ӽ����� "date"��  �Ӽ��� �Ӽ����� ����
	//          void      String name Object value
	session.setAttribute("date", date);
	
	%>
	<p>��ϵ� ��¥ : <%=date2 %>
</body>
</html>