<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ����</title>
</head>
<body>
	<%-- String writer = request.getParameter("writer")  --%>
	
	<% request.setCharacterEncoding("euc-kr");%>
	<jsp:useBean id="book" class="chap7.Book"/> <!-- scope="page" �����Ǿ����� --> 
	<%-- 		1. Book book = new Book(); ��ü ���� 
	 			2. pageContext.setAttribute("book", book);
	 			scope�� request�̸� request.setAttribute("book", book)
	 --%>
	<jsp:setProperty property="*" name="book" />
	<!--  ������ ������Ƽ ���� �Ķ���Ͱ����� �����Ѵ�.  -->
	<%-- book.setWriter(request.getParameter("name")) --%> 
	<jsp:setProperty property="writer" name="book" param="name" />	 
	<%--
			book.setWriter(request.getParameter("write"));
			book.setTitle(request.getParameter("title"));
			....
			
			������Ƽ****
				set������Ƽ
				setXxx() => xxx �ҹ��� 
			
	 --%>
	
	<table border="1" style="border-collapse:collapse;">
		<caption>���� ��ȸ </caption>
		<tr>	
			<td>�ۼ���</td>
			<%-- book.getWriter() �޼��� ȣ�� --%>
			<td><jsp:getProperty name="book" property="writer" /> </td>
			<%-- <td><%=book.getWriter() %> --%>
		</tr>
		<tr>
			<td>����</td>
			<%-- book.getTitle() �޼��� ȣ�� --%>
			<td><jsp:getProperty name="book" property="title" /> </td>
		<%-- 	<td><%=book.getTitle() %> --%>
		</tr>
		<tr>
			<td>����</td>
			<%-- book.getContent() �޼��� ȣ�� --%>
			<td><jsp:getProperty name="book" property="content" /> </td>
		<%-- 	<td><%=book.getContent() %> --%>
	</table>
	
</body>
</html>