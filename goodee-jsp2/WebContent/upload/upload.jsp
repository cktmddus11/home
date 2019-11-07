<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 업로드 결과 </title>
</head>
<body>
	<%
	String uploadPath = application.getRealPath("/")+"upload/";
	int size = 10 * 1024 * 1024; // 10M 설정	
	/* 
	new MultipartReuqest 
		request : 요청객체. 파리미터 정보 + 파일정보
		uploadPath : 파일 업로드되는 서버의 위치 정보
		uploadPath : 파일업로드 되는 서버의 위치 정보
		size : 최대 업로드 가능 크기 바이트로 설정
		"euc-kr" : 파라미터의 인코딩 설정
		=> 객체 생성과 동시에 파일업로드 완료 
	
	*/
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");
	// 업로드 정보 가져오기
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String fname = multi.getFilesystemName("file1");

	%>
	업로드 위치 : <%=uploadPath %><br>
	올린사람 : <%=name %><br>
	제목 : <%=title %> <br>
	파일 : <a href="<%=fname %>"><%=fname %></a>
	
	
	
</body>
</html>