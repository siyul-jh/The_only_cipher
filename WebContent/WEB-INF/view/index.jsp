<%@ page import="poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>The Only Cipher</title>
<meta name="description"content="Firely is a one page comming soon template using Parallax, HTML5, CSS3 and PHP">
<meta name="author" content="Memories Dust">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ include file = "Source/index_topCss.jsp" %>
<% 
	String user_id = CmmUtil.nvl((String) session.getAttribute("user_id"));
%>
</head>
<body>
	<div id="modal-window">
		<div class="container">
			<header id="header">
				<div id="logo">
					<a href="#">The Only Cipher</a>
				</div>
			</header>
			<!-- modal 로그인 시 출력-->
 			<!-- <a id="modal-open"><i class="fa fa-bars"></i></a> -->
			<div id="rotate">
				<div class="rotate">
					<h1>세상에 하나밖에 없는</h1>
				</div>
				<div class="rotate">
					<h1>나만의 암호파일</h1>
				</div>
				<div class="rotate">
					<h1>최고의 보안을 위해</h1>
				</div>
			</div>
			<div id="clock"></div>
			<div class="newsletter">
				<p><strong>마감일정 : 2019년 6월 12일(월)</strong></p>
<!--  				<form method="post" action="javascript:void(0)"name="newsletterform" id="newsletterform">
					<fieldset>
						<input name="email" type="text" id="email"placeholder="Please enter your email" />
						<input type="submit"class="submit" id="submit" value="Notify Me" />
					</fieldset>
				</form>  -->
			</div>
			<div>
			<%if(user_id == "") { %>
				<div><p><a id="modal_sign_in" class="black_button" href="#">Sign in <i class="fa fa-sign-in-alt"></i></a></p></div>
				<div><p><strong>The Only Cipher</strong> 회원이 아니신가요? <a id="modal_sign_up" href="#">Sign up </a></p></div>
				<%} else { %>
				<div><p><a class="black_button" href="/home.do">홈페이지<i class="fa fa-sign-in-alt"></i></a></p></div>
				<%}%>
			</div>
		</div>
	</div>
	<!-- modal 로그인 시 출력-->
	<%@ include file="modal/nav.jsp" %>
	<%@ include file="modal/Sign.jsp" %>
	<!-- Start loading... -->
	<div id="preload">
		<div id="preload-content">
			<img src="images/loaders.gif" alt="preload icon" />
			<div class="preload-text">로딩중</div>
		</div>
	</div>
	<!-- Background -->
	<ul id="scene" class="scene unselectable">
		<li class="layer" data-depth="0.07">
			<div class="body-bg"></div>
		</li>
	</ul>
	<%@ include file="Source/index_bottomJs.jsp" %>
</body>
</html>