<%@page import="model1.Board"%>
<%@page import="model1.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. num �Ķ���� ������ ������ ���� 
2. num �� �̿��Ͽ� db���� �Խù� ������ ��ȸ
	Board b = new BoardDao.selectOne(num);
3. ��ȸ�� ������Ű��
	void BoardDao.readcntadd(num)
4. 2������ ��ȸ�� �Խù� ȭ�鿡 ���
 --%>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDao dao = new BoardDao();
Board b = dao.selectOne(num);
dao.readcntadd(num); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel = "stylesheet" href="../css/main.css">
</head>
<body>
	<table>
		<caption>�Խù� �󼼺���</caption>
		<tr>
			<th width="20%">�۾���</th>
			<td width="80%" style="text-align:left"><input type="text" value="<%=b.getName()%>"></td>
		</tr>
		<tr>	
			<th>����</th>
			<td style="text-align : left"><input type="text" value="<%=b.getSubject()%>"></td>
		</tr>
		<tr>	
			<th>����</th>
			<td><table style="width:100%; height:250px;">
               <td style="border-width:0px; vertical-align:top; text-align:left">
              <%=b.getContent() %>
           	</td>     
     		</table>
     		</td>
     	</tr>
	<table>
	<tr>
		<th> ÷������</th>
		<td>
			<a href="file/"<%=b.getFile1() %>"><%=b.getFile1() %></a>
		</td>
	</tr>
	<tr>	
		<td colspan="2">
		<a href = "replyForm.jsp?num=<%=num %>">[�亯]</a>
		<a href = "updateForm.jsp?num=<%=num %>">[����]</a>
		<a href = "deleteForm.jsp?num=<%=num %>">[����]</a>
		<a href = "list.jsp">[���]</a>
	</tr>
	</table>
</body>
</html>