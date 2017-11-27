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
</head>
<body class="is-article-visible">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<!-- Search -->
			<article id="Login" class="active">
				<h2 class="major">Search</h2>
				<table>
					<tr>
						<td>Title</td>
						<td>Author</td>
						<td>Publisher</td>
						<td>Rental</td>
					</tr>
					<%
						BookDAO rental_dao = BookDAO.getInstance();
						ArrayList<BookDTO> rental_dto = rental_dao.selectBookAll(0);
						pageContext.setAttribute("book_list", rental_dto);
					%>
					<c:choose>
						<c:when test="${empty pageScope.book_list }">
							<tr>
								<td colspan="4" align="center">대여할 도서가 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${pageScope.book_list}" var="book">
								<tr>
									<td>${book.title }</td>
									<td>${book.author }</td>
									<td>${book.publisher }</td>
									<td><a href="Rental?book_num=${book.num}">대여</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

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