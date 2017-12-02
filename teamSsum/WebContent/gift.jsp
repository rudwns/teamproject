<%@page import="com.connect.python_connection"%>
<%@page import="com.model.giftDTO"%>
<%@page import="com.model.giftDAO"%>
<%@page import="com.model.ShowDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ShowDAO"%>
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
video {
	position: fixed;
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1;
}

#bg{
	 background-image:url(images/back3.png);
	 background-size: cover;

}

body{
	color : white;
}

h2{
	color : white;

}

table#weatherTable,td {
	border: 1px solid black;
}

#main #Login {
	background-color: rgba(243, 181, 184, 0.85)
}
</style>



<!-- Wrapper -->
<div id="wrapper">
	<!-- <video id="videobcg" preload="auto" autoplay="ture" loop="loop"
		volume="Mute"> <source src="movie3.mp4" type="video/mp4">
	<source src="movie.webm" type="moive/webm"></video> -->
	<!-- Main -->
	<div id="main">
		<!-- Return -->
		<article id="Login" class="active">
		<h2 class="major">추천</h2>


		<%
			python_connection pc = new python_connection();
			pc.gift_py1();
			pc.gift_py2();
			pc.gift_py3();
			pc.gift_py4();
			pc.gift_py5();

			String nick = (String) session.getAttribute("nick");
			giftDAO gdao = new giftDAO();
			ArrayList<giftDTO> marr = gdao.gift_view();

			request.setAttribute("marr", marr);
		%>

		<p>[선물리스트]</p>
		<table id="movie">
			<c:forEach items="${marr}" var="mvo" varStatus="a">
				<tr align="center">
					<td><img src="${mvo.img}"></td>
					<td style="margin-bottom: 100px" align="center"><a href="${mvo.link}">${mvo.title}</a></td>
				</tr>
			</c:forEach>

		</table>

		<ul class="actions">
			<li><input type="button" value="Cancel"
				onclick="location.href='main.jsp'" /></li>
		</ul>


		</article>
	</div>


</div>
<!-- BG -->
<div id="bg"></div>
</body>
</html>