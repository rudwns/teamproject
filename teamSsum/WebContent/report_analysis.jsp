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
	

		<%-- 	�α��� �� ����� ���� �ҷ��� 
	<%
		String nick = (String)session.getAttribute("nick");
		System.out.println(nick);
		MemberDAO m_dao = MemberDAO.getInstance();
		MemberDTO m_dto = m_dao.selectMember(nick);
		pageContext.setAttribute("member", m_dto);
	%>  --%>
		<!-- Main -->
		<div id="main">
			<!-- Info -->
			<article id="Login" class="active">
				<h2 class="major">�м�</h2>
				
					<div class="field half" style="margin-left: 0;">
						<label for="id">ȣ���� �м�${nick}</label> <input type="text"
							value="�����ٶ󸶹ٻ������īŸ�����϶󸶹ٻ������īŸ������"
							name="id" readonly="readonly" />
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
	<div id="bg"></div>
</body>
</html>

