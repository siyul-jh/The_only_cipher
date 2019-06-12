<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>The Only Cipher Admin</title>
<meta name="description"content="Firely is a one page comming soon template using Parallax, HTML5, CSS3 and PHP">
<meta name="author" content="Memories Dust">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ include file = "Source/index_topCss.jsp" %>
</head>
<body>
	<div id="modal_custom_reset-pw" class="modal_custom modal-active" style="display: block;">
		<div class="container">
				<div class="one">
					<h2>Admin Sign in</h2>
				</div>
			 <form method="post" action="/admin_login.do" name="newsletterform" id="newsletterform">
				<div class="one">
					<div class="newsletter">
						<h3>관리자 계정</h3>
						<fieldset>
							<input name="admin_id" type="text" id="admin_id" placeholder="Please enter Admin Id">
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<h3>관리자 이메일</h3>
						<fieldset>
							<input name="admin_mail" type="text" id="admin_mail" placeholder="Please enter Admin Email">
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<fieldset>
							<button type="submit" class="black_button">Sign in</button>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>