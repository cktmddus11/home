<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐릭터 소개</title>
<style type="text/css">
#boldfont_black {
	font-family: 'Noto Sans KR', sans-serif;	
	color: black; 
	font-weight: 900;	
	width: 100%;
	font-size: 26px;
}
#lightfont_black {
	font-family: 'Noto Sans KR', sans-serif;
	color: black;
	font-weight: 300;	
	width: 100%;
	font-size: 15px;
}
div.left{
		width: 20%;
        float: left;
        box-sizing: border-box;
}
div.right{
		width: 50%;
        float: right;
        margin-top: 10%;
        box-sizing: border-box;
}
a.noul:hover{
text-decoration: none;
}
.hamburger-inner, .hamburger-inner::before, .hamburger-inner::after {
    width: 40px;
    height: 4px;
    background-color: black;
    border-radius: 4px;
    position: absolute;
    transition-property: transform;
    transition-duration: 0.15s;
    transition-timing-function: ease; }

#my-iframe {margin: 0 auto;} 
#my-iframe {display:block;border:none;height:100%;width:100%;}

@media (max-width: 856px){
	div.row {
		display: none;
	}
}
@media (max-width: 856px){
	div.row2 {
		display: block;
	}
}
@media (min-width: 856px){
	div.row2 {
		display: none;
	}
}
</style>
</head>
<body>
		<!-- 라이언 -->
		<div class="row" style="width: 100%;">
			<!-- Blog Entries Column -->
			<div class="col-md-12" style="width: 100%; ">
			<div class="left">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 205px;
    		height: 361px;
    		margin: 52px 0 0 160px;
    		background-position: 0 0;
			">
			</div>
			</div>
			<div class="right">
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 85px;
		    height: 24px;
		    background-position: -510px 0;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black">갈기가 없는 것이 콤플렉스인 수사자</h2>
			<br>
			<h3 class="card-text" id="lightfont_black">
			큰 덩치와 무뚝뚝한 표정으로 오해를 많이 사지만,<br><br>
			사실 누구보다도 여리고 섬세한 소녀감성을 지닌 반전 매력의 소유자!<br><br>
			원래 아프리카 둥둥섬 왕위 계승자였으나, 자유로운 삶을 동경해 탈출!<br><br>
			카카오프렌즈의 든든한 조언자 역할을 맡고 있습니다.<br><br>
			꼬리가 길면 잡히기 때문에, 꼬리가 짧습니다.
			</h3>
			<br><br>
			<div style="float: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
			</div>
		</div>
		<div class="row2" style="width: 100%; ">
			<!-- Blog Entries Column -->
			<div class="col-md-12" style="width: 100%; text-align: center;">
			<div style=" display: inline-block;">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 205px;
    		height: 361px;
    		margin: 52px 0 0 160px;
    		background-position: 0 0;
			">
			</div>
			</div>
			</div>
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 85px;
		    height: 24px;
		    background-position: -510px 0;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black" style=" text-align: left;">갈기가 없는 것이 콤플렉스인 수사자</h2>
			<br>
			<h3 class="card-text" id="lightfont_black" style=" text-align: left;">
			큰 덩치와 무뚝뚝한 표정으로 오해를 많이 사지만,<br><br> 
			사실 누구보다도 여리고 섬세한 소녀감성을 지닌 반전 매력의 소유자!<br><br>
			원래 아프리카 둥둥섬 왕위 계승자였으나, 자유로운 삶을 동경해 탈출!<br><br>
			카카오프렌즈의 든든한 조언자 역할을 맡고 있습니다.<br><br>
			꼬리가 길면 잡히기 때문에, 꼬리가 짧습니다.
			</h3>
			<br><br>
			<div style="text-align: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
		<hr>
		<!-- 어피치 -->
		<div class="row2">
			<div class="col-md-12" style="width: 100%; text-align: center;">
			<div style=" display: inline-block;">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 280px;
    		height: 199px;
    		margin: 156px 0 0 116px;
   			background-position: -220px 0;
			">
			</div>
			</div>
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 131px;
		    height: 24px;
		    background-position: -510px -29px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black" style=" text-align: left;">복숭아 나무에서 탈출한 악동 복숭아</h2>
			<br>
			<h3 class="card-text" id="lightfont_black" style=" text-align: left;">
			유전자 변이로 자웅동주가 된 것을 알고<br><br>
			복숭아 나무에서 탈출한 악동 복숭아 어피치!<br><br>
			섹시한 뒷태로 사람들을 매혹시키며,<br><br>
			성격이 매우 급하고 과격합니다.
			</h3>
			<br><br>
			<div style="text-align: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black" >>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" style="width: 100%; ">
			<div class="left">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 280px;
    		height: 199px;
    		margin: 156px 0 0 116px;
   			background-position: -220px 0;
			">
			</div>
			</div>
			<div class="right">
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 131px;
		    height: 24px;
		    background-position: -510px -29px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black">복숭아 나무에서 탈출한 악동 복숭아</h2>
			<br>
			<h3 class="card-text" id="lightfont_black">
			유전자 변이로 자웅동주가 된 것을 알고<br><br>
			복숭아 나무에서 탈출한 악동 복숭아 어피치!<br><br>
			섹시한 뒷태로 사람들을 매혹시키며,<br><br>
			성격이 매우 급하고 과격합니다.
			</h3>
			<br><br>
			<div style="float: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
			</div>
		</div>
		<hr>
		<!-- 무지랑 콘 -->
		<div class="row">
			<div class="col-md-12" style="width: 100%; ">
			<div class="left">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 229px;
		    height: 359px;
		    margin: 79px 0 0 155px;
		    background-position: -480px -200px;
			">
			</div>
			</div>
			<div class="right">
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 178px;
		    height: 25px;
		    background-position: -510px -58px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black">토끼 옷을 입은 단무지인 무지와 정체불명 콘</h2>
			<br>
			<h3 class="card-text" id="lightfont_black">
			호기심 많은 장난꾸러기 무지의 정체는 사실 토끼 옷을 입은 단무지!<br><br>
			토끼 옷을 벗으면 부끄러움을 많이 탑니다.<br><br>
			단무지를 키워 무지를 만든 정체불명의 악어 콘!<br><br>
			이제는 복숭아를 키우고 싶어 어피치를 찾아 다닙니다.
			</h3>
			<br><br>
			<div style="float: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
			</div>
		</div>
		<div class="row2">
			<div class="col-md-12" style="width: 100%; text-align: center;">
			<div style=" display: inline-block;">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 229px;
		    height: 359px;
		    margin: 79px 0 0 155px;
		    background-position: -480px -200px;
			">
			</div>
			</div>
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 178px;
		    height: 25px;
		    background-position: -510px -58px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black" style=" text-align: left;">토끼 옷을 입은 단무지인 무지와 정체불명 콘</h2>
			<br>
			<h3 class="card-text" id="lightfont_black" style=" text-align: left;">
			호기심 많은 장난꾸러기 무지의 정체는 사실 토끼 옷을 입은 단무지!<br><br>
			토끼 옷을 벗으면 부끄러움을 많이 탑니다.<br><br>
			단무지를 키워 무지를 만든 정체불명의 악어 콘!<br><br>
			이제는 복숭아를 키우고 싶어 어피치를 찾아 다닙니다.
			</h3>
			<br><br>
			<div style=" text-align: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
		</div>
		<hr>
		<!-- 프로도와 네오 -->
		<div class="row">
			<div class="col-md-12" style="width: 100%; ">
			<div class="left">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 356px;
		    height: 306px;
		    margin: 103px 0 0 94px;
		    background-position: 0 -677px;
			">
			</div>
			</div>
			<div class="right">
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 208px;
		    height: 25px;
		    background-position: -510px -88px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black">부잣집 도시개 프로도와 패셔니스타 네오</h2>
			<br>
			<h3 class="card-text" id="lightfont_black">
			프로도와 네오는 카카오프렌즈 공식 커플로 알콩달콩 깨볶는 중!<br><br>
			부잣집 도시개 프로도는 사실 잡종. 태생에 대한 콤플렉스가 많습니다.<br><br>
			자기 자신을 가장 사랑하는 새침한 고양이 네오. 쇼핑을 좋아하는<br><br>
			이 구역의 대표 패셔니스타입니다. 하지만 도도한 자신감의 근원이<br><br>
			단발머리 ‘가발’에서 나온다는 건 비밀!
			</h3>
			<br><br>
			<div style="float: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
			</div>
		</div>
		<div class="row2">
			<div class="col-md-12" style="width: 100%; text-align: center;">
			<div style=" display: inline-block;">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 356px;
		    height: 306px;
		    margin: 103px 0 0 94px;
		    background-position: 0 -677px;
			">
			</div>
			</div>
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 208px;
		    height: 25px;
		    background-position: -510px -88px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black" style=" text-align: left;">부잣집 도시개 프로도와 패셔니스타 네오</h2>
			<br>
			<h3 class="card-text" id="lightfont_black" style=" text-align: left;">
			프로도와 네오는 카카오프렌즈 공식 커플로 알콩달콩 깨볶는 중!<br><br>
			부잣집 도시개 프로도는 사실 잡종. 태생에 대한 콤플렉스가 많습니다.<br><br>
			자기 자신을 가장 사랑하는 새침한 고양이 네오. 쇼핑을 좋아하는<br><br>
			이 구역의 대표 패셔니스타입니다. 하지만 도도한 자신감의 근원이<br><br>
			단발머리 ‘가발’에서 나온다는 건 비밀!
			</h3>
			<br><br>
			<div style=" text-align: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
		</div>
		<hr>
		<!-- 튜브 -->
		<div class="row">
			<div class="col-md-12" style="width: 100%; ">
			<div class="left">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 194px;
		    height: 290px;
		    margin: 120px 0 0 208px;
		    background-position: 0 -380px;
			">
			</div>
			</div>
			<div class="right">
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 89px;
    		height: 24px;
    		background-position: -510px -120px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black">겁 많고 마음 약한 오리 튜브</h2>
			<br>
			<h3 class="card-text" id="lightfont_black">
			겁 많고 마음 약한 오리 튜브는 극도의 공포를 느끼면 미친 오리로<br><br>
			변신합니다. 작은 발이 콤플렉스이기 때문에 큰 오리발을 착용합니다.<br><br>
			미운 오리 새끼가 먼 친척입니다.
			</h3>
			<br><br>
			<div style="float: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
			</div>
		</div>
		<div class="row2">
			<div class="col-md-12" style="width: 100%; text-align: center;">
			<div style=" display: inline-block;">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 194px;
		    height: 290px;
		    margin: 120px 0 0 208px;
		    background-position: 0 -380px;
			">
			</div>
			</div>
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 89px;
    		height: 24px;
    		background-position: -510px -120px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black" style=" text-align: left;">겁 많고 마음 약한 오리 튜브</h2>
			<br>
			<h3 class="card-text" id="lightfont_black" style=" text-align: left;">
			겁 많고 마음 약한 오리 튜브는 극도의 공포를 느끼면 미친 오리로<br><br>
			변신합니다. 작은 발이 콤플렉스이기 때문에 큰 오리발을 착용합니다.<br><br>
			미운 오리 새끼가 먼 친척입니다.
			</h3>
			<br><br>
			<div style=" text-align: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div>
		</div>
		<hr>
		<!-- 제이지 -->
		<div class="row">
			<div class="col-md-12" style="width: 100%; ">
			<div class="left">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 255px;
		    height: 397px;
		    margin: 44px 0 0 128px;
		    background-position: -215px -200px;
			">
			</div>
			</div>
			<div class="right">
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 97px;
		    height: 24px;
		    background-position: -510px -153px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black">힙합을 사랑하는 자유로운 영혼</h2>
			<br>
			<h3 class="card-text" id="lightfont_black">
			땅속 나라 고향에 대한 향수병이 있는 비밀요원 제이지!<br><br>
			사명의식이 투철하여 냉철해보이고 싶으나, 실은 어리버리합니다.<br><br>
			겉모습과 달리 알고보면 외로움을 많이 타는 여린 감수성의 소유자.<br><br>
			힙합 가수 Jay-Z의 열혈팬입니다.
			</h3>
			<br><br>
			<div style="float: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div> 
			</div>
		</div>
		<div class="row2">
			<div class="col-md-12" style="width: 100%; text-align: center;">
			<div style=" display: inline-block;">
			<div style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 255px;
		    height: 397px;
		    margin: 44px 0 0 128px;
		    background-position: -215px -200px;
			">
			</div>
			</div>
			<h1 style="
			background-image: url('${path}/images/characterinfo_char/img_charInfo.png');
			width: 97px;
		    height: 24px;
		    background-position: -510px -153px;
			" ></h1>
			<br>
			<h2 class="card-title" id="boldfont_black" style=" text-align: left;">힙합을 사랑하는 자유로운 영혼</h2>
			<br>
			<h3 class="card-text" id="lightfont_black" style=" text-align: left;">
			땅속 나라 고향에 대한 향수병이 있는 비밀요원 제이지!<br><br>
			사명의식이 투철하여 냉철해보이고 싶으나, 실은 어리버리합니다.<br><br>
			겉모습과 달리 알고보면 외로움을 많이 타는 여린 감수성의 소유자.<br><br>
			힙합 가수 Jay-Z의 열혈팬입니다.
			</h3>
			<br><br>
			<div style=" text-align: right; margin-right: 15%;" >
			<a href="#" class="noul" id="lightfont_black">>&nbsp;&nbsp;제품보기</a>
			</div>
			</div> 
			</div>
		</div>
		<hr>
</body>
</html>