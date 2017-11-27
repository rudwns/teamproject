<%@page import="com.model.BookDAO"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Update Page</title>
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
			<!-- Info -->
			<article id="Login" class="active">
				<h2 class="major">Update</h2>
				<form method="post" action="Update">
					<div class="field half">
						<label for="id">ID</label> <input type="text" value="${param.id }" name="id" readonly="readonly" />
					</div>
					<div class="field half">
						<label for="pw">PW</label> <input type="password" name="pw"	/>
					</div>
					<div class="field half">
						<label for="nickname">NICKNAME</label> <input type="text" name="nick"/>
					</div>
					<div class="field half">
						<label for="email">EMAIL</label> <input type="text"	name="email"/>
					</div>
					<div class="field half">
						<label for="tel">TEL</label> <input type="text"	name="tel"/>
					</div>

					<ul class="actions">
						<li><input type="submit" value="Update" class="special" /></li>
						<li><input type="button" value="Cancel" onclick="location.href='main.jsp'" /></li>
					</ul>
				</form>
			</article>
		</div>
	</div>
	<!-- BG -->
	<div id="bg"></div>
</body>
</html>

