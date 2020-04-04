<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.text.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>날짜 설정 페이지</title>
</head>
<body>
<!--  쿠키는 웹 브라우저에 사용자의 상태를 유지하기
위한 정보를 저장했다면 세션은 웹 서버쪽의
웹 컨테이너  상태를 유지 하기 위한 정보 

session 객체는 웹 브라우저와 매핑되므로 
해당 웹 브라우저를 닫지 않는 한 같은 창에서
열려진 페이지는 모두 같은 session 객체를 
공유하게 된다. 
-->
	<%
	Date date = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a");
	String date2 = sf.format(date);
	// 세션 속성명이 "date"인  속성에 속성값을 지정
	//          void      String name Object value
	session.setAttribute("date", date);
	
	%>
	<p>등록된 날짜 : <%=date2 %>
</body>
</html>