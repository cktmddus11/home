<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 폼</title>
</head>
<body>
<form method="post" action="update.store">
 <table border = "1">
	    	<tr>
	    		<td>닉네임(카톡에서는 이름)</td>
	    		<td><input type="text" 
	    		name="nickname" value="${sessionScope.kname}"></td>
	    	</tr>
	    <%-- 	<tr>
	    		<td>썸네일</td>
	    		<td><img src="${sessionScope.kimage1}"></td>
	    	</tr>
	    	<tr>
	    		<td>큰이미지</td>
	    		<td><img src="${sessionScope.kimage2}"></td>
	    	</tr> --%>
	    	<tr>
	    		<td>성별</td>
	    		<td><input type="radio" name="gender" value="male" ${sessionScope.kgender eq 'male'?'checked':''}>남자
	    		<input type="radio" name="gender" value="female" ${sessionScope.kgender eq 'male'?'':'checked'}>여자
	    		
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>생일</td>
	    		<td>${sessionScope.kbirthday}</td>
	    	</tr>
	    
	    </table>
	    <input type="submit" value="수정">
	    </form>
</body>
</html>