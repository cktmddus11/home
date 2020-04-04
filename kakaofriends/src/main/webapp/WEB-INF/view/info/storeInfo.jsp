<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 안내</title>
<style type="text/css">
#boldfont_black {
	font-family: 'Noto Sans KR', sans-serif;	
	font-weight: 900;	
	color: black; 
	width: 100%;
	font-size: 36px;
}
#lightfont_black {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;	
	color: black;
	width: 100%;
	font-size: 15px;
}
div.left{
		width: 50%;
        float: left;
        box-sizing: border-box;
}
div.right{
		width: 45%;
	    margin-top: 4%;
	    height:210px;
        float: right;
        box-sizing: border-box;
}
a.noul:hover{
text-decoration: none;
}
a.noul{
text-decoration: underline;
}
#my-iframe {margin: 0 auto;} 
#my-iframe {display:block;border:none;height:100%;width:100%;}
</style>
</head>
<body>
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<div class="card mb-4" style="width:100%">
					<img class="card-img-top" src="${path }/images/storeinfo_store/bg_storeInfo_gangnam_W.jpg"
						alt="Card image cap">
					<div class="card-body" style="width: 100%;">
						<div class="left">
						<br>
						<h2 class="card-title" id="boldfont_black">강남 플래그십 스토어</h2>
						<br>
						<h3 class="card-text" id="lightfont_black" style="margin-bottom: 16px;">
							<img src="${path }/images/icons/ico_phone.png" style="height: 27px; width: 27px; " >&nbsp; 02-6494-1100 (매장), 02-596-9009 (3F 콰르텟 카페)
						</h3>
						<h3 class="card-text" id="lightfont_black" style="margin-bottom: 16px;">
							<img src="${path }/images/icons/ico_time.png" style="height: 27px; width: 27px; " >&nbsp; 매일 10:30 - 22:00
						</h3>
						<h3 class="card-text" id="lightfont_black" style="margin-bottom: 16px;">
							<img src="${path }/images/icons/ico_map.png" style="height: 27px; width: 27px;" >&nbsp; 서울 서초구 서초동 1305-	7 유창빌딩 1~3층
						</h3>
						</div>
						<!-- <a href="#" class="btn btn-primary">Read More &rarr;</a> -->
						<div class="right" >
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.30321189235!2d127.02359651530986!3d37.500766179810334!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca158e3eb7817%3A0x9477be46958f3844!2z7Lm07Lm07Jik7ZSE66CM7KaIIO2UjOuemOq3uOyLrSDsiqTthqDslrQg6rCV64KoIEtBS0FPIEZSSUVORFMgRmxhZ3NoaXAgc3RvcmUgR2FuZ25hbQ!5e0!3m2!1sko!2skr!4v1578025561070!5m2!1sko!2skr"
							id="my-iframe" 
							width="495" height="210" frameborder="0" style="border:0; right: 40px; top: 40px;" allowfullscreen="" ></iframe>
						</div>
					</div>
					<!-- 
					<div class="card-footer text-muted">
						<a class="google-map__MapCloseUpLink-sc-1bi5hyw-2 kvfxHy" href="https://www.google.com/maps/place/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%94%84%EB%A0%8C%EC%A6%88+%EA%B0%95%EB%82%A8%ED%94%8C%EB%9E%98%EA%B7%B8%EC%8B%AD%EC%8A%A4%ED%86%A0%EC%96%B4/@37.5008429,127.0234929,17z/data=!3m1!4b1!4m5!3m4!1s0x357ca158e3eb7817:0x9477be46958f3844!8m2!3d37.5008429!4d127.0256816" target="_blank">지도 자세히보기</a>
					</div> 
					-->
				</div>
			</div>
		</div>
			<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<div class="card mb-4" style="width:100%">
					<img class="card-img-top" src="${path }/images/storeinfo_store/bg_storeInfo_busan_W.jpg"
						alt="Card image cap">
				<div class="card-body" style="width: 100%;">
						<div class="left">
						<br>
						<h2 class="card-title" id="boldfont_black">부산 플래그십 스토어</h2>
						<br>
						<h3 class="card-text" id="lightfont_black" style="margin-bottom: 16px;">
							<img src="${path }/images/icons/ico_phone.png" style="height: 27px; width: 27px; " >&nbsp; 051-256-0815
						</h3>
						<h3 class="card-text" id="lightfont_black" style="margin-bottom: 16px;">
							<img src="${path }/images/icons/ico_time.png" style="height: 27px; width: 27px; " >&nbsp; 매일 10:30 - 22:00
						</h3>
						<h3 class="card-text" id="lightfont_black" style="margin-bottom: 16px;">
							<img src="${path }/images/icons/ico_map.png" style="height: 27px; width: 27px;" >&nbsp; 부산 중구 광복로 62 (광복동2가)
						</h3>
						</div>
						<!-- <a href="#" class="btn btn-primary">Read More &rarr;</a> -->
						<div class="right" >
							<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3264.3072661317237!2d129.0294186!3d35.0990376!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568e90adde9576d%3A0x6f9203ac6a3b9cb8!2z7Lm07Lm07Jik7ZSE66CM7KaIIOu2gOyCsCDtlIzrnpjqt7jsi63siqTthqDslrQ!5e0!3m2!1sko!2skr!4v1578028821200!5m2!1sko!2skr"
							id="my-iframe"
							width="495" height="210" frameborder="0" style="border:0; right: 40px; top: 40px;" allowfullscreen="" ></iframe>
						</div>
					</div>
					
					<!-- 
					<div class="card-footer text-muted">
						<a class="google-map__MapCloseUpLink-sc-1bi5hyw-2 kvfxHy" href="https://www.google.com/maps/place/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%94%84%EB%A0%8C%EC%A6%88+%EA%B0%95%EB%82%A8%ED%94%8C%EB%9E%98%EA%B7%B8%EC%8B%AD%EC%8A%A4%ED%86%A0%EC%96%B4/@37.5008429,127.0234929,17z/data=!3m1!4b1!4m5!3m4!1s0x357ca158e3eb7817:0x9477be46958f3844!8m2!3d37.5008429!4d127.0256816" target="_blank">지도 자세히보기</a>
					</div> 
					-->
				</div>
				<div style="margin-top: 20%;">
				<button id="lightfont_black" name="btn" style="font-size: 20px; width: 10%; " onclick="javascript:borderline(this)">전체</button>
				<button id="lightfont_black" name="btn" style="font-size: 20px; width: 10%; " onclick="javascript:borderline(this)">한국</button>
				<button id="lightfont_black" name="btn" style="font-size: 20px; width: 10%; " onclick="javascript:borderline(this)">일본</button>
				</div>
				<hr>
				<!--  -->
				<!--  -->
				<!--  -->
				<div class="container" style="">
	<div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item" style="padding-bottom: 1.5%;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path }/images/storeinfo_store/W001_incheon_T2.jpg" alt=""></a>
          <div class="card-body">
				<h4 class="card-title" id="boldfont_black"  style="font-size: 22px;">인천공항 T2 면세점</h4>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<img src="${path }/images/icons/ico_phone.png" style="height: 20px; width: 20px; " >&nbsp; 032-743-4759
				</p>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<img src="${path }/images/icons/ico_time.png" style="height: 20px; width: 20px; " >&nbsp; 매일 6:50 - 21:30
				</p>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<img src="${path }/images/icons/ico_map.png" style="height: 20px; width: 20px;" >&nbsp; 인천 중구 공항로 272 (운서동,<br> 인천공항) T2 3층 서편 248게이트 부근
				</p>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<a class="noul" 
					href="https://www.google.com/maps/place/%EC%9D%B8%EC%B2%9C%EA%B4%91%EC%97%AD%EC%8B%9C+%EC%A4%91%EA%B5%AC+%EC%9A%B4%EC%84%9C%EB%8F%99+%EA%B3%B5%ED%95%AD%EB%A1%9C+271+%EC%8B%A0%EB%9D%BC%EB%A9%B4%EC%84%B8%EC%A0%90+%EC%9D%B8%EC%B2%9C%EA%B3%B5%ED%95%AD%EC%A0%90/@37.4488003,126.4496679,19z/data=!4m2!3m1!1s0x357b9a5c50674e3b:0xd49fb87995adeb63">
					지도 자세히보기
					</a>
				</p>
			</div>
          </div>
        </div> 
        <!--  -->
      <div class="col-lg-4 col-sm-6 portfolio-item" style="padding-bottom: 1.5%;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path }/images/storeinfo_store/W002_lotte.jpg" alt=""></a>
          <div class="card-body">
				<h4 class="card-title" id="boldfont_black"  style="font-size: 22px;">롯데 영플라자 명동점</h4>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<img src="${path }/images/icons/ico_phone.png" style="height: 20px; width: 20px; " >&nbsp; 02-2118-5150
				</p>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<img src="${path }/images/icons/ico_time.png" style="height: 20px; width: 20px; " >&nbsp; 매일 11:30 - 21:30
				</p>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<img src="${path }/images/icons/ico_map.png" style="height: 20px; width: 20px;" >&nbsp; 서울 중구 남대문로 67 (남대문로2가,<br>  롯데영플라자) 1층
				</p>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<a class="noul" 
					href="
					https://www.google.com/maps/place/%EB%A1%AF%EB%8D%B0%EC%98%81%ED%94%84%EB%9D%BC%EC%9E%90/@37.5632432,126.9796979,17z/data=!4m8!1m2!2m1!1z7ISc7Jq47Yq567OE7IucIOykkeq1rCDrqoXrj5nso7zrs4Droa_rjbAg7JiB7ZSM65287J6Q7KCQIOy5tOy5tOyYpO2UhOugjOymiA!3m4!1s0x357ca2f1761b7d15:0xb006aae66852fddf!8m2!3d37.5630346!4d126.9820817
					">
					지도 자세히보기
					</a>
				</p>
			</div>
          </div>
        </div> 
      <div class="col-lg-4 col-sm-6 portfolio-item" style="padding-bottom: 1.5%;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path }/images/storeinfo_store/W003_Timesquare.jpg" alt=""></a>
          <div class="card-body">
				<h4 class="card-title" id="boldfont_black"  style="font-size: 22px;">타임스퀘어점</h4>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<img src="${path }/images/icons/ico_phone.png" style="height: 20px; width: 20px; " >&nbsp; 02-2638-2750
				</p>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<img src="${path }/images/icons/ico_time.png" style="height: 20px; width: 20px; " >&nbsp; 매일 10:30 - 22:00
				</p>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<img src="${path }/images/icons/ico_map.png" style="height: 20px; width: 20px;" >&nbsp; 서울 영등포구 영중로 15 (영등포동4가,<br>  타임스퀘어) 1층
				</p>
				<p class="card-text" id="lightfont_black" style="margin-bottom: 8px; font-size: 14px;">
					<a class="noul" 
					href="
					https://www.google.com/maps/place/%ED%83%80%EC%9E%84%EC%8A%A4%ED%80%98%EC%96%B4/@37.5171711,126.9009994,17z/data=!4m8!1m2!2m1!1z7YOA7J6E7Iqk7YCY7Ja0IOyYgeuTse2PrOygkA!3m4!1s0x357c9efb5c308621:0x17d357f6aa05d974!8m2!3d37.5171639!4d126.9031758
					">
					지도 자세히보기
					</a>
				</p>
			</div>
          </div>
        </div> 
     
    </div>
 	</div>
</div>
		</div>

</body>
</html>