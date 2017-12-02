<%@page import="com.model.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BookDAO"%>
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

#bg{
	 opacity: 0.4;
	 background-image:url(images/bg2.jpg);
	 background-size: cover;

}

#main #Login {
	background-color: rgba(229, 110, 90, 0.7);
	font-size: 3ren;
}

</style>
</head>
<body class="is-article-visible" style="font-size: 3;">
	
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<!-- Return -->
			<article id="Login" class="active">
				<h2 class="major">Return</h2>
				<table>
					<tr align="center">
						<td><input type="button" value="날씨" onclick="location.href='weather.jsp'" ></td>
						<td><input type="button" value="맛집!" onclick="location.href='map_in_form.jsp'"></td>
						<td><input type="button" value="선물추천" onclick="location.href='gift.jsp'"></td>
						<td><input type="button" value="영화/공연" onclick="location.href='Temp_show_recomm.jsp'"></td>
					</tr>
					

				</table>
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