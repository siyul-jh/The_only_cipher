<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>에러페이</title>
<meta name="description"content="Firely is a one page comming soon template using Parallax, HTML5, CSS3 and PHP">
<meta name="author" content="Memories Dust">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ include file = "topCss.jsp" %>
</head>
<body>
	<div id="modal-window">
		<div class="container">
			<header id="header">
				<div id="logo">
					<a href="#">Error</a>
				</div>
			</header>
			<a id="modal-open">
				<i class="fa fa-bars"></i>
			</a>
			<div id="rotate">
				<div class="rotate">
					<h1>Error</h1>
				</div>
				<div class="rotate">
					<h1>Error</h1>
				</div>
				<div class="rotate">
					<h1>Error</h1>
				</div>
			</div>
			<div id="clock"></div>
			<div id="newsletter">
				<p>Error</p>
				<form method="post" action="javascript:void(0)"name="newsletterform" id="newsletterform">
					<fieldset>
						<input name="email" type="text" id="email"placeholder="Please enter your email" />
						<input type="submit"class="submit" id="submit" value="Notify Me" />
					</fieldset>
				</form>
			</div>
			<div class="social">
				<ul>
					<li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#" title="Google+"><i class="fa fa-google-plus"></i></a></li>
					<li><a href="#" title="LinkedIn"><i class="fa fa-linkedin"></i></a></li>
					<li><a href="#" title="Vimeo"><i class="fa fa-vimeo-square"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="modal">
		<div class="container">
			<div class="one">
				<h2>Error</h2>
				<a id="modal-close" href="#"><i class="fa fa-home"></i></a>
				<p>Error</p>
			</div>
			<div class="one-half">
				<h3>First List</h3>
				<ul>
					<li><i class="fa fa-download"></i>Error</li>
					<li><i class="fa fa-check"></i>Error</li>
					<li><i class="fa fa-css3"></i>Error</li>
				</ul>
			</div>
			<div class="one-half">
				<h3>Second List</h3>
				<ul>
					<li><i class="fa fa-html5"></i>Error</li>
					<li><i class="fa fa-phone"></i>Error</li>
					<li><i class="fa fa-envelope"></i>Error</li>
				</ul>
			</div>
			<div class="one">
				<h2>Contact Us</h2>
				<p>Error</p>
			</div>
			<div class="one-third">
				<div class="widget-contact">
					<span class="big-icon"><i class="fa fa-envelope"></i></span>
					<h3>Write Us</h3>
					<a href="javascript:void(0)">Error</a>
				</div>
			</div>
			<div class="one-third">
				<div class="widget-contact">
					<span class="big-icon"><i class="fa fa-phone"></i></span>
					<h3>Call Us</h3>
					<a href="javascript:void(0)">Error</a>
				</div>
			</div>
			<div class="one-third">
				<div class="widget-contact">
					<span class="big-icon"><i class="fa fa-map-marker"></i></span>
					<h3>Locate Us</h3>
					<a href="javascript:void(0)">Error</a>
				</div>
			</div>
			<div id="contact-form" class="one">
				<div id="contact-form-message"></div>
				<form method="post" action="send-email.php" name="contactform" id="contactform">
					<input name="contact-name" type="text" id="contact-name" placeholder="Name">
					<input name="contact-email" type="text" id="contact-email" placeholder="E-Mail">
					<textarea name="contact-comments" id="contact-comments" placeholder="Message"></textarea>
					<input type="submit" class="send_message transition" id="submit" value="Send Message">
				</form>
			</div>
		</div>
	</div>
	<div id="preload">
		<div id="preload-content">
			<img src="images/loaders.gif" alt="preload icon" />
			<div class="preload-text">loading...</div>
		</div>
	</div>
	<ul id="scene" class="scene unselectable">
		<li class="layer" data-depth="0.07">
			<div class="body-bg"></div>
		</li>
	</ul>
	<%@ include file="bottomJs.jsp" %>
</body>
</html>