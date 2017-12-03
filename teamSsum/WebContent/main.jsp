<%@page import="com.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
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
	opacity: 0.7;
}

#topMenu {
	width: 500px;  
	height: 60px;
	float: right;
	margin-top: 10px;
	margin-right: 10px;
	border-radius: 5px;
	}
#topMenu ul li { 
	list-style: none; 
	color: white; 
	background-color: rgba(50,50,50,0.7);
	float: right; 
	line-height: 30px; 
	vertical-align: right; 
	text-align: center; 
	padding-left:0px;
	border-radius: 5px;
	
 }

#topMenu .menuLink { 
	text-decoration:none; 
	color: white; 
	width: 100px; 
	height:38px;
	font-size: 30pt; 
	font-weight: bold; 
	float: right;
	text-align: center;
	padding-left:0px;
	
	
} 
#topMenu .menuLink:hover {
	color: red; 
	background-color: #4d4d4d; 
}
#wrapper{
	font-size: 15pt;
}


</style>
</head>
<body>
<video id="videobcg"  preload="auto" autoplay="ture" loop="loop" volume="Mute" >
               <source src="movie3.mp4" type="video/mp4">
               <source src="movie.webm" type="moive/webm">
            </video>
			<%-- <nav id="topMenu">
        	<ul style="list-style: none; border: 1px;">
           <c:choose>
				<c:when test="${empty nick}">
					<!-- <li style="font-size: 30pt; color:black; font-weight:bold; float: right; position: right;" ><a href="login.jsp">Login</a></li>
					<li  style="font-size: 30pt; color:black; font-weight:bold; float: right; position: right;"><a href="join.jsp">Join</a></li> -->
				</c:when>
				<c:otherwise>
				
					<li  class="menuLink"> <a href="Logout.jsp" style="font-size: 18pt; font-weight: bord">Logout</a></li>
					<li  class="menuLink"><a href="update.jsp" style="font-size: 18pt; font-weight: bord">Edit</a>
					
				</c:otherwise>
				</c:choose>
		</ul>
		</nav>		 --%>
	<!-- Wrapper -->
	<div id="wrapper" style="padding-top:0px;">
		 
		<!-- Header -->
		<!-- Header -->
		<header id="header">
			<div class="logo">
				<span class="icon fa-heart"></span>
			</div>
			<div class="content">
				<div class="inner">
					<h1>성공해,썸</h1>
					<c:choose>
						
						<c:when test="${empty nick}">
							
						</c:when>
						<c:otherwise>
							<h2>${sessionScope.nick}님 환영합니다</h2> 
							
							
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<nav>
	
				<ul>
					<c:choose>
						<c:when test="${empty nick}">
							 <li><a href="login.jsp" style="font-size: 18pt; font-weight: bord">Login</a></li>
							<li><a href="join.jsp" style="font-size: 18pt; font-weight: bord">Join</a></li> 
						</c:when>
						<c:otherwise>
							<li><a href="Logout.jsp" style="font-size: 18pt; font-weight: bord">Logout</a></li>
							<li><a href="update.jsp" style="font-size: 18pt; font-weight: bord">Edit</a>
							<li><a href="report_fileUpload.jsp" style="font-size: 18pt; font-weight: bord">보고서</a></li>
							<li><a href="advice.jsp" style="font-size: 18pt; font-weight: bord">조언</a></li>
							<li><a href="recommendation.jsp" style="font-size: 18pt; font-weight: bord">추천</a></li>
							<li><a href="greenright.jsp" style="font-size: 18pt; font-weight: bord">그린라이트</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</header>


		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; SucessSSum
			</p>
		</footer>

	</div>

	<!-- BG -->
	<!-- <div id="bg"></div> -->

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>
