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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="522378797291-sf127aj5gpd554ccue3bvolahhn2akv8.apps.googleusercontent.com">
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
				<p><strong>수행일정 : 2019년 6월 13일(목)</strong></p>
			</div>
			<div>
			<%if(user_id == "") { %>
				<div class="g-signin2" data-onsuccess="onSignIn" data-width="300" data-height="49" data-longtitle="true" style="display: inline-block;"></div> <!-- Google Sign in & Sign up -->
				<div class="kakao-sign"><a id="custom-login-btn" href="javascript:loginWithKakao()"><img src="/images/kakao.png" width="300" height="49"/></a></div> <!-- Kakao Sign in & Sign up -->
				<%} else { %>
				<div><p><a class="black_button" href="/home.do">홈페이지<i class="fa fa-sign-in-alt"></i></a></p></div>
				<%}%>
			</div>
		</div>
	</div>
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