<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Content Page</title>
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
			<!-- Content -->
			<article id="Content" class="active">
				<h2 class="major">Content Update</h2>
				<form action="UpdateContent" method="post">
					<input type="hidden" name="num" value="${dto.num}">
					
					<div class="field half" style="float:left;">
						<label for="nickname">NICKNAME</label> 
						<input type="text" value="${dto.nick}" name="nick" readonly="readonly" />
					</div>
					<div class="field half" style="float:left;">
						<label for="title">Title</label> 
						<input type="text" name="title" value="${dto.title}" readonly="readonly"/>
					</div>
					<div class="field half" style="clear:both; width: 560px;">
						<label for="content">content</label>
						<textarea cols="7" rows="4" name="content" >${dto.content}</textarea>
					</div>

					<ul class="actions">
						<li><a href="Content?num=${list.num}">${list.title }</a></li>
						<c:if test="${nick==dto.nick}">
							<li><input type="submit" value="Update" class="special" /></li>
						</c:if>
						<li><input type="button" value="Cancel" onclick="location.href='greenright.jsp'" /></li>
					</ul>
				</form>
				
				
				<form action="RemoveContent">
					<input type="hidden" name="num" value="${dto.num}">
					<ul class="actions">
						<c:if test="${nick==dto.nick }">
						<li><input type="submit" value="Delete" class="special" />
						</c:if></li>
					</ul>
				</form>
				<c:if test="${nick != dto.nick }">
				<form action="likeer?num=${list.num}">
					<label for="content">${dto.likeer }</label>
					<input type="hidden" name="num" value="${dto.num}">
					<input type="submit" value="LIKE" style="top: 20px; left: 20px;"/>
					
				</form>
				<form action="hate?num=${list.num}">
					<label for="content">${dto.hate}</label>
					<input type="hidden" name="num" value="${dto.num}">
					<input type="submit" value="HATE" style="top: 20px; left: 20px;"/>
				</form>
				</c:if>
			</article>
		</div>
	</div>
	<div id="bg"></div>
</body>
</html>

