<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="poly.util.CmmUtil" %>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO"%>
<!DOCTYPE html>
<html dir="ltr">
<head>
<meta charset="utf-8">
<title>The Only Cipher Admin</title>
<meta name="description"content="Firely is a one page comming soon template using Parallax, HTML5, CSS3 and PHP">
<meta name="author" content="Memories Dust">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- Default stylesheets-->
<link href="/css/home_css/bootstrap.min.css" rel="stylesheet">
<!-- Template specific stylesheets-->
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
<link href="../css/home_css/animate.css" rel="stylesheet">
<link href="../css/home_css/font-awesome.min.css" rel="stylesheet">
<link href="../css/home_css/et-line-font.css" rel="stylesheet">
<link href="../css/home_css/flexslider.css" rel="stylesheet">
<link href="../css/home_css/owl.carousel.min.css" rel="stylesheet">
<link href="../css/home_css/owl.theme.default.min.css" rel="stylesheet">
<link href="../css/home_css/magnific-popup.css" rel="stylesheet">
<link href="../css/home_css/simpletextrotator.css" rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="../css/home_css/style.css" rel="stylesheet">
<link href="../css/home_css/custom.css" rel="stylesheet">
<link id="color-scheme" href="../css/home_css/default.css" rel="stylesheet">
<link href="../css/home_css/fileupload_download.css" rel="stylesheet">
<link href="../css/home_css/fileupload_download.css" rel="stylesheet">
<!-- icon -->
<link rel="apple-touch-icon" sizes="57x57" href="/images/favicon.ico">
<link rel="apple-touch-icon" sizes="60x60" href="/images/favicon.ico">
<link rel="apple-touch-icon" sizes="72x72" href="/images/favicon.ico">
<link rel="apple-touch-icon" sizes="76x76" href="/images/favicon.ico">
<link rel="apple-touch-icon" sizes="114x114" href="/images/favicon.ico">
<link rel="apple-touch-icon" sizes="120x120" href="/images/favicon.ico">
<link rel="apple-touch-icon" sizes="144x144" href="/images/favicon.ico">
<link rel="apple-touch-icon" sizes="152x152" href="/images/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="/images/favicon.ico">
<link rel="icon" type="image/png" sizes="192x192"  href="/images/favicon.ico">
<link rel="icon" type="image/png" sizes="32x32" href="/images/favicon.ico">
<link rel="icon" type="image/png" sizes="96x96" href="/images/favicon.ico">
<link rel="icon" type="image/png" sizes="16x16" href="/images/favicon.ico">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/images/favicon.ico">
<meta name="theme-color" content="#ffffff">
<script src="../js/home_js/jquery.js"></script>
<script src="../js/home_js/admin_list.js"></script>
<%
	String user_id = CmmUtil.nvl((String) session.getAttribute("user_id"));
	String user_name = CmmUtil.nvl((String) session.getAttribute("user_name"));
	String user_mail = CmmUtil.nvl((String) session.getAttribute("user_mail"));
	String extension = CmmUtil.nvl((String) session.getAttribute("extension"));
	if (!user_id.equals("admin")) {
		response.sendRedirect("/index.do");
	}
	List<UserDTO> uList =	(List<UserDTO>)request.getAttribute("uList");
	//게시판 조회 결과 보여주기
	if (uList==null){
		uList = new ArrayList<UserDTO>();
	}
%> 
<script type="text/javascript">
$(document).ready(function(){
    //최상단 체크박스 클릭
	$(document).on( "click", "#activeall", function(){
        if($("#activeall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=active]").prop("checked",true);
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=active]").prop("checked",false);
        }
    })
})
</script>
</head>
<style>
.text-black {
	color: black;
	text-align: center;
}
.button-black:hover, .button-black2:hover {
    background-color: #fff;
    border: 2px solid #049dd9;
	color: #049dd9;
}
.button-black {
	border-radius: 3px;
    overflow: hidden;
    border: none;
    background-color: #0ba1b5;
    color: #fff;
    padding: 6px 30px;
}
.button-black2 {
	border-radius: 3px;
    overflow: hidden;
    border: none;
    background-color: #0ba1b5;
    color: #fff;
    padding: 6px 30px;
    border: 2px solid #049dd9;
}
.title {
	background-color:#0ba1b515;
	border-radius: 3px;
	margin-bottom: 10px;
}
.selectAll {
	margin-bottom: 20px;
}

/* Hide the checkbox/radio. We will simulate it later using label */
input[type=checkbox], input[type=radio] {
    opacity: 0;
    position: absolute;
    display: none;
}

/* Some basic styling for alignment and more */
input[type=checkbox], input[type=checkbox] + label, input[type=radio], input[type=radio] + label {
    display: inline-block;
    vertical-align: middle;
    cursor: pointer;
    user-select: none;
}

/* CSS Pseudo class "before" to show checkbox/radio box. Will be attached to every label adjacent to input checkbox.*/
input[type=checkbox] + label:before, input[type=radio] + label:before {
    font-family: 'FontAwesome';
    display: inline-block;
    vertical-align: middle;
    width: 20px;
    height: 20px;
    text-align: center;
    font-size: 12px;
    color: #dcdcdc;
    transition: color .4s;
    border: 1px solid #0ba1b5;
}

/* Tick inside checkbox. I am using Font-awesome's tick, but you can use plain unicode tick */
/* or any other symbol you want. */
input[type=checkbox] + label:before {
    content: '\f00c';
    border-radius: 2px;
}

/* Circle inside radio circle. Border-radius to make it a circle. */
input[type=radio] + label:before {
    content: '\f111';
    border-radius: 50%;
}

/* Styles when checkbox/radio is checked */
input:checked + label:before {
    background: #0ba1b5;
    color: #FFF;
}

/* Styles when checkbox/radio is disabled  */
input[type=checkbox][disabled] + label:before, input[type=radio][disabled] + label:before {
    color: #d0d0d0;
    background: #bfbfbf;
    border: 1px solid #656b64;
}

</style>
<script type="text/javascript">

</script>

<body>
<div class="faq">
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
					<li><a href="../home.do">Home</a></li>
					<li><a class="section-scroll" href="#List">User List</a></li>
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
	 <div class="main">
	 <!-- User List -->
	<section id="List" class="module bg-dark-30 parallax-bg restaurant-menu-bg" data-background="../images/bg_admin.jpg" style="background-image: url(../images/bg_admin.jpg);">
	  <div class="container">
	    <div class="row">
	      <div class="col-sm-2 col-sm-offset-5">
	        <div class="alt-module-subtitle"><span class="holder-w"></span>
	          <h5 class="font-serif">사용자 목록</h5><span class="holder-w"></span>
	        </div>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-sm-8 col-sm-offset-2">
	        <h2 class="module-title font-alt mb-0">User List</h2>
	      </div>
	    </div>
	  </div>
	</section>
	<section class="module">
	  <div class="container">
	    <div class="row multi-columns-row">
	      <div class="col-sm-12 col-md-12 col-lg-12">
	        <div class="count-item mb-sm-40">
				<div class="row multi-columns-row selectAll">
					<!-- <div class="col-sm-2"> 
						<a class="button-black2" href="javascript:void(0);">선택 비활성화</a>
					</div> -->
				</div>
					<div>
						<div style="width:100%">
							<div class="col-sm-12 title">
								<div class="col-sm-1 text-black"><h5><input type="checkbox" name="activeall" id="activeall"><label for='my-checkbox-bg' ></label ></h5></div>
								<div class="col-sm-2 text-black"><h5>아이디</h5></div>
								<div class="col-sm-2 text-black"><h5>닉네임</h5></div>
								<div class="col-sm-2 text-black"><h5>이메일</h5></div>
								<div class="col-sm-1 text-black"><h5>소셜</h5></div>
								<div class="col-sm-2 text-black"><h5>상태</h5></div>
								<div class="col-sm-2 text-black"><h5>수정</h5></div>
								</div>
								<%
								for (int i=0;i<uList.size();i++){
									UserDTO uDTO = uList.get(i);
									if (uDTO==null){
										uDTO = new UserDTO();
									}
								%>
								<form action="/admin/admin_userDisable.do">
									<div class="col-sm-12">
										<div class="col-sm-1 text-black"><p><input type="checkbox" class="active" name="active"><label for='my-checkbox-bg' ></label ></p></div>
										<div class="col-sm-2 text-black"><p><%=CmmUtil.nvl(uDTO.getUser_id())%></p></div>
										<div class="col-sm-2 text-black"><p><%=CmmUtil.nvl(uDTO.getUser_name())%></p></div>
										<div class="col-sm-2 text-black"><p><%=CmmUtil.nvl(uDTO.getUser_mail())%></p></div>
										<div class="col-sm-1 text-black"><p><%
										if(CmmUtil.nvl(uDTO.getExtension()).equals("admin")) { %>
											관리자
										<% } else if (CmmUtil.nvl(uDTO.getExtension()).equals("google")) { %>
											구글
										<% } else if (CmmUtil.nvl(uDTO.getExtension()).equals("kakao")) { %>
											카카오
										<% } %>
										</p></div>
										<div class="col-sm-2 text-black"><p><%
										if(CmmUtil.nvl(uDTO.getActive()).equals("y")) { %>
											활성화
										<% } else if (CmmUtil.nvl(uDTO.getActive()).equals("n")) {%>
											비활성화
										<% } %>
										</p></div>
										<div style="display:none;">
										<input type="hidden" name="user_id" value="<%=CmmUtil.nvl(uDTO.getUser_id())%>"/>
										<input type="hidden" name="user_name" value="<%=CmmUtil.nvl(uDTO.getUser_name())%>"/>
										<input type="hidden" name="user_mail" value="<%=CmmUtil.nvl(uDTO.getUser_mail())%>"/>
										<input type="hidden" name="extension" value="<%=CmmUtil.nvl(uDTO.getExtension())%>"/>
										<input type="hidden" name="active" value="<%=CmmUtil.nvl(uDTO.getActive())%>"/>
										</div>
										<%if(CmmUtil.nvl(uDTO.getActive()).equals("y")){ %>
											<div class="col-sm-2 text-black"><input type="submit" class="button-black" value="비활성화"></div>
										<% } else if(CmmUtil.nvl(uDTO.getActive()).equals("n")){ %>
											<div class="col-sm-2 text-black"><input type="submit" class="button-black" value="활성화"></div>
										<%} %>
									</div>
								</form>
								<%
								}
								%>
						</div>
					</div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	<hr class="divider-w">
	</div>
	
	<div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
</div>
  <!--  JavaScripts -->

<script src="../js/home_js/bootstrap.min.js"></script>
<script src="../js/home_js/wow.js"></script>
<script src="../js/home_js/jquery.mb.YTPlayer.js"></script>
<script src="../js/home_js/isotope.pkgd.js"></script>
<script src="../js/home_js/imagesloaded.pkgd.js"></script>
<script src="../js/home_js/jquery.flexslider.js"></script>
<script src="../js/home_js/owl.carousel.min.js"></script>
<script src="../js/home_js/smoothscroll.js"></script>
<script src="../js/home_js/plugins.js"></script>
<script src="../js/home_js/main.js"></script>
<script src="../js/home_js/custom.js"></script>

<script src="../js/home_js/jquery.magnific-popup.js"></script>
<script src="../js/home_js/jquery.simple-text-rotator.min.js"></script>
</body>
</html>