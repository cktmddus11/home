<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε� ���</title>
</head>
<script>
	opener.document.getElementById("img").src = document.getElementById("filename").value;
</script>
<body>
	<%
		String uploadPath = application.getRealPath("/")+"upload/";
		int size = 10 * 1024 * 1024; // 10M ����
		/*
			new MultipartRequest 
				request : ��û��ü. �Ķ���� ���� + ���� ����
				uploadPath :  ���� ���ε�Ǵ� ������ ��ġ ����.
				size : �ִ� ���ε� ���� ũ�� ����Ʈ�� ����
				"euc-kr" : �Ķ������ ���ڵ� ����
				=> ��ü������ ���ÿ� ���Ͼ��ε� �Ϸ�
		*/
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");
		// ���ε�� ������ ������ �Ʒ��� �׳� ���ε� ������ �������°�
		
		
	%>
	<input type="hidden" id="filename" value="<%=multi.getFileNames()%>">
	
</body>
</html>