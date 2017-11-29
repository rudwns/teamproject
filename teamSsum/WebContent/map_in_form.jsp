<%@page import="com.connect.python_connection"%>
<%@page import="com.model.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE HTML>

<%@page import="com.model.RestoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.RestoDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<title>Dimension by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
	
</noscript>

<style type="text/css">
video{
	position : fixed;
	top : 0;
	left : 0;
	min-width: 100%;
	min-height: 100%;
	width : auto;
	height : auto;
	z-index : -1;

}
</style>
</head>
<body class="is-article-visible">
	<%
	
				python_connection pc = new python_connection();
				pc.map_py();

				RestoDAO dao = new RestoDAO();
				ArrayList<RestoDTO> list = dao.selectAll();
				request.setAttribute("list", list);

%> 
	<!-- Wrapper -->
	<div id="wrapper">
<video id="videobcg" preload="auto" autoplay="ture" loop="loop" volume="Mute">
               <source src="movie3.mp4" type="video/mp4">
               <source src="movie.webm" type="moive/webm">
            </video>
		<!-- Main -->
		<div id="main">
			<!-- Return -->
			<article id="Login" class="active">
				<h2 class="major">Return</h2>
				


			<div id="map" style="width:80%;height:500px;margin:auto;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=332dd08ad35ac45d739cd2857682cd7e"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    			mapOption = { 
        					center: new daum.maps.LatLng(35.154268035, 126.8544070126), // 지도의 중심좌표
        					level: 3 // 지도의 확대 레벨
    						}; 

				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


				//마커를 표시할 위치와 title 객체 배열입니다 


				//마커 이미지의 이미지 주소입니다
 
 
				var positions = []



				 //포지션 위치 배열
				/* positions[i] = [{title : "${list[i].title}", we : ${list[i].we}}]; */
	


				<c:forEach begin ="0" end="90" var="i">

 				// 마커 이미지의 이미지 크기 입니다
 
 
 				// 마커 이미지를 생성합니다    
  
 
 				// 마커를 생성합니다
 				var marker = new daum.maps.Marker({
     			position: new daum.maps.LatLng(${list[i].we}), // 마커를 표시할 위치
     			clickable: true  // 선택
 				});
 
				 marker.setMap(map);


				//인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
        			content: '<div style = "width:300px;height:200px;background:url(${list[i].img})"></div><div style="width:300px; background-color:#E6B8B8; text-align:center;">${list[i].title}</div><div style="width:300px;color:black;font-size:17px;">${list[i].address}</div><div style="width:300px;color:black;font-size:17px;">${list[i].phone}</div>' // 인포윈도우에 표시할 내용
				    });
					daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				</c:forEach>





				function makeOverListener(map, marker, infowindow) {
    			return function() {
        				infowindow.open(map, marker);
    					};
				}

				function makeOutListener(infowindow) {
    			return function() {
        				infowindow.close();
					    };
				}








				</script>
				<ul class="actions">
					<li><input type="button" value="Cancel" onclick="location.href='main.jsp'" /></li>
				</ul>
			</article>
		</div>

	</div>
		<!-- BG -->
	<div id="bg"></div>

</body>
</html>