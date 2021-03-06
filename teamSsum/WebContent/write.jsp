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
<style type="text/css">
	#main  {
	background-color: rgba(243, 181, 184, 0.5);
}

	#bg{
	opacity: 0.5;
	 background-image:url(images/back3.png);
	 background-size: cover;

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
				<h2 class="major">Write</h2>
				<form name="form" onsubmit="return check()" method="post" action="WriteService">
					<div class="field half" style="float: left;">
						<label for="nickname">NICKNAME</label> <input type="text"
							value="${nick}" name="nick" readonly="readonly" style="font-size: 15pt;"/>
					</div>
					<div class="field half" style="float: left;">
						<label for="title">Title</label> <input id="title" type="text"
							name="title" style="font-size: 15pt;"/>
					</div>
					<div style=" width: 740px; margin-right: 20 px; margin-left: 10px">
						<label for="content">content</label>
						<textarea id="content" cols="9" rows="4" name="content" style="font-size: 15pt;"></textarea>
					</div>

					<ul class="actions">
						
						<li><input type="submit" value="Write" class="special" /></li>
						<li><input type="button" value="Cancel" onclick="location.href='greenright.jsp'" /></li>
					</ul>
				</form>

				<script type="text/javascript">
				
				
				function check(){
					
					var TitleTag = document.getElementById("title");
					var contentTag = document.getElementById("content");
								
					
					if(TitleTag.value==""){
						alert("제목을 입력해주세요.");
						TitleTag.focus();
						return false;				
					}else{
						document.form.submit;
					}
						
						
					if(contentTag.value==""){
							alert("내용을 입력해주세요.");
							contentTag.focus();
							return false;				
						}else{
							document.form.submit;
						}
				}
				
				</script>


			</article>
		</div>
	</div>
	<div id="bg"></div>
</body>
</html>
