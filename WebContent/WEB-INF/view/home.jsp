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
<!--     <link rel="manifest" href="/manifest.json"> -->
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">

    <%@ include file="Source/home_topCss.jsp" %>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">로딩중...</div>
      </div>
      <!-- nav -->
      <nav class="navbar navbar-custom navbar-transparent navbar-fixed-top one-page" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html">Titan</a>
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
            <div class="font-alt mb-30 titan-title-size-1">Hello &amp; welcome</div>
            <div class="font-alt mb-40 titan-title-size-4">We are Titan</div><a class="section-scroll btn btn-border-w btn-round" href="#">Learn More</a>
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
						<!-- <div class="module-subtitle font-serif">A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</div> -->
					</div>
				</div>
				<div class="row multi-columns-row">
	              <div class="col-sm-6">
	                <div class="menu">
	                  <div class="row">
	                    <div class="col-sm-8">
	                      <h4 class="menu-title font-alt">Wild Mushroom Bucatini with Kale</h4>
	                      <div class="menu-detail font-serif">Mushroom / Veggie / White Sources</div>
	                    </div>
	                    <div class="col-sm-4 menu-price-detail">
	                      <h4 class="menu-price font-alt">$10.5</h4>
	                    </div>
	                  </div>
	                </div>
	                <div class="menu">
	                  <div class="row">
	                    <div class="col-sm-8">
	                      <h4 class="menu-title font-alt">Lemon and Garlic Green Beans</h4>
	                      <div class="menu-detail font-serif">Lemon / Garlic / Beans</div>
	                    </div>
	                    <div class="col-sm-4 menu-price-detail">
	                      <h4 class="menu-price font-alt">$14.5</h4>
	                    </div>
	                  </div>
	                </div>
	              </div>
	              <div class="col-sm-6">
	                <div class="menu">
	                  <div class="row">
	                    <div class="col-sm-8">
	                      <h4 class="menu-title font-alt">Wild Mushroom Bucatini with Kale</h4>
	                      <div class="menu-detail font-serif">Mushroom / Veggie / White Sources</div>
	                    </div>
	                    <div class="col-sm-4 menu-price-detail">
	                      <h4 class="menu-price font-alt">$10.5</h4>
	                    </div>
	                  </div>
	                </div>
	                <div class="menu">
	                  <div class="row">
	                    <div class="col-sm-8">
	                      <h4 class="menu-title font-alt">Lemon and Garlic Green Beans</h4>
	                      <div class="menu-detail font-serif">Lemon / Garlic / Beans</div>
	                    </div>
	                    <div class="col-sm-4 menu-price-detail">
	                      <h4 class="menu-price font-alt">$14.5</h4>
	                    </div>
	                  </div>
	                </div>
	              </div>
            </div>
				<!-- style css 입력 -->
				<div class="pagination font-alt" style="width: 100%; text-align: center;">
					<a href="#"><i class="fa fa-angle-left"></i></a>
					<a class="active" href="#">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">
					<i class="fa fa-angle-right"></i></a>
				</div>
			</div>
		</section>
		<hr class="divider-w">
        <!-- Encryption -->
        <section id="Encryption" class="module bg-dark-30 parallax-bg restaurant-menu-bg" data-background="assets/images/restaurant/meat_fish_bg.jpg" style="background-image: url(&quot;assets/images/restaurant/meat_fish_bg.jpg&quot;);">
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
		<section class="module" data-background="assets/images/section-3.jpg" style="background-image: url(&quot;assets/images/section-3.jpg&quot;);">
          <div class="container">
            <div class="row multi-columns-row">
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="count-item mb-sm-40">
                  <div class="count-icon"><span class="icon-wallet"></span></div>
                  <h3 class="count-to font-alt" data-countto="6543">6543</h3>
                  <h5 class="count-title font-serif">Dollars raised for charity</h5>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- Decryption -->
        <section id="Decryption" class="module bg-dark-30 parallax-bg restaurant-menu-bg" data-background="assets/images/restaurant/meat_fish_bg.jpg" style="background-image: url(&quot;assets/images/restaurant/meat_fish_bg.jpg&quot;);">
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
        <section class="module" data-background="assets/images/section-3.jpg" style="background-image: url(&quot;assets/images/section-3.jpg&quot;);">
          <div class="container">
            <div class="row multi-columns-row">
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="count-item mb-sm-40">
                  <div class="count-icon"><span class="icon-wallet"></span></div>
                  <h3 class="count-to font-alt" data-countto="6543">6543</h3>
                  <h5 class="count-title font-serif">Dollars raised for charity</h5>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- Drive -->
        <section id="Drive" class="module bg-dark-30 parallax-bg restaurant-menu-bg" data-background="assets/images/restaurant/meat_fish_bg.jpg" style="background-image: url(&quot;assets/images/restaurant/meat_fish_bg.jpg&quot;);">
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
        <section class="module" data-background="assets/images/section-3.jpg" style="background-image: url(&quot;assets/images/section-3.jpg&quot;);">
          <div class="container">
            <div class="row multi-columns-row">
              <div class="col-sm-6 col-md-3 col-lg-3">
                <div class="count-item mb-sm-40">
                  <div class="count-icon"><span class="icon-wallet"></span></div>
                  <h3 class="count-to font-alt" data-countto="6543">6543</h3>
                  <h5 class="count-title font-serif">Dollars raised for charity</h5>
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
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About</h5>
                  <p>2019년 개인프로젝트 실습, 나만의 암호화/복호화 서비</p>
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
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
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