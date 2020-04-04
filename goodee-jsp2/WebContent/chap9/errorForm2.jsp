<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%--error 페이지 처리 우선순위 
1. 해당 페이지별로 오류 페이지 설정 
<%@ page errorPage="....jsp" %>

2. web.xml에 설정된 예외 클래스별로 설정
<exception-type>...NUmberFormatException</exception-type>
예외 클래스 설정시 패키지 명을 포함해야 한다. 

3. web.xml에 설정된 error 코드별로 설정
<error-code> 500</error-code>

4. 톰켓(웹컨테이너)에서 기본으로 제공하는 에러페이지

--%>
<%-- 	결과 1 : <%=100 / 0 %> <!-- ArithmeticException --> --%>
	결과2 : <%=Integer.parseInt("홍길동") %> <!-- NumberFormatException -->
	

</body>
</html>