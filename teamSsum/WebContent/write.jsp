<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Write Page</title>
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
				<h2 class="major">Write</h2>
				<form method="post" action="WriteService">
					<div class="field half" style="float:left;">
						<label for="nickname">NICKNAME</label> <input type="text" value="${nick}" name="nick" readonly="readonly" />
					</div>
					<div class="field half" style="float:left;">
						<label for="title">Title</label> <input type="text" name="title" />
					</div>
					<div class="field half" style="clear:both; width: 560px;">
						<label for="content">content</label><textarea cols="7" rows="4" name="content" ></textarea>
					</div>

					<ul class="actions">
						<li><input type="submit" value="Write" class="special" /></li>
						<li><input type="button" value="Cancel" onclick="location.href='greenright.jsp'" /></li>
					</ul>
				</form>
			</article>
		</div>
	</div>
	<div id="bg"></div>
</body>
</html>
