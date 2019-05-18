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
 			<a id="modal-open"><i class="fa fa-bars"></i></a>
 			
			<div class="newsletter">
 				<form method="post" action="javascript:void(0)"name="newsletterform" id="newsletterform">
					<fieldset>
						<input name="email" type="text" id="email"placeholder="Search" />
						<input type="submit"class="submit" id="submit" value="Search" />
					</fieldset>
				</form> 
			</div>
		</div>
	</div>
	<div class="container">
		<section class="section">
			<div id="srchList">
				<div id="srchListArea">
        	  		<div class="Area">
	        	    	<ul class="info">
	        	    		<li><a href="#" data-gallery="" target="_blank"><img src="/images/sample/1.jpg" style="max-width:400px;max-height:400px;"></a></li>
	        	    		<li><div><p style="text-align:left; color:black;"><strong>제품명</strong></p></div>
	        	    			<div><p style="text-align:left; color:black;"><strong>제품 영문명</strong></p></div>
	        	    			<div><p style="text-align:left; color:black;"><strong>생산자</strong></p></div>
	        	    			<div><p style="text-align:left; color:black;"><strong>생산지역</strong></p></div>
	        	    			<div><p style="text-align:left; color:black;"><strong>스타일</strong></p></div>
	        	    			<div><p style="text-align:left; color:black;"><strong>알코올 도수</strong></p></div>
	        	    			<div><p style="text-align:left; color:black;"><strong>음용 온도</strong></p></div>
	        	    			<div><p style="text-align:left; color:black;"><strong>IBU</strong></p></div>
	        	    			<div><p style="text-align:left; color:black;"><strong>생산주기</strong></p></div></li>
	        	    	</ul>
	        	    	<ul class="tab">
	        	    		<li><button type="button" class="black_button">소개</button></li>
	        	    		<li><button type="button" class="black_button">추천 안주</button></li>
	        	    		<li><button type="button" class="black_button">리뷰</button></li>
	        	    	</ul>
	        	    	<ul>
	        	    		<li><h1 style="text-align:left; color:black;"><strong>제품정보</strong></h1></li>
	        	    		<li><p style="text-align:left; color:black;">탁한 노랜색을 띄고 있으며탁한 노랜색을 띄고 있으며탁한 노랜색을 띄고 있으며탁한 노랜색을 띄고 있으며탁한 노랜색을 띄고 있으며탁한 노랜색을 띄고 있으며탁한 노랜색을 띄고 있으며</p></li>
	        	    	</ul> 
	        	    </div>
				</div>
			</div>
		</section>
	</div>
	<!-- modal 로그인 시 출력-->
 	<%@ include file="/WEB-INF/view/modal/nav.jsp" %>
	<!-- Background -->
	<ul id="scene" class="scene unselectable">
		<li class="layer" data-depth="0.08">
			<div class="body-bg"></div>
		</li>
	</ul>
	<!-- nav -->
	<div class="general_social_icons">
		<nav class="social">
			<div>
				<ul>
					<li class="nav-item"><a href="/"><img src="/images/home.png"><p>Home</p></a></li>
					<li class="nav-item"><img src="/images/beer.png"><p>Beer</p></li>
					<li class="nav-item"><img src="/images/pub.png"><p>Pub</p></li>
					<li class="nav-item"><img src="/images/community.png"><p>Community</p></li>
				</ul>
			</div>
	  </nav>
	</div>
	<%@ include file="Source/bottomJs.jsp" %>
</body>
</html>