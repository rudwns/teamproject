<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Love and something</title>
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
<body class="is-article-visible">

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
				<h2 class="major">추천</h2>
				
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