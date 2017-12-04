<%@page import="com.model.gift_listDTO"%>
<%@page import="com.model.gift_listDAO"%>
<%@page import="com.model.analysisDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.analysisDAO"%>
<%@page import="com.connect.python_connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
ul li{
	list-style: none; 
	float: right; 
	color: black;
}

#main #Login {
	background-color: rgba(255,255,255,0.9)
}

#bg{
	 opacity: 0.85;
	 background-image:url(images/bg4.jpg);
	 background-size: cover;

}

.major{
	color: black;

}
td{
	color: black;

}
#trr{
	border: 1px solid black;

}


input[type="button"].special1,
		button.special1,
		.button.special1 {
			background-color: gray;
			color: white !important;
			font-weight: 600;
		}
		
		
table tbody tr {
			border: solid 1px black;
			border-left: 0;
			border-right: 0;
		}
		
.small_title{
white-space:nowrap;
}		
</style>
</head>
<body class="is-article-visible">

	<!-- Wrapper -->
	<div id="wrapper">
	

		<%-- 	로그인 한 사용자 정보 불러옴 
	<%
		String nick = (String)session.getAttribute("nick");
		System.out.println(nick);
		MemberDAO m_dao = MemberDAO.getInstance();
		MemberDTO m_dto = m_dao.selectMember(nick);
		pageContext.setAttribute("member", m_dto);
	%>  --%>
		<!-- Main -->
		
		<%
		python_connection pc = new python_connection();
		pc.kakao_analysis();
			String nick = (String) session.getAttribute("nick");
			analysisDAO wdao = new analysisDAO();
			ArrayList<analysisDTO> arr = wdao.report_view();

			request.setAttribute("arr", arr);
			
			gift_listDAO gdao= new gift_listDAO();
			ArrayList<gift_listDTO> garr = gdao.gift_list_view();
			request.setAttribute("garr", garr);

		
		%>
		<div id="main">
			<!-- Info -->
			<article id="Login" class="active">
				<h2 class="major">분석</h2>


					<table style="height: 100px; border-color:black;">
						<tr align="center">
							<td colspan="4">${nick} 님의 호감도 분석 </td>
						</tr>
						<tr align="center">
							<td colspan="2" style="width: 120px; padding-bottom: 0px;"><p style="margin-bottom: 5px;">나의호감도 </p></td>
							<td colspan="2"  style="width: 120px; padding-bottom: 0px;"><p style="margin-bottom: 5px;">상대방 호감도</p></td>
						</tr>
						<tr align="center">
							<td align="right" style="width: 120px; padding-bottom: 0px;"><p style="margin-bottom: 5px;"><h1 id=small_title style="color:blue;"><%=arr.get(0).getI_aff() %></h1></p></td>
							<td align="left">%</td>
							<td align="right" style="width: 120px; padding-bottom: 0px;"><p style="margin-bottom: 5px;"><h1 id=small_title style="color:red;"><%=arr.get(0).getYou_aff() %></h1></p></td>
							<td align="left">%</td>						
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr align="center">
							<td colspan="2"  style="padding-bottom: 0px;"><p style="margin-bottom: 5px;">나의 평균 답장시간 </p></td>
							<td colspan="2"  style="padding-bottom: 0px;"><p style="margin-bottom: 5px;">상대방 평균 답장시간 </p></td>
						</tr>
						<tr align="center">
							<td align="right" style="padding-bottom: 0px;"><p style="margin-bottom: 5px;"><h1 id=small_title style="color:black;"><%=arr.get(0).getI_resp() %></h1></p></td>
							<td align="left">분</td>
							<td align="right" style="padding-bottom: 0px;"><p style="margin-bottom: 5px;"><h1 id=small_title style="color:black;"><%=arr.get(0).getYou_resp() %></h1></p></td>
							<td align="left">분</td>
						</tr>						
						<tr align="center">
							<td colspan="4" style="height: 50px;">
								<p style="font-size: 19pt; margin-bottom: 0px; margin-top: 80px;">상대와 나의 선톡비율</p>
							</td>
						</tr>
						
						<tr>
						<td colspan="4" align="center"><img src="./graph/sendtime.png" ></td>
						</tr>	
						
						<tr align="center">
							<td colspan="4" style="height: 50px;">
								<p style="font-size: 19pt; margin-bottom: 0px; margin-top: 50px;">상대와 자주사용한 키워드</p>
							</td>
						</tr>	
							
						<tr>
						<td colspan="4" align="center"><img src="./graph/keyword.png"></td>
						</tr>
						<!--  <tr align="center">
						<td colspan="4" align="center">키워드를 통한 상품 추천</td>
						</tr>
						<tr align="center">
						<td><%=garr.get(0).getWord_rank1() %></td>
						<td><%=garr.get(0).getWord_rank2() %></td>
						<td><%=garr.get(0).getWord_rank3() %></td>
						<td><%=garr.get(0).getWord_rank4() %></td>
						</tr>-->
						<tr align="right" sty>
						<td colspan="4"><a href="gift.jsp">상품추천 바로가기</a></td>
						</tr>
						
						<tr align="center">
							<td colspan="4" style="height: 50px;">
								<p style="font-size: 19pt; margin-bottom: 0px; margin-top: 50px;">상대와 사용한 단어 워드클라우드</p>
							</td>
						</tr>
						
						<tr>
						<td colspan="4" align="center"><img src="./graph/word_cloud.png"></td>
						</tr>
					</table>


					
					<!-- <table>
						<tr>
							<td colspan="4"></td>
						</tr>
						<tr>
							<td rowspan="2"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
					</table> -->
					<ul class="actions">
						<!-- <input type="submit" value="Update" class="special" /> -->
						<li><input type="button" class="special1" value="Cancel" onclick="location.href='main.jsp'" /></li>
					</ul>
				
				
			</article>
		</div>
	</div>
	<!-- BG -->
	<div id="bg"></div>
</body>
</html>

