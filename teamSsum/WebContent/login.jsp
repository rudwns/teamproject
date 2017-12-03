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

<style type="text/css">

	
#main #Login{
		background-color: rgba(40,40,40,0.6);
	
	}
	body{
		background-color: rgba(255,210,220,0.4);
	}
</style>
</head>
<body class="is-article-visible">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main" style="width: 400px">
			<!-- Login -->
			<article id="Login" class="active" style="padding-top: 30px; padding-bottom:15px;">
				<h2 class="major" style="padding: 5px;">Login</h2>
				<form method="post" action="Login">
					<div style="margin: center; ">
						<label for="id">ID</label> <input type="text" name="id" id="id" style="padding:10px;"/>
					</div>
					<div style="margin: center; margin-top: 10px;">
						<label for="pw">PW</label> <input type="password" name="pw" id="pw" style="padding:10px;"/>
					</div>

					<ul class="actions" style="margin-top: 30px;">
						<li><input type="submit" value="Login" class="special" /></li>
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
