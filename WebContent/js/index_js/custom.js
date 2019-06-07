/*----------------------------------------------------------------------------*/
/*	1.	Sign up
/*----------------------------------------------------------------------------*/
var getMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 유효성 검사
var getPw = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
var getPhone = /^\d{3}-\d{3,4}-\d{4}$/; //전화번호 유효성 검사
var idchk = 0;

$('#Sign_Check').click(function () {
var User_id = $('#sign_up_email').val();
	if(User_id=="") {
		alert("아이디를 입력해주세요.")
		return false;
	}
  if(User_id.match(getMail) == null){
      alert("이메일형식에 맞춰 정확하게 작성하여주세요.");
      $('#sign_up_email').val("");
      $('#sign_up_email').focus();
      return false;
    }
	$.ajax({
		url:'/action/idChk.do',//요청할 주소 값
		method : 'post',			// Get or Post
		data : { 'User_id' : User_id },		// 서버에 넘길 Parameter (2개 이상은 배열)
		success : function(data) {		// 응답 성공 시 값이 반환 되는 곳 (반환 된 값 = data)
			if(data==0) {
				//중복 없음
				alert("사용 가능한 아이디 입니다.")
				idchk = 1;
			} else {
				//중복 있음
				alert("중복된 아이디 입니다.")
				$('#sign_up_email').val('');
			}
		}
	});
});

$('#sign_up_submit').click(function () {
	var pw = $('#sign_up_pw').val();
	var tel = $('#sign_up_tel').val();
	var date = $('#sign_up_date').val();
	if(idchk != 1 ) {
		alert("아이디 중복확인을 해주세요.");
		return false;
	}
	if (pw == null) {
		alert("비밀번호를 확인해주세요.");
		$('#sign_up_pw').focus();
		return false;
	} else if(pw.match(getPw) == null) {
		alert("특수문자를 포함한 8자 이상 16자 이하의 비밀번호를 입력해주세요.");
		$('#sign_up_pw').val("");
		$('#sign_up_pw').focus();
		return false;
	}
	if(tel.match(getPhone) == null){
		alert("휴대폰 번호 형식에 맞게 입력해주세요")
		$('#sign_up_tel').val("");
		$('#sign_up_tel').focus();
		return false;
	}
	if(date == null){
		alert("생년월일을 입력해주세요.")
		$('#sign_up_date').val("");
		$('#sign_up_date').focus();
		return false;
	}
})
/*----------------------------------------------------------------------------*/
/*	2. Sign in
/*----------------------------------------------------------------------------*/
$('#sign_in_submit').click(function () {
	var User_id = $('#sign_in_email').val();
	var User_pw = $('#sign_in_pw').val();
	if(User_id=="") {
		alert("아이디를 입력해주세요.")
		return false;
	}
	if(User_pw=="") {
		alert("비밀번호를 입력해주세요.")
		return false;
	}
	if(User_id.match(getMail) == null && User_id != "admin"){
		alert("이메일형식에 맞춰 정확하게 작성하여주세요.");
		$('#sign_up_email').val("");
		$('#sign_up_email').focus();
		return false;
	}
});
/*----------------------------------------------------------------------------*/
/*	3. Forgot Password
/*----------------------------------------------------------------------------*/
/*$.ajax({
	url: "/home/NoticeList.do",
	type: "POST",
	data : {
		'pagenum' : pagenum
	},
	success: function(data){
		
		//$("#paging").html(paging);
	}
});*/
