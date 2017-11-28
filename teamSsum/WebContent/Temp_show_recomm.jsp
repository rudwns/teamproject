<%@page import="com.model.ShowDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ShowDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Love and something</title>
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
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- ajax 쓰려고 박아둔 코드 -->
</head>
<body>
<body class="is-article-visible">

	<!-- Wrapper -->
	<div id="wrapper">
		<video id="videobcg" preload="auto" autoplay="ture" loop="loop"
			volume="Mute"> <source src="movie3.mp4" type="video/mp4">
		<source src="movie.webm" type="moive/webm"></video>
		<!-- Main -->
		<div id="main">
			<!-- Return -->
			<article id="Login" class="active">
			<h2 class="major">추천</h2>
			<p>[이런 영화는 어때요?]</p>
			<table id="movie"></table>
			<table id="show"></table>

			<script type="text/javascript">
				$.ajax({
					url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20171119",
					success : function(result) {
						//for (var i = 0; i < result.boxOfficeResult.weeklyBoxOfficeList.length; i++) {
						//document.write(result.boxOfficeResult.weeklyBoxOfficeList[i].rnum+"."+result.boxOfficeResult.weeklyBoxOfficeList[i].movieNm+"<br>")
						var tableTag = document.getElementById("movie"); // 추가할 대상 태그
			
						var new_img1 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[0].rnum);
						var new_img2 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[1].rnum);
						var new_img3 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[2].rnum);
						var new_img4 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[3].rnum);
						var new_img5 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[4].rnum);
						var new_img6 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[5].rnum);
						var new_img7 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[6].rnum);
						var new_img8 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[7].rnum);
						var new_img9 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[8].rnum);
						var new_img10 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[9].rnum);
			
						var new_imgtd1 = document.createElement("td");
						var new_imgtd2 = document.createElement("td");
						var new_imgtd3 = document.createElement("td");
						var new_imgtd4 = document.createElement("td");
						var new_imgtd5 = document.createElement("td");
						var new_imgtd6 = document.createElement("td");
						var new_imgtd7 = document.createElement("td");
						var new_imgtd8 = document.createElement("td");
						var new_imgtd9 = document.createElement("td");
						var new_imgtd10 = document.createElement("td");
			
						var new_txt1 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[0].movieNm);
						var new_txt2 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[1].movieNm);
						var new_txt3 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[2].movieNm);
						var new_txt4 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[3].movieNm);
						var new_txt5 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[4].movieNm);
						var new_txt6 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[5].movieNm);
						var new_txt7 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[6].movieNm);
						var new_txt8 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[7].movieNm);
						var new_txt9 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[8].movieNm);
						var new_txt10 = document.createTextNode(result.boxOfficeResult.weeklyBoxOfficeList[9].movieNm);
			
						var new_txttd1 = document.createElement("td");
						var new_txttd2 = document.createElement("td");
						var new_txttd3 = document.createElement("td");
						var new_txttd4 = document.createElement("td");
						var new_txttd5 = document.createElement("td");
						var new_txttd6 = document.createElement("td");
						var new_txttd7 = document.createElement("td");
						var new_txttd8 = document.createElement("td");
						var new_txttd9 = document.createElement("td");
						var new_txttd10 = document.createElement("td");
			
						var new_tr1 = document.createElement("tr");
						var new_tr2 = document.createElement("tr");
						var new_tr3 = document.createElement("tr");
						var new_tr4 = document.createElement("tr");
			
						new_imgtd1.appendChild(new_img1);
						new_imgtd2.appendChild(new_img2);
						new_imgtd3.appendChild(new_img3);
						new_imgtd4.appendChild(new_img4);
						new_imgtd5.appendChild(new_img5);
						new_imgtd6.appendChild(new_img6);
						new_imgtd7.appendChild(new_img7);
						new_imgtd8.appendChild(new_img8);
						new_imgtd9.appendChild(new_img9);
						new_imgtd10.appendChild(new_img10);
			
						new_txttd1.appendChild(new_txt1);
						new_txttd2.appendChild(new_txt2);
						new_txttd3.appendChild(new_txt3);
						new_txttd4.appendChild(new_txt4);
						new_txttd5.appendChild(new_txt5);
						new_txttd6.appendChild(new_txt6);
						new_txttd7.appendChild(new_txt7);
						new_txttd8.appendChild(new_txt8);
						new_txttd9.appendChild(new_txt9);
						new_txttd10.appendChild(new_txt10);
			
						new_tr1.appendChild(new_imgtd1);
						new_tr1.appendChild(new_imgtd2);
						new_tr1.appendChild(new_imgtd3);
						new_tr1.appendChild(new_imgtd4);
						new_tr1.appendChild(new_imgtd5);
			
						new_tr2.appendChild(new_txttd1);
						new_tr2.appendChild(new_txttd2);
						new_tr2.appendChild(new_txttd3);
						new_tr2.appendChild(new_txttd4);
						new_tr2.appendChild(new_txttd5);
			
						new_tr3.appendChild(new_imgtd6);
						new_tr3.appendChild(new_imgtd7);
						new_tr3.appendChild(new_imgtd8);
						new_tr3.appendChild(new_imgtd9);
						new_tr3.appendChild(new_imgtd10);
			
						new_tr4.appendChild(new_txttd6);
						new_tr4.appendChild(new_txttd7);
						new_tr4.appendChild(new_txttd8);
						new_tr4.appendChild(new_txttd9);
						new_tr4.appendChild(new_txttd10);
			
						tableTag.appendChild(new_tr1);
						tableTag.appendChild(new_tr2);
						tableTag.appendChild(new_tr3);
						tableTag.appendChild(new_tr4);
			
					}
				});
			</script>

			<p>[공연정보를 봐볼까요?]</p>
			<%
				String nick = (String) session.getAttribute("nick");
				ShowDAO dao = new ShowDAO();
				ArrayList<ShowDTO> arr = dao.selectShopAll();

				request.setAttribute("arr", arr);

			%>
			 
			<c:forEach items="${arr }" var="vo">

				<li><b>${vo.title }</b>&nbsp&nbsp${vo.place
					}&nbsp>>>&nbsp${vo.days }<a
					href='${vo.link }'>바로가기</a><br></li>

			</c:forEach>





			<ul class="actions">
				<li><input type="button" value="Cancel"
					onclick="location.href='main.jsp'" /></li>
			</ul>
			</article>
		</div>

	</div>
	<!-- BG -->
	<div id="bg"></div>




</body>
</html>