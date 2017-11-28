<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
input[type="radio"]{
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background-color : blue;
    cursor:pointer;
}
</style>
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
				<h2 class="major">JOIN</h2>
				<form method="post" action="Join">
					<div class="field half">
						<label for="id">ID</label>
								<td><input type="text" name="id" id="name" style="padding:10px;"/></td>
					</div>
					<div class="field half">
						<label for="pw">PW</label> <input type="text" name="pw" id="email" style="padding:10px;"/>
					</div>
					<div class="field half">
						<label for="nickname">NICKNAME</label> <input type="text"
							name="nick" id="email" style="padding:10px;"/>
					</div>
					<div class="field half">
						<label for="personnumber">BIRTHDAY</label> 
						<input type="text"name="personnumber" id="personnumber" style="padding:10px;"/>
						
					</div>
					<div class="field half">
						<label for="tel">SEX</label> 
							<input type="text"name="sex" id="sex" style="padding:10px;"/>
						
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
