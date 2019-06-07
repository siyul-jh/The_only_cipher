package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class UserController {
	@Resource(name = "UserService")
	private IUserService userService;
	
	// 로그인
	@RequestMapping(value="/action/Sign_in")
	public String Sign_in(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		System.out.println("Sign_in");
		String user_id = request.getParameter("user_id");
		String user_origin_pw = request.getParameter("user_pw");
		
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
				
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		uDTO = userService.getUserLogin(uDTO);
		
		String msg = "";
		String url = "";
		if(!scpwd.matches(user_origin_pw, uDTO.getUser_pw())){
			uDTO = null;
		}

		if (uDTO != null) {
			// 로그인이 정상적으로 이루어진 상태
			msg = "환영합니다. " + user_id.split("@")[0] + "님";
			session.setAttribute("user_id", uDTO.getUser_id());
			url = "/home.do";
		} else {
			// 로그인이 이루어지지 않은 상태
			msg = "로그인에 실패하였습니다.";
			url = "/index.do";
		}
		if(uDTO.getActive().equals("n")) {
			msg = "정지된 사용자입니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
	// 로그아웃
	@RequestMapping(value="/action/logout")
	public String logout (HttpSession session, Model model) throws Exception {
		session.invalidate();
		String msg = "로그아웃 되었습니다.";
		String url = "/index.do";

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
	// 회원가입
	@RequestMapping(value="/action/Sign_up")
	public String Sign_up(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		System.out.println("Sign_up");
		String user_id = request.getParameter("user_id");
		String user_origin_pw = request.getParameter("user_pw");
		String user_phone = request.getParameter("user_phone");
		String user_date = request.getParameter("user_date");
		
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String user_pw = scpwd.encode(user_origin_pw);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		uDTO.setUser_pw(user_pw);
		uDTO.setUser_phone(user_phone);
		uDTO.setUser_date(user_date);
		
		int result = userService.insertUserDTO(uDTO);
		
		String msg = "";
		String url = "";
		
		if (result != 0) {
			// 회원가입이 정상적으로 이루어진 상태
			msg = "회원가입에 성공하였습니다.";
		} else {
			// 회원가입이 이루어지지 않은 상태
			msg = "회원가입에 실패하였습니다.";
		}
		url = "/index.do";
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
	// 아이디 중복확인
	@RequestMapping(value="/action/idChk")
	public @ResponseBody String idChk(@RequestParam(value="User_id") String User_id) throws Exception {
		//ResponseBody를 작성해주어야 javaScript에 return에 값을 넘겨주며 ajax를 사용할 수 있다.
		System.out.println("idChk");
		System.out.println("User_id : " + User_id);
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(CmmUtil.nvl(User_id));
		String idChk = userService.getIdCheck(uDTO);
		return idChk;
	}
	// 비밀번호 초기화 화면
	@RequestMapping(value="/Source/reset_pw")
	public String reset_pw(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		System.out.println("reset_pw");
		return "/Source/reset_pw";
	}
	// 비밀번호 초기화 화면
	@RequestMapping(value="/action/reset-pw")
	public String action(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		System.out.println("action reset_pw");
		
		return "/action/reset_pw";
	}
}
