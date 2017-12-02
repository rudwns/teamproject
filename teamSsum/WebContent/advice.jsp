<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BookDTO"%>
<%@page import="com.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 #main #Login {
       background-color: rgba(240,226,208,0.85)
      }
      
#bg{
	 background-image:url(images/back3.png);
	 background-size: cover;
}
</style>
</head>
<body class="is-article-visible">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- <video id="videobcg" preload="auto" autoplay="ture" loop="loop" volume="Mute">
               <source src="movie3.mp4" type="video/mp4">
               <source src="movie.webm" type="moive/webm">
            </video> -->
		<!-- Main -->
		<div id="main">
			<!-- Search -->
			<article id="Login" class="active">
				<h2 class="major">조언</h2>
				<div class="field half" style="margin-left:0;">
						<label for="nickname">추천대화시간</label>
						<input type="text" value="${pageScope.member.nick}" name="nick" readonly="readonly" />
					</div>
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