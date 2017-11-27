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
				<table>
					<tr>
						<td><input type="button" value="이동" onclick="location.href='main.jsp'"></td>
						<td><input type="button" value="이동" onclick="location.href='main.jsp'"></td>
						<td><input type="button" value="이동" onclick="location.href='main.jsp'"></td>
						<td><input type="button" value="이동" onclick="location.href='main.jsp'"></td>
					</tr>
					<%-- <%
						BookDAO return_dao = BookDAO.getInstance();
						ArrayList<BookDTO> return_dto = return_dao.selectBookAll(1);
						pageContext.setAttribute("rental_list", return_dto);
					%>
					<c:choose>
						<c:when test="${empty pageScope.rental_list }">
							<tr>
								<td colspan="4" align="center">반납할 도서가 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${pageScope.rental_list}" var="book">
								<tr>
									<td>${book.title }</td>
									<td>${book.author }</td>
									<td>${book.publisher }</td>
									<td><a href="Return?book_num=${book.num }">반납</</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose> --%>

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