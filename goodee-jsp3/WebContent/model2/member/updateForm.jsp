<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <!-- 
   ===========================
    5. Member 객체를 화면에 출력
    
    --> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
function inputcheck(f){
	<c:if test="${sessionScope.login !='admin'}">
		if(f.pass.value==""){
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
	</c:if>	
}
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	//nw = open("pictureForm.jsp", "picture", op);
	open("pictureForm.me", "picture", op);
}
function win_updatepw(){
	var op = "width=500, height=230, left=50, top=150";
	open("passwordForm.me", "password", op);
}

</script>
</head>
<body>
	<form action="update.me" name="f" method="post" 
	onsubmit="return inputcheck(this)">
		<input type="hidden" name="picture" value="${info.picture}"> <!-- 사진업로드에서 hidden값 넘겨주니까 알아서 사진바뀐걸로 경로 수정도미 -->	
		<table>
			<caption>회원 정보 수정</caption>
			<tr>
				<td rowspan="4" valign="bottom">
				<img src="picture/${info.picture}" width="100" height="120" id="pic"><br>
				<font size="1"><a href="javascript:win_upload()">사진 수정</a></font></td>
				<th>아이디</th>
				
				<td><input type="text" name="id" value="${info.id}" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>	
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${info.name}"></td>	
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="1" ${info.gender==1?"checked":"" }>남
				<input type="radio" name="gender" value="2"  ${info.gender==2?"checked":""}>여</td>	
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="2"><input type="text" name="tel" value="${info.tel}"></td>	
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2"><input type="text" name="email" value="${info.email}" ></td>	
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="회원수정">
				<c:if test="${info.id != 'admin'}">
					<input type="button" value="비밀번호 변경"  onclick="javascript:win_updatepw()"/>
					</c:if>
				</td>	
			</tr>
			
		</table>
	</form>
</body>
</html>
