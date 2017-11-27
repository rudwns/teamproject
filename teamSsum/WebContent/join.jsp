<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
			<!-- Login -->
			<article id="Login" class="active">
				<h2 class="major">Login</h2>
				<form method="post" action="Join">
					<div class="field half">
						<label for="id">ID</label> <input type="text" name="id" id="name" />
					</div>
					<div class="field half">
						<label for="pw">PW</label> <input type="text" name="pw" id="email" />
					</div>
					<div class="field half">
						<label for="nickname">NICKNAME</label> <input type="text"
							name="nick" id="email" />
					</div>
					<div class="field half">
						<label for="email">EMAIL</label> <input type="text" name="email"
							id="email" />
					</div>
					<div class="field half">
						<label for=""tel"">TEL</label> <input type="text" name="tel"
							id="email" />
					</div>

					<ul class="actions">
						<li><input type="submit" value="Join" class="special" /></li>
						<li><input type="button" value="Cancel" onclick="history.go(-1)"/></li>
					</ul>
				</form>
			</article>
		</div>
	</div>
	<!-- BG -->
	<div id="bg"></div>
</body>
</html>
