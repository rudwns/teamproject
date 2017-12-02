<%@page import="com.model.BookDAO"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MemberDTO"%>
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


		
		<!-- Main -->
		<div id="main">
			<!-- Info -->
			<article id="Login" class="active">
				<h2 class="major">보고서</h2>
				
					<div class="field half" style="margin-left: 0;">
						<label for="id">호감도 분석</label> 
						<input type="text"value="hello" name="id" readonly="readonly" style="width: 100%"/>
					</div>
					<!-- 		<div class="field half">
						<label for="pw">PW</label> <input type="password" name="pw"	id="pw" />
					</div> -->
					<div class="field half" style="margin-left: 0;">
						<label for="nickname">상대방의 감정상태</label>
						<input type="text"value="${pageScope.member.nick}" name="nick" readonly="readonly" style="width: 100%"/>
					</div>
					<div class="field half" style="margin-left: 0;">
						<label for="email">우리의 단어구름</label> 
						<input type="text"value="${pageScope.member.email}" name="email"readonly="readonly" style="width: 100%"/>
					</div>
					<div class="field half" style="margin-left: 0;">
						<label for="tel">상대방의 대화주제</label> <input type="text"
							value="${pageScope.member.tel}" name="tel" readonly="readonly" style="width: 100%"/>
					</div>
					<div class="field half" style="margin-left: 0;">
						<label for="tel">상대방과 나의 대화주제</label> <input type="text"
							value="${pageScope.member.tel}" name="tel" readonly="readonly" style="width: 100%" />
					</div>
					<div class="field half" style="margin-left: 0;">
						<label for="tel">우리의 평균 답장시간</label> <input type="text"
							value="${pageScope.member.tel}" name="tel" readonly="readonly" style="width: 100%"/>
					</div>

					<ul class="actions">
						<li><input type="submit" value="Update" class="special" /></li>
						<li><input type="button" value="Cancel"
							onclick="location.href='main.jsp'" /></li>
					</ul>
				</form>
			</article>
		</div>
	</div>
	<!-- BG -->
	<!-- <div id="bg"></div> -->
</body>
</html>

