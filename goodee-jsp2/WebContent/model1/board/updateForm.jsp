<%@page import="model1.BoardDao"%>
<%@page import="model1.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 1. num ���� �Խù��� db���� ��ȸ�Ͽ� ȭ�鿡 ����ϱ� --%>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDao dao = new BoardDao();
// b: num���� �ش��ϴ� �Խù��� db ���� ����
Board b = dao.selectOne(num);


%>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
<link rel="stylesheet" href="../css/main.css">
<script>
	function file_delete(){
		document.f.file2.value="";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
<form action="update.jsp" name = "f" method="post" 
	enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%=b.getNum()%>">
			<input type="hidden" name="file2" value="<%=b.getFile1()==null?"":b.getFile1()%>">
			<table>
				<caption>�Խ��� ���� ȭ��</caption>
				<tr>
					<td>�۾���</td>
					<td><input type="text" name="name" value="<%=b.getName() %>"/></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pass"/></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="text" name="subject" value="<%=b.getSubject() %>"/></td>
				</tr>	
				<tr>
					<td>����</td>
					<td><textarea row="15" name="content"><%=b.getContent() %></textarea></td>
				</tr>	
				<tr>
					<td>÷������</td>
					<td style="text-align : left">
					<% if(b.getFile1() != null && (!b.getFile1().equals(""))){ %>
					<div id="file_desc"><%=b.getFile1() %>
					<a href="javascript:file_delete()">[÷������ ����]</a>
					</div>
					<%} %>
					<input type="file" name="file1"></td>
				</tr>	
				<tr>
					<td colspan="2">
					<a href="javascript:document:f.submit()">[�Խù�����]</a>
				</tr>
			</table>
	
	</form>
</body>
</html>