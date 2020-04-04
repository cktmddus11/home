<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Sidebar</title>
<script>
function check(){
	var id="<%=session.getAttribute("sessionID")%>";
	if(id =="null"){		
		alert("로그인이 필요합니다. ");
		return false;
	}else if(id != "null"){
		//alert("이동 ");
		location.href="calpage.jsp";
	}
}
</script>
</head>
<body>
	 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="u_index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SLIP CLIENT</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="u_index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>SLIP</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        menu
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fas fa-fw fa-cog"></i>
          <span>강의실 정보</span>
        </a>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fas fa-fw fa-wrench"></i>
          <span>개인 시간표</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="javascript:check()">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>일정관리</span>
          </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="geo.jsp">
          <i class="fas fa-fw fa-folder"></i>
          <span>강의실 위치 정보</span>
        </a>
      </li>
      
      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>두원 TALK</span>
          </a>
      </li>


    <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>

	
</body>
</html>