<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>DeBeerFood&.</title>
<meta name="description"content="Firely is a one page comming soon template using Parallax, HTML5, CSS3 and PHP">
<meta name="author" content="Memories Dust">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ include file = "Source/topCss.jsp" %>
</head>
<body>
	<div id="modal-window">
		<div class="container">
			<header id="header">
				<div id="logo">
					<a href="#">DeBeerFood&.</a>
				</div>
			</header>
			<!-- modal 로그인 시 출력-->
 			<!-- <a id="modal-open"><i class="fa fa-bars"></i></a> -->
			<div id="rotate">
				<div class="rotate">
					<h1>세상의 모든 맥주를 찾아서</h1>
				</div>
				<div class="rotate">
					<h1>맥주와 환상조합 안주를 찾아</h1>
				</div>
				<div class="rotate">
					<h1>짜릿해, 늘 새로워</h1>
				</div>
			</div>
<!--			<div id="clock"></div>
			<div class="newsletter">
				<p><strong>마감일정 : 2019년 6월 17일(월)</strong></p>
 				<form method="post" action="javascript:void(0)"name="newsletterform" id="newsletterform">
					<fieldset>
						<input name="email" type="text" id="email"placeholder="Please enter your email" />
						<input type="submit"class="submit" id="submit" value="Notify Me" />
					</fieldset>
				</form> 
			</div>-->
			<div>
				<div><p><a id="modal_sign_in" class="black_button" href="#">Sign in <i class="fa fa-sign-in-alt"></i></a></p></div>
				<div><p><strong>DeBeerFood&.</strong> 회원이 아니신가요? <a id="modal_sign_up" href="#">Sign up </a></p></div>
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
	<%@ include file="Source/bottomJs.jsp" %>
</body>
</html>