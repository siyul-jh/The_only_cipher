<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 로그인 -->
	<div id="modal_custom_sign_in" class="modal_custom">
		<div class="container">
				<div class="one">
					<h2>Sign in</h2>
					<a id="modal-close_sign_ip" class="modal_custom_custom-close" href="#"><i class="fa fa-home"></i></a>
				</div>
			 <form method="post" action="/action/Sign_in.do"name="newsletterform" id="newsletterform">
				<div class="one">
					<div class="newsletter">
						<h3>E-mail</h3>
						<fieldset>
							<input name="user_id" type="text" id="sign_in_email"placeholder="Please enter your email" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<h3>Password</h3>
						<fieldset>
							<div id="forget_pw"><a href="#" id="modal_reset-pw">Forgot Password?</a></div>
							<input name="user_pw" type="password" id="sign_in_pw"placeholder="Please enter your Password" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<fieldset>
							<button type="submit" class="black_button" id="sign_in_submit">Sign in</button>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 비밀번호 찾기 -->
	<div id="modal_custom_reset-pw" class="modal_custom">
		<div class="container">
				<div class="one">
					<h2>Reset your password</h2>
					<a id="modal-close_reset-pw" class="modal_custom_custom-close" href="#"><i class="fa fa-home"></i></a>
				</div>
			 <form method="post" action="/action/reset-pw.do"name="newsletterform" id="newsletterform">
				<div class="one">
					<div class="newsletter">
						<h3>Enter your email address and we will send you a link to reset your password.</h3>
						<fieldset>
							<input name="user_id" type="text" id="reset-pw_email"placeholder="Please enter your email" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<fieldset>
							<button type="submit" class="black_button" id="reset-pw">Send password reset email</button>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 회원가입 -->
	<div id="modal_custom_sign_up" class="modal_custom">
		<div class="container">
			<div class="one">
				<h2>Sign up</h2>
				<a id="modal-close_sign_up" class="modal_custom_custom-close" href="#"><i class="fa fa-home"></i></a>
			</div>
			<form method="post" action="/action/Sign_up.do" name="newsletterform" id="newsletterform">
				<div class="one">
					<div class="newsletter">
						<h3>E-mail</h3>
						<fieldset>
							<input name="user_id" type="text" id="sign_up_email" placeholder="Please enter your email" />
							<button id="Sign_Check"type="button" class="black_button">Sign Check</button>
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<h3>Password</h3>
						<fieldset>
							<input name="user_pw" type="password" id="sign_up_pw"placeholder="Please enter your Password / 8 to 16 Length" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<h3>Phone Number</h3>
						<fieldset>
							<input name="user_phone" type="tel" id="sign_up_tel"placeholder="Please enter your Phone Number" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<h3>Year / May / Date</h3>
						<fieldset>
							<input name="user_date" type="date" id="sign_up_date"placeholder="Please enter your Date" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<fieldset>
							<button type="submit" class="black_button" id="sign_up_submit">Sign up</button>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>
	