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

}

</style>
</head>
<body>
<video id="videobcg" preload="auto" autoplay="ture" loop="loop" volume="Mute">
               <source src="movie3.mp4" type="video/mp4">
               <source src="movie.webm" type="moive/webm">
            </video>
	<!-- Wrapper -->
	<div id="wrapper">
		 
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
							<li><a href="login.jsp">Login</a></li>
							<li><a href="join.jsp">Join</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="Logout.jsp">Logout</a></li>
							<li><a href="update.jsp">회원정보수정</a>
							<li><a href="report_fileUpload.jsp">보고서</a></li>
							<li><a href="advice.jsp">조언</a></li>
							<li><a href="recommendation.jsp">추천</a></li>
							<li><a href="greenright.jsp">그린라이트</a></li>
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
