<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인한 정보 세션에 있는값 확인</title>
</head>
<body>
	<h1>로그인한 정보 세션에 있는값 확인	</h1>
	    <table border = "1">
	    	<tr>
	    		<td>이메일</td>
	    		<td>${sessionScope.kemail}</td>
	    	</tr>
	    	<tr>
	    		<td>닉네임(카톡에서는 이름)</td>
	    		<td>${sessionScope.kname}</td>
	    	</tr>
	    	<tr>
	    		<td>썸네일</td>
	    		<td><img src="${sessionScope.kimage1}"></td>
	    	</tr>
	    	<tr>
	    		<td>큰이미지</td>
	    		<td><img src="${sessionScope.kimage2}"></td>
	    	</tr>
	    	<tr>
	    		<td>성별</td>
	    		<td>${sessionScope.kgender eq 'male'?'남자':'여자'}
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>생일</td>
	    		<td>${sessionScope.kbirthday}</td>
	    	</tr>
	    	<tr>
	    		<td>나이</td>
	    		<td>${sessionScope.kage}</td>
	    	</tr>
	    	
	    </table>
	  <h1>로그아웃 </h1> 
	  <a href="logout.store">로그아웃</a>
	  <a href="updateForm.store">정보 수정</a>
	  
	  
	  
</body>
</html>