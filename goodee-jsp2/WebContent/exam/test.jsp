<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel = "styleSheet" href="./css/csy.css">
<title>ȸ������ Ȯ��</title>
</head>
<body>
	<% request.setCharacterEncoding("euc-kr");%>
	<jsp:useBean id="member" class="csy.Member"/>
	<jsp:setProperty property="*" name="member" />
	<center>
	<table>
	<caption>ȸ������</caption>
		<tr>
			<th rowspan="4" width="100px ";hight ="100px";>
			<img src = "<%=member.getFilesrc() %>"  width="100px ";height ="100px";></th>
			<th>�̸�  </th>
			<jsp:getProperty name="member" property="filesrc" /> 
			<td><jsp:getProperty name="member" property="name" /> </td>
		</tr>
		<tr>
			<th>��й�ȣ  </th>
			<td><jsp:getProperty name="member" property="password" /> </td>
		</tr>
		<tr>	
			<th>����  </th>
			<td><jsp:getProperty name="member" property="gender2" /></td>
		</tr>
		<tr>
			<th>��ȭ��ȣ  </th>
			<td><jsp:getProperty name="member" property="phone" /></td>
		</tr>
		<tr>
			<th></th>
			<th>�̸���  </th>
		<td><jsp:getProperty name="member" property="email" /></td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="ȸ������" /></td>
		</tr>
		</table>
		</center>
			<center><h3>Goodee Academy Since 2019 - written by  ���¿�</h3></center>
</body>
</html>