<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 중복파일이름 -->  
<%@ page import="com.oreilly.servlet.MultipartRequest" %> <!-- 파일 업로드 수행 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<%
	
	//String directory = application.getRealPath("/upload");
	String directory = "C:/JSP/upload/schedule/";
	int maxSize =  10124 * 1024 * 100;
	String encoding = "UTF-8";
	
	MultipartRequest multipartRequest
	= new MultipartRequest(request, directory, maxSize, encoding,
			new DefaultFileRenamePolicy());

	
	String fileName = multipartRequest.getOriginalFileName("file");
	String fileRealName = multipartRequest.getFilesystemName("file");
	
	if(!fileName.endsWith(".png") && !fileName.endsWith(".jpg") && 
			!fileName.endsWith(".pdf")&& !fileName.endsWith(".hwp")){
			File file = new File(directory + fileRealName);
			file.delete();
			%>
			<script>alert("업로드 할 수 없는 확장자입니다."); 
			window.location.href = "m_schedule_list.jsp";
			</script>
			<%

	} else{
	new FileDAO().upload(fileName, fileRealName);
	//out.write("파일명 : "+ fileName +"<br>");
	//out.write("실제 파일명 : " + fileRealName +"<br>");
	%>
	<script>alert("업로드 성공!"); 
			window.location.href = "m_schedule_list.jsp";
			</script>
	<% 
	}
	
	%>
</body>
</html>