<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� �ߺ�üũ</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
	<div class="card mb-3" id="subject"style="width:100%">
	<script><!--  ȭ�鿭���ڸ��� �Լ� ȣ�� -->
	window.onload = function(){
	//alert("ȣ��")
	document.getElementById("userId").value = opener.document.f.id.value;
	}
	function idCheck(){ // ���̵� �ߺ�üũ
		var id = document.getElementById("userId").value;
		if(!id){
			alert("���̵� �Է����� �ʾҽ��ϴ�.");
			return false;
		}
		else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){
			alert("�ѱ� �� Ư�����ڴ� ���̵�� ����Ͻ� �� �����ϴ�. ");
			return false;
		}
		else{
			$.ajax({
				url : "${path}/member/MemberIdCheckAction.do",
				type : "POST",
				data : {id : id},
				success : function(data){
					if(data == 0){ // �ߺ��� ���̵� ���� �� 
						alert("����� �� ���� ���̵��Դϴ�.");
						document.getElementById("cancelBtn").style.visibility = 'visible';
						document.getElementById("useBtn").style.visibility = "hidden";
						document.getElementById("msg").innerHTML = "";
					}else if(data ==1){ // ��밡���� ���̵�
						document.getElementById("cancelBtn").style.visibility = "hidden";
						document.getElementById("useBtn").style.visibility = "visible";
						document.getElementById("msg").innerHTML = "��밡���� ���̵��Դϴ�.";
					}
				},
				error : function(e) {
				  alert(e.status);
		       }
			})
		}
	}
	
	// ����ϱ� Ŭ���� �θ�â���� �� ����
	function sendCheckValue(){
		// �ߺ�üũ ����� idCheck ���� �����Ѵ�.
		opener.document.f.idDuplication.value = "idCheck";
		// ȸ������ ȭ���� ID�Է¶��� ���� ����
		opener.document.f.id.value = document.getElementById("userId").value;
		
		if(opener != null){
			opener.chForm = null;
			self.close();
		}
	}
	</script>
		<div class="card-header">
			<i class="fas fa-chart-area"></i> ���̵� �ߺ�üũ
		</div>
		<div class="card-body">  
			<div id = "chk">
				<form id = "checkForm">
					<input type="text" name="idinput" id = "userId">
					<input type="button" value="�ߺ�Ȯ��" onclick="idCheck()">
					<!--  �ߺ�Ȯ�� ��ư Ŭ���� �ߺ�üũ�� �ϴ� idCheck()ȣ�� -->
				</form>
				<div id="msg"></div>
				<br>
				<input id="cancelBtn" type="button" value="���" onclick="window.close()">
				<br><br>
				<input id="useBtn" type="button" value="����ϱ�" onclick ='sendCheckValue()'>
				<!--  ����ϱ⸦ Ŭ���ϸ� sendCheckValue()�� ����Ǿ� �Էµ� ����
				ȸ������ ȭ������ ���޵ȴ�. -->
			</div>
		</div>
		<div class="card-footer small text-muted">���̵� �ߺ�üũ</div>
	</div>
</body>
</html>