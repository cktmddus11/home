<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 중복체크</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
	<div class="card mb-3" id="subject"style="width:100%">
	<script><!--  화면열리자마자 함수 호출 -->
	window.onload = function(){
	//alert("호출")
	document.getElementById("userId").value = opener.document.f.id.value;
	}
	function idCheck(){ // 아이디 중복체크
		var id = document.getElementById("userId").value;
		if(!id){
			alert("아이디를 입력하지 않았습니다.");
			return false;
		}
		else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){
			alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다. ");
			return false;
		}
		else{
			$.ajax({
				url : "${path}/member/MemberIdCheckAction.do",
				type : "POST",
				data : {id : id},
				success : function(data){
					if(data == 0){ // 중복된 아이디가 있을 때 
						alert("사용할 수 없는 아이디입니다.");
						document.getElementById("cancelBtn").style.visibility = 'visible';
						document.getElementById("useBtn").style.visibility = "hidden";
						document.getElementById("msg").innerHTML = "";
					}else if(data ==1){ // 사용가능한 아이디
						document.getElementById("cancelBtn").style.visibility = "hidden";
						document.getElementById("useBtn").style.visibility = "visible";
						document.getElementById("msg").innerHTML = "사용가능한 아이디입니다.";
					}
				},
				error : function(e) {
				  alert(e.status);
		       }
			})
		}
	}
	
	// 사용하기 클릭시 부모창으로 값 전달
	function sendCheckValue(){
		// 중복체크 결과인 idCheck 값을 전달한다.
		opener.document.f.idDuplication.value = "idCheck";
		// 회원가입 화면의 ID입력란에 값을 전달
		opener.document.f.id.value = document.getElementById("userId").value;
		
		if(opener != null){
			opener.chForm = null;
			self.close();
		}
	}
	</script>
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 아이디 중복체크
		</div>
		<div class="card-body">  
			<div id = "chk">
				<form id = "checkForm">
					<input type="text" name="idinput" id = "userId">
					<input type="button" value="중복확인" onclick="idCheck()">
					<!--  중복확인 버튼 클릭시 중복체크를 하는 idCheck()호출 -->
				</form>
				<div id="msg"></div>
				<br>
				<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
				<br><br>
				<input id="useBtn" type="button" value="사용하기" onclick ='sendCheckValue()'>
				<!--  사용하기를 클릭하면 sendCheckValue()가 실행되어 입력된 값이
				회원가입 화면으로 전달된다. -->
			</div>
		</div>
		<div class="card-footer small text-muted">아이디 중복체크</div>
	</div>
</body>
</html>