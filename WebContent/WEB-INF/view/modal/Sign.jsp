<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 로그인 -->
	<div id="modal_custom_sign_in" class="modal_custom">
		<div class="container">
				<div class="one">
					<h2>Sign in</h2>
					<a id="modal-close_sign_up" class="modal_custom_custom-close" href="#"><i class="fa fa-home"></i></a>
				</div>
			 <form method="post" action="javascript:void(0)"name="newsletterform" id="newsletterform">
				<div class="one">
					<div class="newsletter">
						<h3>E-mail</h3>
						<fieldset>
							<input name="email" type="text" id="email"placeholder="Please enter your email" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<h3>Password</h3>
						<fieldset>
							<input name="password" type="password" id="password"placeholder="Please enter your Password" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<p><a href="#">아이디 찾기</a>&nbsp;&nbsp;<a href="#">비밀번호 찾기</a></p>
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
	<!-- 회원가입 -->
	<div id="modal_custom_sign_up" class="modal_custom">
		<div class="container">
			<div class="one">
				<h2>Sign up</h2>
				<a id="modal-close_sign_up" class="modal_custom_custom-close" href="#"><i class="fa fa-home"></i></a>
			</div>
			<form method="post" action="javascript:void(0)"name="newsletterform" id="newsletterform">
				<div class="one">
					<div class="newsletter">
						<h3>E-mail</h3>
						<fieldset>
							<input name="email" type="text" id="email"placeholder="Please enter your email" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<h3>Password</h3>
						<fieldset>
							<input name="password" type="password" id="password"placeholder="Please enter your Password" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<h3>Phone Number</h3>
						<fieldset>
							<input name="tel" type="tel" id="tel"placeholder="Please enter your Phone Number" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<h3>Year / May / Date</h3>
						<fieldset>
							<input name="date" type="date" id="date"placeholder="Please enter your Date" />
						</fieldset>
					</div>
				</div>
				<div class="one">
					<div class="newsletter">
						<fieldset>
							<button type="submit" class="black_button">Sign up</button>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>
	