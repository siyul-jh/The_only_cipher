package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.UserDTO;
import poly.service.IUserService;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "UserService")
	private IUserService userService;
	
	// 로그인
	@RequestMapping(value="/action/Sign_in")
	public String Sign_in(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		System.out.println("Sign_in");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		System.out.println("user_id : " + user_id);
		System.out.println("user_pw : " + user_pw);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		uDTO.setUser_pw(user_pw);
		
		uDTO = userService.getUserLogin(uDTO);
		
		String msg = "";
		String url = "";

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

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
	// 회원가입
	@RequestMapping(value="/action/Sign_up")
	public String Sign_up(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		System.out.println("Sign_up");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_phone = request.getParameter("user_phone");
		String user_date = request.getParameter("user_date");
		
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
}
