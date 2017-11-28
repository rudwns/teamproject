
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Info Page</title>
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

#main #Login {
	background-color: rgba(243, 181, 184, 0.85)
}
</style>
</head>
<body class="is-article-visible">

	<!-- Wrapper -->
	<div id="wrapper">
		<video id="videobcg" preload="auto" autoplay="ture" loop="loop"
			volume="Mute">
			<source src="movie3.mp4" type="video/mp4">
			<source src="movie.webm" type="moive/webm">
		</video>


		<div id="main">
			<!-- Info -->
			<article id="Login" class="active">
				<h2 class="major">파일업로드</h2>

				<form action="uploadService" method="post" enctype="multipart/form-data">

					<fieldset>
						<legend align="center">마음이 궁금한 상대와의 대화 파일(.txt)을 선택해주세요</legend>

						<table>
							<tr>
								<td align = "center"><p>파일선택 :</p></td>
								<td><input type="file" name="file"></td>
							</tr>

						</table>
					</fieldset>

					<ul class="actions">
						<li><input type="submit" value="분석하기▶" class="special" /></li>
						<li><input type="button" value="Cancel"
							onclick="location.href='main.jsp'" /></li>
					</ul>
				</form>

			</article>
		</div>
	</div>
	<!-- BG -->
	<div id="bg"></div>
</body>
</html>

