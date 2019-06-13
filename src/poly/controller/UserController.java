package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class UserController {
	@Resource(name = "UserService")
	private IUserService userService;
	// 관리자 로그인 화면
	@RequestMapping(value="admin")
	public String admin(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		return "/admin";
	}
	// 관리자 로그인
	@RequestMapping(value="admin_login")
	public String admin_login (HttpServletRequest request, HttpSession session, Model model) throws Exception {
		String user_id = CmmUtil.nvl(request.getParameter("admin_id").toString());
		String user_mail = CmmUtil.nvl(request.getParameter("admin_mail").toString());
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		uDTO.setUser_mail(user_mail);
		
		session.setAttribute("user_id", uDTO.getUser_id());
		session.setAttribute("user_name", "관리자");
		session.setAttribute("user_mail", uDTO.getUser_mail());
		session.setAttribute("extension", "admin");
				
		String msg = "";
		String url = "/index.do";
		
		UserDTO result = userService.getAdmin(uDTO);
		if (result==null) {
			msg = "관리자 접속을 할 수 없습니다.";
		} else {
			msg = "환영합니다. 관리자 님";
			url = "/home.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
	// 관리자 사용자 리스트
	@RequestMapping(value="admin/admin_userlist")
	public String admin_userlist(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		System.out.println(this.getClass() + "----- admin_userlist -----");
		List<UserDTO> uList = userService.getUserList(); model.addAttribute("uList", uList);
		String url = "/admin_userlist.do"; model.addAttribute("url", url);
		return "/admin/admin_userlist";
	}
	// 관리자 사용자 비활성화
	@RequestMapping(value="admin/admin_userDisable")
	public String admin_userDisable(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		System.out.println(this.getClass() + "----- admin_userlist -----");
		
		String user_id = request.getParameter("user_id"); //비밀번호
		String user_mail = request.getParameter("user_mail"); //이메일
		String extension = request.getParameter("extension"); //전화번호
		String active = request.getParameter("active"); //전화번호
		
		if(active.equals("y")) {
			active="n";
		} else if (active.equals("n")) {
			active="y";
		}
		
		UserDTO uDTO = new UserDTO();
		uDTO.setActive(active);
		uDTO.setUser_id(user_id);
		uDTO.setUser_mail(user_mail);
		uDTO.setExtension(extension);
		int result = userService.userDisable(uDTO);
		String msg = "";
		String url = "";
		if (result==0) {
			msg = "비활성화 하지 못하였습니다.";
			url = "/admin/admin_userlist.do";
		} else {
			msg = "변경되었습니다.";
			url = "/admin/admin_userlist.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
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
		String msg = "로그인에 실패하였습니다.";
		String url = "/index.do";
		//
		if(user_check==null) {
			int insertResult = userService.insertUserDTO(uDTO);
			if (insertResult != 0) {
				// 회원가입이 정상적으로 이루어진 상태
				msg = "회원가입에 성공하였습니다.";
				url = "/home.do";
			} else {
				// 회원가입이 이루어지지 않은 상태
				msg = "회원가입에 실패하였습니다.";
			}
		} else {
			if(uDTO.getActive()=="n") {
				msg = "정지된 사용자입니다.";
			}
			if (user_check != null) {
				// 로그인이 정상적으로 이루어진 상태
				msg = "환영합니다. " +user_name+ "님";
				url = "/home.do";
			}
		}
		//
		session.setAttribute("user_id", uDTO.getUser_id());
		session.setAttribute("user_name", uDTO.getUser_name());
		session.setAttribute("user_mail", uDTO.getUser_mail());
		session.setAttribute("extension", uDTO.getExtension());

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
	// 로그아웃
	@RequestMapping(value="logout")
	public String logout (HttpSession session, Model model) throws Exception {
		session.invalidate();
		String msg = "로그아웃 되었습니다.";
		String url = "/index.do";

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
}
