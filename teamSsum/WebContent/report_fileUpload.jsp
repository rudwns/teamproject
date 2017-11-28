
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
				<h2 class="major">���Ͼ��ε�</h2>

				<form name="form" onsubmit="return check()" action="FileuploadService" method="post" enctype="multipart/form-data">

					<fieldset>
						<legend align="center">������ �ñ��� ������ ��ȭ ����(.txt)�� �������ּ���</legend>

						<table>
							<tr>
								<td align = "center"><p>���� �̸�</p></td>
								<td><input type="text" name="you"></td>
							</tr>
							
							<tr>
								<td align = "center"><p>���ϼ��� :</p></td>
								<td><input type="file" name="file" id = "file"></td>
							</tr>
						</table>
						
					</fieldset>

					<ul class="actions">
						<li><input type="submit" value="�м��ϱ⢺" class="special" /></li>
						<li><input type="button" value="Cancel"
							onclick="location.href='main.jsp'" /></li>
					</ul>
				</form>
				
				<script type="text/javascript">
				
				
							
				function check(){
					
					var FileTag = document.getElementById("file");
					var commaIndex = FileTag.value.indexOf(".");
					var filelen = FileTag.value.length;
					var extension = FileTag.value.substring(commaIndex, filelen);
					
					if (extension!='.txt'){
						
						alert("Ȯ���ڰ� txt�� �ؽ�Ʈ ���ϸ� ���ε� �����մϴ�");
						FileTag.focus()
						return false;
						
					}else{
						document.form.submit;
					}
					
				}
				
				
				
				</script>

			</article>
		</div>
	</div>
	<!-- BG -->
	<div id="bg"></div>
</body>
</html>

