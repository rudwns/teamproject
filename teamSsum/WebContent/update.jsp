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
		<div id="main">
			<!-- Info -->
			<article id="Login" class="active">
				<h2 class="major">Update</h2>
				<form method="post" action="Update">
					<div class="field half">
						<label for="id">ID</label> <input type="text" value="${sessionScope.id}" name="id" readonly="readonly" />
					</div>
					<div class="field half">
						<label for="pw">PW</label> <input type="password" name="pw"	/>
					</div>
					<div class="field half">
						<label for="nickname">NICKNAME</label> <input type="text" name="nick"/>
					</div>
					<div class="field half" style="border-radius: 10%; margin-top: 30px; box-shadow: none;">

						<label for="personnumber">생년월일</label> <input type="date"
							name="personnumber" id="personnumber"
							style="padding: 10px; background-color: white; color: black; " />


					</div>
					<div class="field half" style="margin-top: 20px;">
						성별 
						<input type="radio" name="gen" id="sex" value="남자" style="display: inline-block; clear: both; opacity: 1; margin-right: 0px;float:none; -webkit-appearance:radio;" />남
						<input type="radio" name="gen" value="여자" id="sex" style="display: inline-block; clear: both; opacity: 1; margin-right: 0px; float:none; -webkit-appearance:radio;"/>여

					</div>

					<ul class="actions" style="margin-top: 20px;">
						<li><input type="submit" value="Update" class="special" /></li>
						<li><input type="button" value="Delete" onclick="location.href='delete'" /></li>
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

