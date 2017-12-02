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

#bg {
	opacity: 0.4;
	background-image: url(images/bg2.jpg);
	background-size: cover;
}

#main #Login {
	background-color: rgba(229, 110, 90, 0.7);
	font-size: 3ren;
}

body {
	color: white;
}

h2 {
	color: white;
}

table#weatherTable, td {
	border: 1px solid black;
}



</style>



<!-- Wrapper -->
<div id="wrapper">
	
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

		<p style="font-size:18pt;">[선물리스트]</p>
		
		<c:forEach items="${marr}" var="mvo" varStatus="a">
		
			<div id="absolute2" style="float: left; width:30%;height:200px; ">
			<img src="${mvo.img}">
			</div>
			<div id="absolute3" style="float: left; width:60%;height:200px; margin-top: 45px ; ">
			<a href="${mvo.link}">${mvo.title}</a>
			</div>
			<hr width="100%">
			
		</c:forEach>
		

		<ul class="actions">
			<li><input type="button" value="Cancel"
				onclick="location.href='recommendation.jsp'" /></li>
		</ul>

		</article>
	</div>


</div>
<!-- BG -->
<div id="bg"></div>
</body>
</html>