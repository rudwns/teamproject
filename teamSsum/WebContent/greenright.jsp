<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BoardDAO"%>
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
<body class="is-article-visible">
	<%
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> list = dao.selectBoardAll();
		pageContext.setAttribute("list", list);
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
				<h2 class="major">Board</h2>
				
				<div class="field half" style="margin-left: 0;">
				<table id = "weeklyHOT">
				<tr>
				<td>이주의 그린라이트</td>
				</tr>
				
				
				<tr>
				<td><img height="300px" width="200px" src="images/trafficLight.jpg"></td>
				<td><img src="images/images.png"></td>
				</tr>
				
				
				
				
				</table>
					
					</div>
				
				
				
				<table>
					<tr align="center">
						<td>Num</td>
						<td>Nick</td>
						<td>Title</td>
						<td>Date</td>
						<td>Hit</td>
						<td>Like</td>
						<td>Hate</td>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>	
								<td colspan="7" align="center">현재 게시글이 존재하지 않습니다.</td>
							</tr>
						</c:when>
					</c:choose>
					<c:forEach items="${list }" var="list">
						<tr align="center">
							<td>${list.num }</td>
							<td>${list.nick }</td>
							<!-- 여기서 누르면 content로 넘어가서 hit 값이 증가한다. -->
							<td><a href="Content?num=${list.num}">${list.title }</a></td>
							
							<td>${list.day }</td>
							<td>${list.hit }</td>
							<td>${list.likeer }</td>
							<td>${list.hate }</td>
						</tr>
					</c:forEach>

				</table>
				<ul class="actions">
					<li><input type="button" value="Write" onclick="location.href='write.jsp'" /></li>
					<li><input type="button" value="Cancel" onclick="location.href='main.jsp'" /></li>
				</ul>
			</article>
		</div>

	</div>

	<!-- BG -->
	<div id="bg"></div>

</body>
</html>