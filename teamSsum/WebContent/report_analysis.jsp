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
}

#main #Login {
	background-color: rgba(226, 190, 190, 0.85)
}

#bg{
	 opacity: 0.5;
	 background-image:url(images/bg1.jpg);
	 background-size: cover;

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

		
		%>
		<div id="main">
			<!-- Info -->
			<article id="Login" class="active">
				<h2 class="major">분석</h2>

					<table style="height: 100px;">
						<tr>
							<td colspan="2">${nick} 님의 호감도 분석 </td>
						</tr>
						<tr>
							<td style="width: 120px; padding-bottom: 0px;"><p style="margin-bottom: 5px;">나의호감도 : <%=arr.get(0).getI_aff() %></p></td>
							<td style="width: 120px; padding-bottom: 0px;"><p style="margin-bottom: 5px;">상대방 호감도 : <%=arr.get(0).getYou_aff() %></p></td>
						</tr>
						
						<tr>
							<td style="padding-bottom: 0px;"><p style="margin-bottom: 5px;">나의 평균 답장시간 : <%=arr.get(0).getI_resp() %></p></td>
							<td style="padding-bottom: 0px;"><p style="margin-bottom: 5px;">상대방 평균 답장시간 : <%=arr.get(0).getYou_resp() %></p></td>
						</tr>
					</table>

					
					<table>
						<tr>
							<td colspan="4"></td>
						</tr>
						<tr>
							<td rowspan="2"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
					</table>
					<ul class="actions">
						<li><input type="submit" value="Update" class="special" /></li>
						<li><input type="button" value="Cancel"onclick="location.href='main.jsp'" /></li>
					</ul>
				
				
			</article>
		</div>
	</div>
	<!-- BG -->
	<div id="bg"></div>
</body>
</html>

