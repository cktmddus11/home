<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://navermaps.github.io/maps.js.ncp/docs/js/jquery-1.9.1.js"></script>
     <script type="text/javascript" src="https://navermaps.github.io/maps.js.ncp/docs/js/base.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=353r60ajhw&submodules=geocoder"></script>
<title>naver map</title>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>
<script>
	var map = new naver.maps.Map('map',{
		mapTypeId: naver.maps.MapTypeId.NORMAL
	});
	var jeju = new naver.maps.LatLng(33.3590628, 126.534361);

	map.setCenter(jeju); // 중심 좌표 이동
	map.setZoom(13);     // 줌 레벨 변경

	var seoul = new naver.maps.LatLngBounds(
	    new naver.maps.LatLng(37.42829747263545, 126.76620435615891),
	    new naver.maps.LatLng(37.7010174173061, 127.18379493229875));

	map.fitBounds(seoul); // 좌표 경계 이동

	map.panBy(new naver.maps.Point(10, 10)); // 오른쪽 아래로 10 픽셀 이동
</script>	

</body>
</html>