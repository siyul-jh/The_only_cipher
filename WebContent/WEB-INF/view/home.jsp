<%@ page import="poly.util.CmmUtil" %>
<%@ page import="poly.dto.NoticeDTO" %>
<%@ page import="poly.dto.PagingDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Document Title -->
		<title>The Only Cipher</title>
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="theme-color" content="#ffffff">
		<meta name="google-signin-client_id" content="522378797291-sf127aj5gpd554ccue3bvolahhn2akv8.apps.googleusercontent.com">
		<%@ include file="Source/home_topCss.jsp" %>
		<% 
		String user_id = CmmUtil.nvl((String) session.getAttribute("user_id"));
		String user_name = CmmUtil.nvl((String) session.getAttribute("user_name"));
		String user_mail = CmmUtil.nvl((String) session.getAttribute("user_mail"));
		String extension = CmmUtil.nvl((String) session.getAttribute("extension"));
		if (user_name.equals("")) {
			response.sendRedirect("/index.do");
		}
		List<NoticeDTO> rList = (List<NoticeDTO>)request.getAttribute("rList");
		PagingDTO pDTO = (PagingDTO)request.getAttribute("paging");
		%>
		<script type="text/javascript">
		if (window.sessionStorage) {
            sessionStorage.setItem('user_mail', '<%=user_mail.split("@")[0]%>');
		}
		</script>
		<script>
		function signOut() {
		    var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		            console.log('User signed out.');
		        });
			auth2.disconnect();
			location.href='/logout.do';
		}
		function onLoad() {
		      gapi.load('auth2', function() {
		        gapi.auth2.init();
		      });
		};
		</script>
		<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	</head>
	<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
	<div id="modal_custom_notice_detail" class="modal_custom"></div>
	<%if(user_id.equals("admin")) { %>
		<%@ include file = "modal/Notice.jsp" %>
	<%}%>
    	<main>
			<div class="page-loader">
				<div class="loader">로딩중...</div>
			</div>
			<!-- nav -->
			<nav class="navbar navbar-custom navbar-transparent navbar-fixed-top one-page" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse">
							<span class="sr-only">Navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="home.do">The Only Cipher</a>
					</div>
					<div class="collapse navbar-collapse" id="custom-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#totop">Home</a></li>
							<li><a class="section-scroll" href="#Notice">Notice</a></li>
							<li><a class="section-scroll" href="#Encryption">Encryption</a></li>
							<li><a class="section-scroll" href="#Decryption">Decryption</a></li>
							<li><a class="section-scroll" href="#Drive">Drive</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- bg -->
			<section class="home-section home-full-height bg-dark bg-gradient" id="home" data-background="/images/in-the-depths.jpg">
				<div class="titan-caption">
					<div class="caption-content">
						<div class="font-alt mb-30 titan-title-size-1">Encryption &amp; Decryption</div>
						<div class="font-alt mb-40 titan-title-size-4">The Only Cipher</div>
						<div class="mb-30 titan-title-size-1" id="user_name"><%=user_name + "님 환영합니다."%></div>
						<%if (extension.equals("kakao")) { %>
							<a class="section-scroll btn btn-border-w btn-round" href="logout.do">Kakao Logout</a>
						<%} else if (extension.equals("google")) {%>
							<a class="section-scroll btn btn-border-w btn-round" href="logout.do" onclick="signOut();">Google Logout</a>
						<%} else if (extension.equals("admin")) { %>
							<a class="section-scroll btn btn-border-w btn-round" href="logout.do">Logout</a>
						<%} %>
					</div>
				</div>
			 </section>
			<!-- main -->
			<div class="main">      
				<section class="module" id="Notice">
					<div class="container">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<h2 class="module-title font-alt">Notice</h2>
							<%if(user_id.equals("admin")) { %>
								<%@ include file = "modal/Notice.jsp" %>
								<div id="new_add"><p><a id="modal_notice_add" class="a-button" href="#">New Add<i class="fa fa-sign-in-alt"></i></a></p></div>
							<%}%>
							</div>
						</div>
						<div class="row multi-columns-row">
						<!-- 공지 -->
							<!-- 왼쪽 -->
							<div id="contents_left" class="col-sm-6">
							<!-- 윗 공지 -->
								<div class="menu">
								  <div class="row">
								    <div class="col-sm-8">
								      <h4 class="menu-title font-alt"></h4>
								      <div class="menu-detail font-serif"></div>
								    </div>
								    <div class="col-sm-4 menu-price-detail">
								      <h4 class="menu-price font-alt"></h4>
								    </div>
								  </div>
								</div>
							<!-- 아래 게시글 -->
								<div class="menu">
								  <div class="row">
								    <div class="col-sm-8">
								      <h4 class="menu-title font-alt"> </h4>
								      <div class="menu-detail font-serif"> </div>
								    </div>
								    <div class="col-sm-4 menu-price-detail">
								      <h4 class="menu-price font-alt"> </h4>
								    </div>
								  </div>
								</div>
								<div class="menu">
								  <div class="row">
								    <div class="col-sm-8">
								      <h4 class="menu-title font-alt"> </h4>
								      <div class="menu-detail font-serif"> </div>
								    </div>
								    <div class="col-sm-4 menu-price-detail">
								      <h4 class="menu-price font-alt"> </h4>
								    </div>
								  </div>
								</div>
							</div>
							<!-- 오른쪽 ok -->
							<div id="contents_right" class="col-sm-6">
							<!-- 윗 공지 -->
								<div class="menu">
								  <div class="row">
								    <div class="col-sm-8">
								      <h4 class="menu-title font-alt"> </h4>
								      <div class="menu-detail font-serif"> </div>
								    </div>
								    <div class="col-sm-4 menu-price-detail">
								      <h4 class="menu-price font-alt"> </h4>
								    </div>
								  </div>
								</div>
							<!-- 아래 게시글 -->
								<div class="menu">
								  <div class="row">
								    <div class="col-sm-8">
								      <h4 class="menu-title font-alt"> </h4>
								      <div class="menu-detail font-serif"> </div>
								    </div>
								    <div class="col-sm-4 menu-price-detail">
								      <h4 class="menu-price font-alt"> </h4>
								    </div>
								  </div>
								</div>
								<div class="menu">
								  <div class="row">
								    <div class="col-sm-8">
								      <h4 class="menu-title font-alt"> </h4>
								      <div class="menu-detail font-serif"> </div>
								    </div>
								    <div class="col-sm-4 menu-price-detail">
								      <h4 class="menu-price font-alt"> </h4>
								    </div>
								  </div>
								</div>
							</div>
						</div> 
						<!-- style css 입력 -->
						<div id="paging" class="pagination font-alt" style="width: 100%; text-align: center;">
							<a href="#"><i class="fa fa-angle-left"></i></a>
							<a class="active" href="javascript:page(1);">1</a>
							<a href="#"><i class="fa fa-angle-right"></i></a>
						</div>
					</div>
				</section>
				<div id="ajaxtest"></div>
				<hr class="divider-w">
			    <!-- Encryption -->
				<section id="Encryption" class="module bg-dark-30 parallax-bg restaurant-menu-bg" data-background="/images/Encryption.png" style="background-image: url(/images/Encryption.png);">
				  <div class="container">
				    <div class="row">
				      <div class="col-sm-2 col-sm-offset-5">
				        <div class="alt-module-subtitle"><span class="holder-w"></span>
				          <h5 class="font-serif">암호화</h5><span class="holder-w"></span>
				        </div>
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-sm-8 col-sm-offset-2">
				        <h2 class="module-title font-alt mb-0">Encryption</h2>
				      </div>
				    </div>
				  </div>
				</section>
				<section class="module">
					<div class="container">
						<div class="row multi-columns-row">
							<div class="col-sm-3 col-md-12 col-lg-12">
								<div class="count-item mb-sm-40">
									<div class="row">
										<div title="<%=user_id%>"id="Encrypt_fileUpload" class="dragAndDropDiv">Drag & Drop Files Here</div>
										<button class="multifiledownload" id="Encryption_multi">Zip Download</button>
									
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			    <!-- Decryption -->
				<section id="Decryption" class="module bg-dark-30 parallax-bg restaurant-menu-bg" data-background="/images/Decryption.png" style="background-image: url(/images/Decryption.png);">
				  <div class="container">
				    <div class="row">
				      <div class="col-sm-2 col-sm-offset-5">
				        <div class="alt-module-subtitle"><span class="holder-w"></span>
				          <h5 class="font-serif">복호화</h5><span class="holder-w"></span>
				        </div>
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-sm-8 col-sm-offset-2">
				        <h2 class="module-title font-alt mb-0">Decryption</h2>
				      </div>
				    </div>
				  </div>
				</section>
				<section class="module"> 
					<div class="container">
						<div class="row multi-columns-row">
							<div class="col-sm-3 col-md-12 col-lg-12">
								<div class="count-item mb-sm-40">
									<div class="row">
										<div title="<%=user_id%>" id="Decrypt_fileUpload" class="dragAndDropDiv">Drag & Drop Files Here</div>
										<button class="multifiledownload" id="Decryption_multi">Zip Download</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Drive -->
				<section id="Drive" class="module bg-dark-30 parallax-bg restaurant-menu-bg" data-background="/images/driver.png" style="background-image: url(/images/driver.png);">
				  <div class="container">
				    <div class="row">
				      <div class="col-sm-2 col-sm-offset-5">
				        <div class="alt-module-subtitle"><span class="holder-w"></span>
				          <h5 class="font-serif">드라이브</h5><span class="holder-w"></span>
				        </div>
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-sm-8 col-sm-offset-2">
				        <h2 class="module-title font-alt mb-0">Drive</h2>
				      </div>
				    </div>
				  </div>
				</section>
				<section class="module">
				  <div class="container">
				    <div class="row multi-columns-row">
				      <div class="col-sm-12 col-md-12 col-lg-12">
				        <div class="count-item mb-sm-40">
				          <div class="count-icon"><span class="icon-cloud"></span></div>
				          	<!-- <h3 class="count-to font-alt" data-countto="14">14</h3> -->
				          	<h5 class="count-title font-serif">Google Drive</h5>
							<button type="button" class="Googledrive">Connect to Google Drive</button>
				        </div>
				      </div>
				    </div>
				  </div>
				</section>
				<hr class="divider-w">
			  	<!-- footer -->
				<div class="module-small bg-dark">
				  <div class="container">
				    <div class="row">
				      <div class="col-sm-6">
				        <div class="widget">
				          <h5 class="widget-title font-alt">About</h5>
				          <p>2019년 개인프로젝트 실습, 나만의 암호화/복호화 서비스</p>
				          <p>Phone: 010-7225-3398</p>
				          <p>Email:<a href="#">gihum@naver.com</a></p>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
				<footer class="footer bg-dark">
				  <div class="container">
				    <div class="row">
				      <div class="col-sm-6">
				        <p class="copyright font-alt">&copy; 2019&nbsp;<a href="home.do">gihum</a>, All Rights Reserved</p>
				      </div>
				    </div>
				  </div>
				</footer>
			 </div>
			 <!-- scroll-up -->
			 <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
		</main>
  <%@ include file="Source/home_bottomJs.jsp" %>
	</body>
</html>