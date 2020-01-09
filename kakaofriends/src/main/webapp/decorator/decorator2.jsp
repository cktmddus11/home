<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
   uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style> 
input[type=text] {
  width: 150px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 10px;
  background-color: white;
  background-size:20px;
  background-image: url('../images/product/ico-header-search.png');
  background-position: 10px 10px; 
  background-repeat: no-repeat;
  padding: 12px 20px 12px 40px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
  width: 100%;
}
</style>
   <style type="text/css">
   #boldfont_black_de {
   font-family: 'Noto Sans KR', sans-serif;   
   font-weight: 900;   
   color: black; 
   width: 100%;
   font-size: 24px;
}
</style>
   <script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
   <title><decorator:title/></title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="../../images/icons/favicon.png"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/slick/slick.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="../css/util.css">
   <link rel="stylesheet" type="text/css" href="../css/main.css">
   <link rel="stylesheet" type="text/css" href="../css/main_kje.css">
<!--===============================================================================================-->
  <link rel="shortcut icon" href="//t1.kakaocdn.net/kakaofriends_global/static/img/favicon.ico" type="image/x-ico">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,200,300,900&display=swap" rel="stylesheet">
  <!-- ... -->
</head>

  <!-- ... -->
</head>

</head>
<decorator:head/>
<body class="animsition">

   <!-- Header -->
   <header>
      <!-- Header desktop -->
      <div class="container-menu-desktop">
         <!-- Topbar -->
         

         <div class="wrap-menu-desktop" style="top: 0;">
            <div class="limiter-menu-desktop container">
            
               <!-- Menu desktop -->
               <div class="menu-desktop" style="width:30%;">
                  <ul class="main-menu">
                     <li class="active-menu">
                        <a href="list.store">카테고리</a>
                        <ul class="sub-menu">
                           <li><a href="product/list.store">임시 상품리스트</a></li>
                           <li><a href="product/list.store"></a></li>
                           <li><a href="home-03.html">Homepage 3</a></li>
                        </ul>
                     </li>

                     <li>
                        <a href="info/storeInfo.store">매장안내</a>
                     </li>

                     <li class="label1" data-label1="hot">
                        <a href="shoping-cart.html">고객센터</a>
                     </li>

                  
                  </ul>
               </div>   
               <!-- Logo desktop -->      
               <div class="menu-desktop"
                  style="width: 40%; ">
                  <a href="index.store" class="logo" id="boldfont_black_de" style="padding-left: 145px;"> 
                     KAKAO FRIENDS
               </a>
               </div>

               <!-- Icon header -->
               <div class="wrap-icon-header flex-w flex-r-m" style="width:30%;">
                     <form>
                    <input type="text" name="search" placeholder="무엇을 찾으세요?">
                </form>
					
                  <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
                     <i class="zmdi zmdi-shopping-cart"></i>
                  </div>

                  <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
                     <i class="zmdi zmdi-favorite-outline"></i>
                  </a>
                  <a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search" >
                     <i class="fa fa-user" aria-hidden="true"></i>
                  </a>
               </div>
              </div>
             </div>
               <hr style="margin-top: 84px; margin-bottom: 2px;">
               

               
      <!-- Header Mobile -->
      <div class="wrap-header-mobile">
         <!-- Logo moblie -->      
         <div class="logo-mobile">
            <a href="index.html"><img src="../images/icons/logo-01.png" alt="IMG-LOGO"></a>
         </div>

         <!-- Icon header -->
         <div class="wrap-icon-header flex-w flex-r-m m-r-15">
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
               <i class="zmdi zmdi-search"></i>
            </div>

            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
               <i class="zmdi zmdi-shopping-cart"></i>
            </div>

            <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
               <i class="zmdi zmdi-favorite-outline"></i>
            </a>
         </div>

         <!-- Button show menu -->
         <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
            <span class="hamburger-box">
               <span class="hamburger-inner"></span>
            </span>
         </div>
      </div>


      <!-- Menu Mobile -->
      <div class="menu-mobile">
         <ul class="topbar-mobile">
            <li>
               <div class="left-top-bar">
                  Free shipping for standard order over $100
               </div>
            </li>

            <li>
               <div class="right-top-bar flex-w h-full">
                  <a href="#" class="flex-c-m p-lr-10 trans-04">
                     Help & FAQs
                  </a>

                  <a href="#" class="flex-c-m p-lr-10 trans-04">
                     My Account
                  </a>

                  <a href="#" class="flex-c-m p-lr-10 trans-04">
                     EN
                  </a>

                  <a href="#" class="flex-c-m p-lr-10 trans-04">
                     USD
                  </a>
               </div>
            </li>
         </ul>

         <ul class="main-menu-m">
            <li>
               <a href="index.html">Home</a>
               <ul class="sub-menu-m">
                  <li><a href="index.html">Homepage 1</a></li>
                  <li><a href="home-02.html">Homepage 2</a></li>
                  <li><a href="home-03.html">Homepage 3</a></li>
               </ul>
               <span class="arrow-main-menu-m">
                  <i class="fa fa-angle-right" aria-hidden="true"></i>
               </span>
            </li>

            <li>
               <a href="product.html">Shop</a>
            </li>

            <li>
               <a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
            </li>

            <li>
               <a href="blog.html">Blog</a>
            </li>

            <li>
               <a href="about.html">About</a>
            </li>

            <li>
               <a href="contact.html">Contact</a>
            </li>
         </ul>
      </div>

      <!-- Modal Search -->
      <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
         <div class="container-search-header">
            <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
               <img src="../images/icons/icon-close2.png" alt="CLOSE">
            </button>

            <form class="wrap-search-header flex-w p-l-15">
               <button class="flex-c-m trans-04">
                  <i class="zmdi zmdi-search"></i>
               </button>
               <input class="plh3" type="text" name="search" placeholder="Search...">
            </form>
         </div>
      </div>
   </div>
</header>

   <!-- Cart -->
   <div class="wrap-header-cart js-panel-cart">
      <div class="s-full js-hide-cart"></div>

      <div class="header-cart flex-col-l p-l-65 p-r-25">
         <div class="header-cart-title flex-w flex-sb-m p-b-8">
            <span class="mtext-103 cl2">
               Your Cart
            </span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
               <i class="zmdi zmdi-close"></i>
            </div>
         </div>
         
         <div class="header-cart-content flex-w js-pscroll">
            <ul class="header-cart-wrapitem w-full">
               <li class="header-cart-item flex-w flex-t m-b-12">
                  <div class="header-cart-item-img">
                     <img src="../images/item-cart-01.jpg" alt="IMG">
                  </div>

                  <div class="header-cart-item-txt p-t-8">
                     <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                        White Shirt Pleat
                     </a>

                     <span class="header-cart-item-info">
                        1 x $19.00
                     </span>
                  </div>
               </li>

               <li class="header-cart-item flex-w flex-t m-b-12">
                  <div class="header-cart-item-img">
                     <img src="../images/item-cart-02.jpg" alt="IMG">
                  </div>

                  <div class="header-cart-item-txt p-t-8">
                     <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                        Converse All Star
                     </a>

                     <span class="header-cart-item-info">
                        1 x $39.00
                     </span>
                  </div>
               </li>

               <li class="header-cart-item flex-w flex-t m-b-12">
                  <div class="header-cart-item-img">
                     <img src="../images/item-cart-03.jpg" alt="IMG">
                  </div>

                  <div class="header-cart-item-txt p-t-8">
                     <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                        Nixon Porter Leather
                     </a>

                     <span class="header-cart-item-info">
                        1 x $17.00
                     </span>
                  </div>
               </li>
            </ul>
            
            <div class="w-full">
               <div class="header-cart-total w-full p-tb-40">
                  Total: $75.00
               </div>

               <div class="header-cart-buttons flex-w w-full">
                  <a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                     View Cart
                  </a>

                  <a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                     Check Out
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>

      

   <!-- Slider -->
   <section class="section-slide">
   <div></div>
   </section>

   <!-- Banner -->
<!-- <div class="sec-banner bg0 p-t-80 p-b-50">
   </div> -->

   <!-- Product -->
   <section class="bg0 p-t-23 p-b-140">
      <div class="container">
      <decorator:body/>
         <div class="flex-w flex-sb-m p-b-25" >
            <!-- Search product -->
            <div class="dis-none panel-search w-full p-t-10 p-b-15">
               <div class="bor8 dis-flex p-l-15">
                  <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
                     <i class="zmdi zmdi-search"></i>
                  </button>

                  <input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
               </div>   
            </div>

            <!-- Filter -->
            <div class="dis-none panel-filter w-full p-t-10">
               <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
                  <div class="filter-col1 p-r-15 p-b-27">
                     <div class="mtext-102 cl2 p-b-15">
                        Sort By
                     </div>

                     <ul>
                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              Default
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              Popularity
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              Average rating
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04 filter-link-active">
                              Newness
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              Price: Low to High
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              Price: High to Low
                           </a>
                        </li>
                     </ul>
                  </div>

                  <div class="filter-col2 p-r-15 p-b-27">
                     <div class="mtext-102 cl2 p-b-15">
                        Price
                     </div>

                     <ul>
                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04 filter-link-active">
                              All
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              $0.00 - $50.00
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              $50.00 - $100.00
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              $100.00 - $150.00
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              $150.00 - $200.00
                           </a>
                        </li>

                        <li class="p-b-6">
                           <a href="#" class="filter-link stext-106 trans-04">
                              $200.00+
                           </a>
                        </li>
                     </ul>
                  </div>

                  <div class="filter-col3 p-r-15 p-b-27">
                     <div class="mtext-102 cl2 p-b-15">
                        Color
                     </div>

                     <ul>
                        <li class="p-b-6">
                           <span class="fs-15 lh-12 m-r-6" style="color: #222;">
                              <i class="zmdi zmdi-circle"></i>
                           </span>

                           <a href="#" class="filter-link stext-106 trans-04">
                              Black
                           </a>
                        </li>

                        <li class="p-b-6">
                           <span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
                              <i class="zmdi zmdi-circle"></i>
                           </span>

                           <a href="#" class="filter-link stext-106 trans-04 filter-link-active">
                              Blue
                           </a>
                        </li>

                        <li class="p-b-6">
                           <span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;">
                              <i class="zmdi zmdi-circle"></i>
                           </span>

                           <a href="#" class="filter-link stext-106 trans-04">
                              Grey
                           </a>
                        </li>

                        <li class="p-b-6">
                           <span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;">
                              <i class="zmdi zmdi-circle"></i>
                           </span>

                           <a href="#" class="filter-link stext-106 trans-04">
                              Green
                           </a>
                        </li>

                        <li class="p-b-6">
                           <span class="fs-15 lh-12 m-r-6" style="color: #fa4251;">
                              <i class="zmdi zmdi-circle"></i>
                           </span>

                           <a href="#" class="filter-link stext-106 trans-04">
                              Red
                           </a>
                        </li>

                        <li class="p-b-6">
                           <span class="fs-15 lh-12 m-r-6" style="color: #aaa;">
                              <i class="zmdi zmdi-circle-o"></i>
                           </span>

                           <a href="#" class="filter-link stext-106 trans-04">
                              White
                           </a>
                        </li>
                     </ul>
                  </div>

                  <div class="filter-col4 p-b-27">
                     <div class="mtext-102 cl2 p-b-15">
                        Tags
                     </div>

                     <div class="flex-w p-t-4 m-r--5">
                        <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                           Fashion
                        </a>

                        <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                           Lifestyle
                        </a>

                        <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                           Denim
                        </a>

                        <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                           Streetstyle
                        </a>

                        <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                           Crafts
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="row isotope-grid">
            
         </div>

         <!-- Load more -->
         <div class="flex-c-m flex-w w-full p-t-45">
            <a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
               Load More
            </a>
         </div>
      </div>
   </section>


   <!-- Footer -->
   <footer class="bg3 p-t-75 p-b-32">
      <div class="container">
         <div class="row">
            

            <div class="col-sm-6 col-lg-3 p-b-50">
               <h4 class="stext-301 cl0 p-b-30">GET IN TOUCH</h4>

               <p class="stext-107 cl7 size-201">카카오아이엑스 사업자등록번호 : 354-86-00070<br>
통신판매업 신고번호 : 2017-서울강남-02573<br>
대표이사 : 권승조<br>
주소 : 서울특별시 강남구 테헤란로 521 파르나스타워, 27층<br>
고객센터 : 1577-6263 / 평일 10시 ~ 18시


            <!--    <div class="p-t-27">
                  <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16"> <i
                     class="fa fa-facebook"></i>
                  </a> <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16"> <i
                     class="fa fa-instagram"></i>
                  </a> <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16"> <i
                     class="fa fa-pinterest-p"></i>
                  </a>
               </div> -->
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
               <h4 class="stext-301 cl0 p-b-30">
                        Questions</h4>

               <form>
                  <div class="wrap-input1 w-full p-b-4">
                     <input class="input1 bg-none plh1 stext-107 cl7" type="text"
                        name="email" placeholder="store@kakaofriends.com">
                     <div class="focus-input1 trans-04"></div>
                  </div>

                  <div class="p-t-18">
                     <button
                        class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
                        Subscribe</button>
                  </div>
               </form>
               
            </div>
            <div class="col-sm-6 col-lg-3 p-b-50">
               <h4 class="stext-301 cl0 p-b-30">Global Questions</h4>

            <form>
                  <div class="wrap-input1 w-full p-b-4">
                     <input class="input1 bg-none plh1 stext-107 cl7" type="text"
                        name="email" placeholder="global@kakaofriends.com">
                     <div class="focus-input1 trans-04"></div>
                  </div>

                  <div class="p-t-18">
                     <button
                        class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
                        Subscribe</button>
                  </div>
               </form>
               
            </div>
         </div>

         <!-- <div class="p-t-40">
            <div class="flex-c-m flex-w p-b-18">
               <a href="#" class="m-all-1"> <img
                  src="../images/icons/icon-pay-01.png" alt="ICON-PAY">
               </a> <a href="#" class="m-all-1"> <img
                  src="../images/icons/icon-pay-02.png" alt="ICON-PAY">
               </a> <a href="#" class="m-all-1"> <img
                  src="../images/icons/icon-pay-03.png" alt="ICON-PAY">
               </a> <a href="#" class="m-all-1"> <img
                  src="../images/icons/icon-pay-04.png" alt="ICON-PAY">
               </a> <a href="#" class="m-all-1"> <img
                  src="../images/icons/icon-pay-05.png" alt="ICON-PAY">
               </a>
            </div> -->

            <p class="stext-107 cl6 txt-center">
               <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
               Copyright &copy;
               <script>document.write(new Date().getFullYear());</script>
               All rights reserved | Made with <i class="fa fa-heart-o"
                  aria-hidden="true"></i> by <a href="https://colorlib.com"
                  target="_blank">Colorlib</a> &amp; distributed by <a
                  href="https://themewagon.com" target="_blank">ThemeWagon</a>
               <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

            </p>
         </div>
   </footer>


   <!-- Back to top -->
   <div class="btn-back-to-top" id="myBtn">
      <span class="symbol-btn-back-to-top">
         <i class="zmdi zmdi-chevron-up"></i>
      </span>
   </div>

   <!-- Modal1 -->
   <div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
      <div class="overlay-modal1 js-hide-modal1"></div>

      <div class="container">
         <div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
            <button class="how-pos3 hov3 trans-04 js-hide-modal1">
               <img src="../images/icons/icon-close.png" alt="CLOSE">
            </button>

            <div class="row">
               <div class="col-md-6 col-lg-7 p-b-30">
                  <div class="p-l-25 p-r-30 p-lr-0-lg">
                     <div class="wrap-slick3 flex-sb flex-w">
                        <div class="wrap-slick3-dots"></div>
                        <div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

                        <div class="slick3 gallery-lb">
                           <div class="item-slick3" data-thumb="../images/product/20200102183712810_8809681703895_AW_00.jpg">
                              <div class="wrap-pic-w pos-relative">
                                 <img src="../images/product/20200102183712810_8809681703895_AW_00.jpg" alt="IMG-PRODUCT">

                                 <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" 
                                 href="../images/product/20200102183712810_8809681703895_AW_00.jpg">
                                    <i class="fa fa-expand"></i>
                                 </a>
                              </div>
                           </div>

                           <div class="item-slick3" data-thumb="../images/product/20200102183712848_8809681703895_AW_01.jpg">
                              <div class="wrap-pic-w pos-relative">
                                 <img src="../images/product/20200102183712848_8809681703895_AW_01.jpg" alt="IMG-PRODUCT">

                                 <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" 
                                 href="../images/product/20200102183712848_8809681703895_AW_01.jpg">
                                    <i class="fa fa-expand"></i>
                                 </a>
                              </div>
                           </div>

                           <div class="item-slick3" data-thumb="../images/product/20200102183713022_8809681703895_AW_02.jpg">
                              <div class="wrap-pic-w pos-relative">
                                 <img src="../images/product/20200102183713022_8809681703895_AW_02.jpg" alt="IMG-PRODUCT">

                                 <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" 
                                 href="../images/product/20200102183713022_8809681703895_AW_02.jpg">
                                    <i class="fa fa-expand"></i>
                                 </a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
               <div class="col-md-6 col-lg-5 p-b-30">
                  <div class="p-r-50 p-t-5 p-lr-0-lg">
                     <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                        롱바디필로우_후드라이언(핑크)
                     </h4>

                     <span class="mtext-106 cl2">
                        49,000원
                     </span>

                     <p class="stext-102 cl3 p-t-23">
                        잠잘때 필수템!
                        갖고싶다
                     </p>
                     
                     <!--  -->
                     <div class="p-t-33">
                        
                        </div>

                        <div class="flex-w flex-r-m p-b-10">
                           <div class="size-204 flex-w flex-m respon6-next">
                              <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                                 <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                    <i class="fs-16 zmdi zmdi-minus"></i>
                                 </div>

                                 <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

                                 <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                    <i class="fs-16 zmdi zmdi-plus"></i>
                                 </div>
                              </div>

                              <button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
                                 장바구니 담기
                              </button>
                           </div>
                        </div>   
                     </div>

                     <!--  -->
                     <div class="flex-w flex-m p-l-100 p-t-40 respon7">
                        <div class="flex-m bor9 p-r-10 m-r-11">
                           <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
                              <i class="zmdi zmdi-favorite"></i>
                           </a>
                        </div>

                        <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
                           <i class="fa fa-facebook"></i>
                        </a>

                        <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
                           <i class="fa fa-twitter"></i>
                        </a>

                        <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
                           <i class="fa fa-google-plus"></i>
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

<!--===============================================================================================-->   
   <script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="../vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script src="../vendor/bootstrap/js/popper.js"></script>
   <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="../vendor/select2/select2.min.js"></script>
   <script>
      $(".js-select2").each(function(){
         $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
         });
      })
   </script>
<!--===============================================================================================-->
   <script src="../vendor/daterangepicker/moment.min.js"></script>
   <script src="../vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
   <script src="../vendor/slick/slick.min.js"></script>
   <script src="../js/slick-custom.js"></script>
<!--===============================================================================================-->
   <script src="../vendor/parallax100/parallax100.js"></script>
   <script>
        $('.parallax100').parallax100();
   </script>
<!--===============================================================================================-->
   <script src="../vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
   <script>
      $('.gallery-lb').each(function() { // the containers for all your galleries
         $(this).magnificPopup({
              delegate: 'a', // the selector for gallery item
              type: 'image',
              gallery: {
                 enabled:true
              },
              mainClass: 'mfp-fade'
          });
      });
   </script>
<!--===============================================================================================-->
   <script src="../vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
   <script src="../vendor/sweetalert/sweetalert.min.js"></script>
   <script>
      $('.js-addwish-b2').on('click', function(e){
         e.preventDefault();
      });

      $('.js-addwish-b2').each(function(){
         var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
         $(this).on('click', function(){
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-b2');
            $(this).off('click');
         });
      });

      $('.js-addwish-detail').each(function(){
         var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

         $(this).on('click', function(){
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-detail');
            $(this).off('click');
         });
      });

      /*---------------------------------------------*/

      $('.js-addcart-detail').each(function(){
         var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
         $(this).on('click', function(){
            swal(nameProduct, "is added to cart !", "success");
         });
      });
   
   </script>
<!--===============================================================================================-->
   <script src="../vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
   <script>
      $('.js-pscroll').each(function(){
         $(this).css('position','relative');
         $(this).css('overflow','hidden');
         var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
         });

         $(window).on('resize', function(){
            ps.update();
         })
      });
   </script>
<!--===============================================================================================-->
   <script src="../js/main.js"></script>
   
<!--===============================================================================================-->
   <script>
   /*Dropdown Menu*/
   $('.dropdown').click(function () {
           $(this).attr('tabindex', 1).focus();
           $(this).toggleClass('active');
           $(this).find('.dropdown-menu').slideToggle(300);
       });
       $('.dropdown').focusout(function () {
           $(this).removeClass('active');
           $(this).find('.dropdown-menu').slideUp(300);
       });
       $('.dropdown .dropdown-menu li').click(function () {
           $(this).parents('.dropdown').find('span').text($(this).text());
           $(this).parents('.dropdown').find('input').attr('value', $(this).attr('id'));
       });
   /*End Dropdown Menu*/
   
   </script>
   
<!--===============================================================================================-->

</body>
</html>