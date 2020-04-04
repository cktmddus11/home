<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title><decorator:title /></title>
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Custom fonts for this template-->
<link href="../decorator/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="../decorator/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="../decorator/css/sb-admin.css" rel="stylesheet">
<style>
.bg-dark {
	background-color: #dc4048 !important;
}

.sidebar {
	background-color: #dc4048;
}
@media ( max-width : 700px) {
	.nav-item.active {
		display: none;
	}
} 
</style>
<script type="text/javascript">
$(function(){
	$("#sidebarToggle").click(function(){
		if($("ul").hasClass("sidebar navbar-nav toggled")){
			$(".w3-container").hide();
		}else{
			$(".w3-container").show();
		}
	})
})
</script>
</head>
<decorator:head/>
<body id="page-top" >

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="${path}/member/main.do">ANYTIME</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
					${sessionScope.login}님
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${path}/member/info.do">내 정보</a> 
					<a class="dropdown-item"
						href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<div class="nav-item active">		
				<div class="w3-card w3-round w3-white">
					<div class="w3-container">
						<br>
						<h4 class="w3-center">내 정보</h4>
						<p class="w3-center">
							<img src="${path}/member/picture/${mem.mem_img}" class="w3-circle"
								style="height: 106px; width: 106px" alt="Avatar">
						</p>
						<hr>
						<p>${mem.mem_name}님 <br>로그인되셨습니다!</p>

						<p>
							<i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i>
							${mem.school}
						</p>
						<p>
							<i
								class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>
							${mem.mem_dept}
						</p>
						<p>
							<button id="myprofile" align="center"
								style="margin-left: 20%; width: 50%;"
								onclick = "location.href='${path}/member/info.do'">내 정보</button>
						</p>
						<p>
							<button id="logout" align="center"
								style="margin-left: 20%; width: 50%;"
								data-toggle="modal" data-target="#logoutModal">로그아웃</button>
						</p>
					</div>
				</div>
			</div>
			<li class="nav-item active"><a class="nav-link"
				href="${path}/member/main.do"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>카테고리</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>학점계산기</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">학점 계산기 :</h6>
					<a class="dropdown-item" href="${path}/member/grade_manage.do">성적 관리 </a> <a
						class="dropdown-item" href="${path}/member/gradeview.do">성적 상세보기</a></li>
						
			<li class="nav-item"><a class="nav-link" href="${path}/member/writeForm.do">
					<i class="fas fa-fw fa-table"></i> <span>강의평</span>
			</a></li>
					
			<li class="nav-item"><a class="nav-link" href="${path}/board/list.do1">
					<i class="fas fa-fw fa-table"></i> <span>자유게시판</span>
			</a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">
				<!--  내용 -->
				<decorator:body/>
			</div>

			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright ★ github.com/cktmddus11 &nbsp;2019</span>
					</div>
				</div>
			</footer>

		</div>

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">${sessionScope.login}님</span>
					</button>
				</div>
				<div class="modal-body">로그아웃을 하면 세션이 삭제됩니다.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="${path}/member/logout.do">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../decorator/vendor/jquery/jquery.min.js"></script>
	<script src="../decorator/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../decorator/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
<!-- 	<script src="../decorator/vendor/chart.js/Chart.min.js"></script> -->
	<script src="../decorator/vendor/datatables/jquery.dataTables.js"></script>
	<script src="../decorator/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../decorator/js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="../decorator/js/demo/datatables-demo.js"></script>
	<script src="../decorator/js/demo/chart-area-demo.js"></script>

</body>

</html>
