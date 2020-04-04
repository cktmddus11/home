<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<body>
	<script>
$(function(){
	// 총 평점
	var star = $('.reviewstar1 span')
	//var score2 = $("#score").val();
	var score2 = 3.5;
	var score = score2 * 2 // 3.5 =>7개
	
	$('.reviewstar1').find('span').each(function(i, e){
	    if(i < score){
			$(this).addClass('on');
	    }
	});
	// 리뷰어 평점
	var star = $('.reviewstar2 span')
	var score3 = 2.5;
	var score4 = score3 * 2
	$('.reviewstar2').find('span').each(function(i, e){
	    if(i < score4){
			$(this).addClass('on');
	    }
	});
	
	// 리뷰 작성 평점 클릭이벤트
	$('.starRev1 span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
	});

	
})
</script>
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
				Men <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> Lightweight Jacket </span>
		</div>
	</div>

	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
			  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="../images/phonecase1.jpg">
									<div class="wrap-pic-w pos-relative">
										<img src="../images/phonecase1.jpg" alt="IMG-PRODUCT"> <a
											class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
											href="../images/phonecase1.jpg"> <i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="../images/phonecase2.jpg">
									<div class="wrap-pic-w pos-relative">
										<img src="../images/phonecase2.jpg" alt="IMG-PRODUCT"> <a
											class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
											href="../images/phonecase2.jpg"> <i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">PU카드케이스_RYAN
						</h4>

						<span class="mtext-106 cl2"> 25,000원 </span> <br>
						<br>


						<!-- <div class="starRev2"> -->
						<div class="reviewstar1">
							<span class="starR1">별1_왼</span> <span class="starR2">별1_오</span>
							<span class="starR1">별2_왼</span> <span class="starR2">별2_오</span>
							<span class="starR1">별3_왼</span> <span class="starR2">별3_오</span>
							<span class="starR1">별4_왼</span> <span class="starR2">별4_오</span>
							<span class="starR1">별5_왼</span> <span class="starR2">별5_오</span>

						</div>
						<div id="review" style="font-size: 20px">(3)</div>


						<!--  -->
						<div class="p-t-33">
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">기종선택</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="time">
											<option>기종선택</option>
											<option>(IX/XS)글리터 케이스_리틀라이언</option>
											<option>(I11Pro)글리터 케이스_리틀라이언</option>
											<option>(I11Pro)글리터 케이스_리틀라이언</option>
											<option>(I11Pro)글리터 케이스_리틀라이언</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">Color</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="time">
											<option>Choose an option</option>
											<option>Red</option>
											<option>Blue</option>
											<option>White</option>
											<option>Grey</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div
											class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product"
											type="number" name="num-product" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>


								</div>
							</div>
						</div>
						<div class="flex-w flex-r-m p-b-10">
							<button
								class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
								장바구니 담기 <i class="zmdi zmdi-shopping-cart"></i>
								<!--  카트 아이콘 -->
							</button>
							&nbsp;&nbsp;
							<button
								class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 pointer js-show-modal2">
								바로 구매&nbsp;&nbsp;</button>
						</div>

						<!--  -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
									data-tooltip="Add to Wishlist"> <i
									class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
							</a> <a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
							</a> <a href="#"
								class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
								data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10"><a class="nav-link active"
							data-toggle="tab" href="#description" role="tab">상세내용</a></li>

						<li class="nav-item p-b-10"><a class="nav-link"
							data-toggle="tab" href="#information" role="tab">세부정보</a></li>

						<li class="nav-item p-b-10"><a class="nav-link"
							data-toggle="tab" href="#reviews" role="tab">리뷰</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description"
							role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<!-- 	<p class="stext-102 cl6"> -->
								<!--  상세 내용 작성 -->
								<img
									src="http://t1.daumcdn.net/friends/prod/editor/0e1e9544-d7b4-4340-b506-75a08d1ba217.jpg"
									style="width: 100%">
								<!-- 	</p> -->
							</div>
							<br>
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">위 사진은 아이폰 I11Pro 기종 착용컷입니다.</p>
							</div>
							<br>
							<div class="how-pos2 p-lr-15-md">
								<!-- 	<p class="stext-102 cl6"> -->
								<!--  상세 내용 작성 -->
								<img
									src="http://t1.daumcdn.net/friends/prod/editor/05c06e28-dcc1-4380-9f9a-04f6ff023d1c.jpg"
									style="width: 100%">
								<!-- 	</p> -->
							</div>
							<div class="how-pos2 p-lr-15-md">
								<!-- 	<p class="stext-102 cl6"> -->
								<!--  상세 내용 작성 -->
								<img
									src="http://t1.daumcdn.net/friends/prod/editor/f3d9c289-391a-4ccb-a3aa-7324694ae996.jpg"
									style="width: 100%">
								<!-- 	</p> -->
							</div>

						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> 품명 및 모델명 </span> <span
											class="stext-102 cl6 size-206"> (I11)PU카드케이스_라이언
												8809681703802 / (I11Pro)PU카드케이스_라이언 8809681703819 /
												(I11ProMax)PU카드케이스_라이언 8809681703826 </span></li>
										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> 법에 의한 인증, 허가 </span> <span
											class="stext-102 cl6 size-206"> 해당없음 </span></li>
										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> 크기/중량 </span> <span
											class="stext-102 cl6 size-206"> I11 55*80mm / I11Pro
												145*75mm / I11ProMax 160*82mm / I7/8 75*148*16mm / IX/XS
												140*71*1mm / S105G 164*81*18mm </span></li>

										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> 재질 </span> <span
											class="stext-102 cl6 size-206"> PU </span></li>
										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> 제조국 </span> <span
											class="stext-102 cl6 size-206"> 중국 </span></li>
										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> 제조사 </span> <span
											class="stext-102 cl6 size-206"> ㈜리라이코리아 </span></li>
										<li class="flex-w flex-t p-b-7"><span
											class="stext-102 cl3 size-205"> 취급 시 주의사항 </span> <span
											class="stext-102 cl6 size-206"> 1) 고온에 장시간 노출될 경우 재질의
												특성상 제품의 변형이 일어날 수 있습니다. </span> <span
											class="stext-102 cl3 size-205"> </span> <span
											class="stext-102 cl6 size-206"> 2) 제품 착탈 시 과도한 힘은 제품
												또는 기기에 손상을 줄 수 있습니다. </span> <span class="stext-102 cl3 size-205">
										</span> <span class="stext-102 cl6 size-206"> 3) 사용자의 부주의로 인한
												파손 및 변질은 책임지지 않습니다. </span> <span class="stext-102 cl3 size-205">
										</span> <span class="stext-102 cl6 size-206"> A/S책임자와 전화번호 :
												카카오프렌즈 고객센터 1577-6263 </span></li>
									</ul>
								</div>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<div class="flex-w flex-t p-b-68">
											<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img src="../images/avatar-01.jpg" alt="리뷰작성자이미지">
											</div>

											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20"> 차승연 </span>

													<div class="reviewstar2">
														<span class="starR1">별1_왼</span> <span class="starR2">별1_오</span>
														<span class="starR1">별2_왼</span> <span class="starR2">별2_오</span>
														<span class="starR1">별3_왼</span> <span class="starR2">별3_오</span>
														<span class="starR1">별4_왼</span> <span class="starR2">별4_오</span>
														<span class="starR1">별5_왼</span> <span class="starR2">별5_오</span>

													</div>
												</div>

												<p class="stext-102 cl6">아이폰이 없어서 사지 못하지만 넘모 예쁩니다 ^^7
													나대신 사주세요 ^^7</p>
											</div>
										</div>

										<!-- Add review -->
										<form class="w-full">
											<h5 class="mtext-108 cl2 p-b-7">리뷰를 남겨주세요</h5>

											<p class="stext-102 cl6">리뷰를 남겨주시면 포인트를 적립해드립니다</p>

											<div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16"> 평점 </span>

												<div class="starRev1">
													<span class="starR1">별1_왼</span> <span class="starR2">별1_오</span>
													<span class="starR1">별2_왼</span> <span class="starR2">별2_오</span>
													<span class="starR1">별3_왼</span> <span class="starR2">별3_오</span>
													<span class="starR1">별4_왼</span> <span class="starR2">별4_오</span>
													<span class="starR1">별5_왼</span> <span class="starR2">별5_오</span>

												</div>
											</div>

											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">리뷰 작성</label>
													<textarea
														class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"
														id="review" name="review"></textarea>
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="name">이름(또는 별명)</label> <input
														class="size-111 bor8 stext-102 cl2 p-lr-20" id="name"
														type="text" name="name" value="차승연">
													<!--  로그인한 사람의 이름 -->
												</div>
											</div>

											<button
												class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
												Submit</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="wrap-modal2 js-modal2 p-b-20 bUaVHd">
		<div class="overlay-modal2 js-hide-modal2"></div>

		<div class="container" style="border-radius: 5px;">
			<div class="bg0 p-t-60 p-b-0 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal2">
					<img src="../images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div class=""
						style="width: 100%; padding-left: 10%; padding-right: 10%;">
						<div class="">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14"
								style="text-align: center; font-weight: bold;">
								카카오프렌즈 회원구매 혜택<br>
							</h4>
							<h4 class="mtext-105 cl2 js-name-detail p-b-14"
								style="text-align: center">
								신규 가입시 1,000포인트 즉시 지급!<br> 회원 구매시 3% 적립!
							</h4>
							<div style="text-align : center">
								<img 
									src="http://t1.kakaocdn.net/friends/new_store/bg_benefit2.png"
									class="check-member-popup__TambourineRyan-sc-1mlxq2j-4 gNwgdH">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="bg0">
				<table style="width : 100%;margin:auto; border-top: 1px solid #d8d8d8;">
					<tr>
						<td class="p-t-20 p-b-20" style="text-align : center; font-size: 20px; border-right: 1px solid #d8d8d8; width:50%;">
						<a href="" style="color : black;">비회원 구매</a></td>
						<td class="p-t-20 p-b-20" style="text-align : center; font-size: 20px;">
						<strong><a href="" style="color : black;">간편 회원 구매</a></strong></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	
</body>
</html>