
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
	background-color: rgba(226, 190, 190, 0.85)
}

#bg{
	 opacity: 0.5;
	 background-image:url(images/bg1.jpg);
	 background-size: cover;

}
#lastbutton{
	border-radius: 20%;

}
</style>
</head>
<body class="is-article-visible">

	<!-- Wrapper -->
	<div id="wrapper">
		


		<div id="main">
			<!-- Info -->
			<article id="Login" class="active">
				<h1 class="major">파일업로드</h1>

				<form name="form" onsubmit="return check()" action="FileuploadService" method="post" enctype="multipart/form-data">

					<fieldset>
						<legend align="center" style="font-size:17pt;">마음이 궁금한 상대와의 대화 파일(.txt)을 선택해주세요</legend>

						<table>
							<tr>
								<td align = "center"><p style="font-size:18pt;">상대방 이름</p></td>
								<td><input id = "you" type="text" name="you"></td>
							</tr>
							
							<tr>
								<td align = "center"><p style="font-size:18pt">파일선택 :</p></td>
								<td><input type="file" name="file" id = "file" style="font-size: small;"></td>
							</tr>
						</table>
						
					</fieldset>

					<ul class="actions" id="lastbutton">
						<li><input type="submit" value="분석하기▶" class="special" style="border-radius: 10px;"/></li>
						<li><input type="button" value="Cancel"
							onclick="location.href='main.jsp'"style="border-radius: 10px;" /></li>
						
					</ul>
				</form>
				
				<script type="text/javascript">
				
				
							
				function check(){
					
					var FileTag = document.getElementById("file");
					var commaIndex = FileTag.value.indexOf(".");
					var filelen = FileTag.value.length;
					var extension = FileTag.value.substring(commaIndex, filelen);
					
					var YouTag = document.getElementById("you");
					
					
					if (extension!='.txt'){
						
						alert("확장자가 txt인 텍스트 파일만 업로드 가능합니다");
						FileTag.focus()
						return false;
						
						
					}else{
						document.form.submit;
					}
					
					
					
					if(YouTag.value==""){
						alert("상대방 이름을 입력해주세요. 별칭도 좋아요!");
						YouTag.focus();
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

