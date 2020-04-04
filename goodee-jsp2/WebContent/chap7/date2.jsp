<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*, java.text.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>날짜 설정 확인창</title>
</head>
<body>
<%
/* getAttribute(String name)
세션 속성명이 name인 속성의 값을 Object 타입으로 리턴한다. 
해당 되는 속성명이 없을 경우에는 null 값을 리턴한다.*/
String date = (String) session.getAttribute("date");
if(date == null){
	%>
	<script>
	alert('날짜 등록후 거래하세요. data1.jsp로 이동합니다.');
	location.href="data1.jsp";
	</script>
<% }else{ %>
		<p>반갑습니다. 등록된 날짜 : <%=date %></p>
	
	<%
	session.invalidate(); //현재 생성된 세션을 무효화 시킨다
	//session.removeAttribute("date");
	// 세션속성명이 "date" 인 속성을 제거
}


%>


</body>
</html>