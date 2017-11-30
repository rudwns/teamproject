<%@page import="com.model.BoardDTO"%>
<%@page import="com.model.BoardDAO"%>
<%@page import="com.model.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Content Page</title>
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
	 background-image:url(images/back3.png);
	 background-size: cover;

}
body {
	color:black;
}
label{
	color:black;
}




</style>
</head>
<body class="is-article-visible">
	
		<%
		ReviewDAO dao = ReviewDAO.getInstance();
		ArrayList<ReviewDTO> list1 = dao.selectBoardAll();
		pageContext.setAttribute("list1", list1);
		%>
		
		<%-- <%
		BoardDAO dao1 = BoardDAO.getInstance();
		ArrayList<BoardDTO> list = dao1.selectBoardAll();
		pageContext.setAttribute("list", list);
		%> --%>
	
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- Content -->
			<article id="Content" class="active">
				<h2  style="margin-bottom: none; text-align: center; color: black;">Content</h2>
				<hr width="740px;" style="margin-top: 0%; margin-bottom: 2%;"></hr>
				<form action="UpdateContent" method="post">
					<input type="hidden" name="num" value="${dto.num}">
					
					<div class="field half" style="float:left;">
						<label for="nickname">NICKNAME</label> 
						<p align="center">${dto.nick}</p>
					</div>
					
					<div class="field half" style="float:left;">
						<label for="title">Title</label> 
						<p align="center">${dto.title}</p>
					</div>
					
					<hr width="740px" style="margin-bottom: 1%; margin-top: 0%;"></hr>
					<div style=" width: 740px; margin-left: 10px">
						<label for="content" style="border: 1px;">content</label>
						<c:choose>
						<c:when test="${nick == dto.nick}">
						<textarea cols="7" rows="4" name="content" >${dto.content}</textarea>
						</c:when>
						<c:otherwise>
							<p style="width: 730px" align="left">${dto.content}</p>
						<!-- <textarea cols="7" rows="4" name="content" readonly="readonly"> --><!-- </textarea> -->
						</c:otherwise>
						</c:choose>
					</div>

					<ul class="actions">
						<li><a href="Content?num=${list.num}">${list.title}</a></li>
						<c:if test="${nick==dto.nick}">
							<li><input type="submit" value="Update" class="special" style="position: right;"/></li>
						</c:if>
						
					</ul>
				</form>
				<table>
					
					<tr>	
							
							<c:if test="${check != 1}"> 
								<td colspan="2" align="right" style="padding: none;">
								<!-- 현재 로그인한 닉네임과 글을 작성한 닉네임이 같지않으면 좋아요 싫어요 버튼이 나온다. -->
							<%-- <c:choose>--%> 
							
								
									<c:if test="${nick != dto.nick }">
									<!-- 게시글 좋아요 버튼-->
									<form action="likeer?num=${list.num}" style="margin-bottom: 0%;">
									<input type="hidden" name="num" value="${dto.num}" >
									<label for="content" >${dto.likeer }</label>
									<input type="submit" value="LIKE" style="color: black;"/>
									</form>
									</c:if>
								</td>
								<td colspan="2" align="right">
									<c:if test="${nick != dto.nick }">
									<!-- 게시글 싫어요 버튼 -->
									<form action="hate?num=${list.num}"style="padding: none;" style="margin-bottom: 0%;">
									<label for="content">${dto.hate}</label>
									<input type="hidden" name="num" value="${dto.num}">
									<input type="submit" value="HATE" style="color: black;"/>
									</form>
									</c:if>
								</td>
							
							 </c:if> 
							
						
						<tr align="center">
							<td>Num</td>
							<td>Nick</td>
							<td>Date</td>
							<td>Content</td>
						</tr>
						
						<c:choose>
							<c:when test="${empty list1}">
								<!-- 댓글 보여주는 곳 -->
								<tr>
								<td colspan="4" align="center">댓글이 없습니다.</td>
								 </tr>
							</c:when>
						</c:choose>
							
								<c:forEach items="${list1}" var="list1">
								<tr align="center">
								
								<c:if test="${list1.num==dto.num}">
									<td>${list1.num}</td>
									<td>${list1.nick }</td>
									<td>${list1.day }</td>
									<td>${list1.content }</td>
								</c:if>
								</tr>
								</c:forEach> 
							
							</table>
							<table>
						
						
						<tr>
							<!-- 댓글 입력 -->
							<td colspan="4" align="right">
							<form action="review" style="margin-bottom: 0%;">
							<input type="hidden" name="num" value="${dto.num}">
							<p align="left" style="margin-bottom: 0%;">REVIEW</p>
							<p align="right" style="margin-bottom: 0%;">NICKAME : ${sessionScope.nick}</p>
							
							<input type="text" name="content">
							<input type="submit" value="Review" class="special" />
							</form></td>
						</tr>
						</table>
						<!-- <tr>
						<td align="right" colspan="2"></td>
							<td align="right"> -->
								<!-- 게시글 삭제 -->
								<form action="RemoveContent" style="margin-bottom: 0%;">
								<input type="hidden" name="num" value="${dto.num}">
									<ul class="actions" style="margin-bottom: 0%; align-content: left;">
									<!-- 현재 로그인한 닉네임과 게시글을 적은 닉네임이 같지않으면 삭제버튼이 나오지않는다. -->
									<c:if test="${nick==dto.nick }">
									<li><input type="submit" value="Delete" class="special" /></li>
									</c:if>
									</ul>
								</form>
							<!-- </td>
							<td align="right"> -->
								<input style="align-content: right; color: black;" type="button" value="Cancel" onclick="location.href='greenright.jsp'" />
						<!-- 	</td>
						</tr> -->
				
			</article>
		</div>
	</div>
	<div id="bg"></div>
</body>
</html>

