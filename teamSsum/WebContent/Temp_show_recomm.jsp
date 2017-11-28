<%@page import="com.model.MovieDTO"%>
<%@page import="com.model.MovieDAO"%>
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
</style>



	<!-- Wrapper -->
	<div id="wrapper">
		<video id="videobcg" preload="auto" autoplay="ture" loop="loop"
			volume="Mute"> <source src="movie3.mp4" type="video/mp4">
		<source src="movie.webm" type="moive/webm"></video>
		<!-- Main -->
		<div id="main">
			<!-- Return -->
			<article id="Login" class="active">
			<h2 class="major">추천</h2>


			<%
				String nick = (String) session.getAttribute("nick");
				MovieDAO mdao = new MovieDAO();
				ArrayList<MovieDTO> marr = mdao.selectMovieAll();

				request.setAttribute("marr", marr);
			%>

			<p>[이런 영화는 어때요?]</p>
			<table id="movie">

				<tr align="center">
					<c:forEach items="${marr}" var="mvo" varStatus="a">
						<c:if test="${a.count < 6}">
							<td><img src="${mvo.image}"></td>
						</c:if>
					</c:forEach>
				</tr>

				<tr align="center">
					<c:forEach items="${marr}" var="mvo" varStatus="a">
						<c:if test="${a.count < 6}">
							<td align="center">${mvo.title}</td>
						</c:if>

					</c:forEach>
				</tr>

				<tr align="center">
					<c:forEach items="${marr}" var="mvo" varStatus="a">
						<c:if test="${a.count >= 6}">
							<td><img src="${mvo.image}"></td>
						</c:if>
					</c:forEach>
				</tr>

				<tr align="center">
					<c:forEach items="${marr}" var="mvo" varStatus="a">
						<c:if test="${a.count >= 6}">
							<td align="center">${mvo.title}</td>
						</c:if>

					</c:forEach>
				</tr>


			</table>

			<p>[공연정보를 봐볼까요?]</p>
			<%
				ShowDAO dao = new ShowDAO();
				ArrayList<ShowDTO> arr = dao.selectShopAll();
				request.setAttribute("arr", arr);
			%>
			<table id="show">

				<tr align="center">
					<td>공연</td>
					<td>장소</td>
					<td>기간</td>
					
				</tr>

				<c:forEach items="${arr}" var="vo">
					<tr align="center">
						<td><a href='${vo.link }'>${vo.title}</a></td>
						<td>${vo.place}</td>
						<td>${vo.days}</td>
						
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