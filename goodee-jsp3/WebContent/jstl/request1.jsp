<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���۵� �Ķ���� ����</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr"/>
	�̸� : ${param.name }<br>
   ���� : ${param.age }<br>
	���� : ${param.gender == 1 ?"��":"��"}<br>
	��� : ${paraam.hobby}<br>
	����⵵ : ${paraam.year}<br>

	<h3>��� ���� ��� ��ȸ�ϱ�</h3>
	<c:forEach var="h" items="${paramValues.hobby}">
		${h } &nbsp;&nbsp;
	</c:forEach>
	<br>
	<!--  paramValues.hobby �迭�� ���·�  -->
	${paramValues.hobby[0]}<br>
<%-- 	<%                                   
		String[] hobbies = request.getParameterValues("hobby");
		for(String h : hobbies){ %>
			<%=h %>,      <!--   &nbsp; &nbsp; -->
	<%}%> --%>
	<h3>��� �Ķ���� ���� ��ȸ�ϱ�</h3>
	<table>
		<tr>
			<th>�Ķ���� �̸� </th>
			<th>�Ķ���� ��</th>
		</tr>
		<c:forEach var="p" items="${paramValues}"><!--  paramValues��� �Ķ�������� �ٰ��� EL�� ���尴ü-->
			<tr>
				<td>${p.key}</td>
				<td><c:forEach var="v" items="${p.value}">
				${v}
				</c:forEach></td>
			</tr>
		</c:forEach>
		</table>
		<%-- <%
		// getParameterNames() : �Ķ������ �̸���
		// Emumeration : Interator ������. �ݺ���
		Enumeration e = request.getParameterNames();
		while(e.hasMoreElements()){ 
			// pname : �Ķ������ �̸�
			String pname = (String)e.nextElement();
		// hobby 
			String[] pvalue = request.getParameterValues(pname);

		%>
		
		<tr>
			<td><%=pname  %></td>
			<td><% for(String v : pvalue){  %>
				<%=v %>&nbsp; &nbsp; 
				<%} %>
			</td>
		</tr>
		<% } %>
	</table>
	
	 --%>
	
	
	
	
</body>
</html>