<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Reset Your Password</title>
<meta name="description"content="Firely is a one page comming soon template using Parallax, HTML5, CSS3 and PHP">
<meta name="author" content="Memories Dust">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1">
<style>
.modal_custom {
    left: 0;
    min-height: 100%;
    position: absolute;
    right: 0;
    top: 0;
    z-index: 997;
    background: #1a6d77;
}
.modal_custom .container {
    padding-top: 62px;
    text-align: center;
    margin: 0 auto;
}
.modal_custom .container .one {
    float: left;
    text-align: center;
    width: 100%;
}
.one {
    margin-bottom: 40px;
}
.modal_custom .container h2 {
    font-size: 28px;
    font-weight: 100;
    color: #fff;
    text-transform: capitalize;
    line-height: 1.5;
    margin-bottom: 40px;
}
form, fieldset{
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-size: 100%;
    vertical-align: baseline;
    background: transparent;
}
.one .newsletter {
    padding: 10px 0px;
    margin-bottom: 0px;
}
.newsletter {
    text-align: center;
    display: block;
    margin-bottom: 60px;
}
.modal_custom .container h3 {
    width: 100%;
    color: #fff;
    line-height: 1.11111;
    margin-bottom: 20px;
    letter-spacing: 0px;
}
.newsletter fieldset {
    margin: 0px auto;
}
input, textarea, select {
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
    font-weight: 300;
    box-sizing: border-box;
}
.newsletter input, .newsletter textarea, .newsletter select {
    text-align: center;
    height: 54px;
    width: 360px;
    padding: 0px 20px;
    background: #222;
    background: rgba(0,0,0,0.55);
    border: none;
    color: #939898;
    border-top-left-radius: 2px;
    border-bottom-left-radius: 2px;
    transition: all .2s linear;
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
}
.black_button {
    border: 0 solid transparent;
    padding: 15px 50px;
    background: black;
    color: #0fc4d3;
}
@media only screen and (max-width: 480px) {
	.modal_custom .container {
	    width: 95%;
	    margin: auto 2.5%;
	}
	.newsletter fieldset {
	    width: 285px;
	}
	.newsletter input, textarea, select {
	    width: 100%;
	}
}
</style>
</head>
<body>
	<div id="modal_custom_reset-pw" class="modal_custom modal-active" style="display: block;">
		<div class="container">
				<div class="one">
					<h2>Reset your password</h2>
				</div>
			 <form method="post" action="/action/reset-pw.do" name="newsletterform" id="newsletterform">
				<div class="one">
					<div class="newsletter">
						<h3>새로운 비밀번호를 작성해주세요.</h3>
						<fieldset>
							<input name="user_id" type="text" id="reset-pw_reset" placeholder="Please enter your New Password">
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<fieldset>
							<button type="submit" class="black_button" id="Reset">Reset Password</button>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>