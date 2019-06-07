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
	@RequestMapping(value="SocialSign")
	public String Sign_in(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		System.out.println("Sign_in");
		
		String user_id = CmmUtil.nvl(request.getParameter("user_id").toString().replaceAll("\"", ""));
		String user_name = CmmUtil.nvl(request.getParameter("user_name").toString().replaceAll("\"", ""));
		String user_mail = CmmUtil.nvl(request.getParameter("user_mail").toString().replaceAll("\"", ""));
		String extension = CmmUtil.nvl(request.getParameter("extension").toString().replaceAll("\"", ""));
		
				
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		uDTO.setUser_name(user_name);
		uDTO.setUser_mail(user_mail);
		uDTO.setExtension(extension);
		UserDTO user_check = userService.getUserLogin(uDTO);
		String msg = "";
		String url = "/index.do";
		//
		if(user_check==null) {
			int insertResult = userService.insertUserDTO(uDTO);
			if (insertResult != 0) {
				// 회원가입이 정상적으로 이루어진 상태
				msg = "회원가입에 성공하였습니다.";
			} else {
				// 회원가입이 이루어지지 않은 상태
				msg = "회원가입에 실패하였습니다.";
			}
		} else {
			if(uDTO.getActive().equals("n")) {
				msg = "정지된 사용자입니다.";
			}
			if (user_check != null) {
				// 로그인이 정상적으로 이루어진 상태
				session.setAttribute("user_id", uDTO.getUser_id());
				session.setAttribute("user_name", uDTO.getUser_name());
				session.setAttribute("user_mail", uDTO.getUser_mail());
				session.setAttribute("extension", uDTO.getExtension());
				msg = "환영합니다. " +user_name+ "님";
				url = "/home.do";
			} else {
				// 로그인이 이루어지지 않은 상태
				msg = "로그인에 실패하였습니다.";
			}
		}
		//
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
