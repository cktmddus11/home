<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" 
          href="/resources/style.css">
</head>
<body>
	<h1>Register</h1>
	
	<!-- <form method="POST">
		First Name : <input type="text" name="firstName"/><br>
		Last Name : <input type="text" name="lastName"/><br>
		Username : <input type="text" name="Username"/><br>
		Password : <input type="text" name="password"/><br>
		<input type="submit" value="Register" />
	</form> -->
	
	<%-- <sf:form method="POST" commandName="spitter">
		First Name : <sf:input path="firstName"/>
		<sf:errors path="firstName" cssClass="error" />
		<br />
			
		Last Name : <sf:input path="lastName"/>
		<sf:errors path="lastName" cssClass="error"/>
		<br />
		
		Email : <sf:input path="email"/>
		<sf:errors path="email" cssClass="error"/>
		<br />
		
		Username : <sf:input path="username"/>
		<sf:errors path="username" cssClass="error"/>
		<br /><!-- username.errors -->
		
		Password : <sf:password path="password"/>
		<sf:errors path="password" cssClass="error"/>
		<br />
		
		<input type="submit" value="Register" />
	</sf:form>
	 --%>
	<sf:form method="POST" commandName="spitter">
		<sf:errors path="*" element="div" cssClass="errors"/>
		<!--            path="*" : 모든 프로퍼티 렌더링 
		위의 error 표시는 인라인태그인 span이기 때문에 하나하나 에러 나타내기에 좋음
		
		여러 에러를 한번에 나타내기 위해서는 span은 별로여서 element="div"
		태그가 적합함
		
		-->
		<sf:label path="firstName" cssErrorClass="error">First Name</sf:label>
		 : <sf:input path="firstName" cssErrorClass="error"/><br />
		
		<sf:label path="lastName" cssErrorClass="error">Last Name</sf:label>
		 : <sf:input path="lastName" cssErrorClass="error"/><br />
		
		<sf:label path="username" cssErrorClass="error">Username</sf:label>
		 : <sf:input path="username" cssErrorClass="error"/><br />
		<!-- username.errors -->
		
		<sf:label path="password" cssErrorClass="error">Password</sf:label>
		 : <sf:password path="password" cssErrorClass="error"/><br />
		
		<input type="submit" value="Register"/>
	</sf:form>
	
	
</body>
</html>