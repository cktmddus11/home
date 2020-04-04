<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=353r60ajhw&amp;submodules=panorama,geocoder,drawing,visualization"></script>
  <script src="https://navermaps.github.io/maps.js.ncp/docs/js/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="https://navermaps.github.io/maps.js.ncp/docs/js/base.js"></script>
<title>위치 정보 페이지</title>

 <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  
  <link href="css/u_sb-admin-2.min.css" rel="stylesheet">
   <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <jsp:include page="Sidebar.jsp" flush="false" />

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
      	<jsp:include page="Topbar.jsp" />
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

               <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-1 text-gray-800">건물 위치 정보 검색</h1>
          <p class="mb-4">위치 선택</p>

          <!-- Content Row -->
          <div class="row">

            <div class="col-lg-6">

              <!-- Overflow Hidden -->
              <div class="card mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">지도</h6>
                </div>
                <div class="card-body">
                <jsp:include page ="map.html" flush="false" />
                </div>
              </div>
            </div>
				
				    <div class="col-lg-6">

              <!-- Roitation Utilities -->
              <div class="card">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Rotation Utilities</h6>
                </div>
                <div class="card-body text-center">
                   <div id="searchform">
  <!-- 
  <input type="text" id="lat" name = "lat" value="">
  <input type="text" id="lng" name="lng" value="">
   -->
  
  <form method="post" action="">
  <select name="sk">
  <option value="build">건물명</option>
  <option value="dept">학과명</option>
  <option value="lecture">호수</option>
  </select>
  <input type="text" id="search_value" value="" name="sv" />
  <input type="submit" id="address" value="검색"  />
 
  </form>
  <br />
  <form>
  

  <jsp:include page="geoSearch_act.jsp" flush="false"/>
    <!-- geoSearch_act.jsp 검색한 결과값(주소) 출력 텍스트 박스  -->
  <input type="text" id="add" value="" style="width:278px"/>    
  <input type="button" id="location" value="구글맵이동"/>
   <script>
  
   </script>
  </form>
  </div>		
                </div>
              </div>

            </div>
				
				
       
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
</html>