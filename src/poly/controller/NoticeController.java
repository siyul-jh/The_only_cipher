package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.NoticeDTO;
import poly.dto.PagingDTO;
import poly.service.INoticeService;
import poly.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class NoticeController {

	@Resource(name = "NoticeService")
	private INoticeService noticeService;

	// 게시글 리스트
		@RequestMapping(value = "/home/NoticeList", method=RequestMethod.POST)
		public @ResponseBody HashMap<String, Object>NoticeList(HttpServletRequest request, Model model) throws Exception {
			System.out.println("NoticeList");
			PagingDTO paging = new PagingDTO();
			int pagenum = 0;
			int contentnum = 4;
			if (CmmUtil.nvl(request.getParameter("pagenum")).equals("") || Integer.parseInt(request.getParameter("pagenum")) == 0 || Integer.parseInt(request.getParameter("pagenum")) == 1)  {
				pagenum = 1;
			} else {
				pagenum =Integer.parseInt(request.getParameter("pagenum"));
			}
			System.out.println("pagenum : " + pagenum);
			
			int totalCount = noticeService.getNoticeListTotalCount();
			paging.setTotalcount(totalCount);//전체 게시글 지정
			
			paging.setPagenum(pagenum-1);// 현재페이지를 페이지 객체에 지정한다 -1 해야 쿼리에서 사용가능
			
			paging.setContentnum(contentnum);// 현재페이지를 페이지 객체에 지정한다 -1 해야 쿼리에서 사용가능
			
			paging.setCurrentblock(pagenum);//현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정함
			
			paging.setLastblock(paging.getTotalcount());//마지막 블록 번호를 전체 게시글 수를 통해 정함
			
			paging.setStartPage(paging.getCurrentblock());//시작페이지를 페이지 블록번호로 정함
			
			paging.setEndPage(paging.getLastblock(), paging.getCurrentblock());//마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록번호로 정함
			
			paging.prevnext(pagenum); //현재 페이지 번호로 화살표를 나타낼지 정함
			
			//List<NoticeDTO> rList = noticeService.getNoticeList();
			
			List<NoticeDTO> rList = new ArrayList<>(); 
			int i = paging.getPagenum()*4;
			int j = paging.getContentnum();
			HashMap<String, Integer> hMap = new HashMap<>();
			HashMap<String, Object> sMap = new HashMap<>();
			hMap.put("pagenum",i);
			hMap.put("contentnum", j);
			
			System.out.println("Controller");
			System.out.println("---------------------------------------------------");
			System.out.println("i pagenum : " + i);
			System.out.println("j contentnum : " + j);
			System.out.println("전체 게시물 개수 getTotalcount : " + paging.getTotalcount());
			System.out.println("현재 페이지 번호 getPagenum : " + paging.getPagenum());
			System.out.println("현재페이지블록 getCurrentblock : " + paging.getCurrentblock());
			System.out.println("마지막페이지블록 getLastblock : " + paging.getLastblock());
			System.out.println("현재페이지블록의 시작 페이지 getStartPage : " + paging.getStartPage());
			System.out.println("현재페이지블록의 마지막 페이지 getEndPage : " + paging.getEndPage());
			System.out.println("이전 isPrev : " + paging.isPrev());
			System.out.println("다음 isNext : " + paging.isNext());
			System.out.println("---------------------------------------------------");
			
			rList = noticeService.getNoticeList(hMap);
			// 페이징 정보 전달.
			if (rList == null) {
				rList = new ArrayList<NoticeDTO>();
			}
			sMap.put("rList", rList);
			sMap.put("paging", paging);

			rList = null;
			paging=null;
			return sMap;
		}
	
	// 게시글 상세정보
	@RequestMapping(value = "/home/NoticeDetail")
	public String NoticeDetail(HttpServletRequest request, Model model) throws Exception {
		String Notice_seq = request.getParameter("Notice_seq");
		NoticeDTO nDTO = noticeService.getNoticeDetail(Notice_seq);
		model.addAttribute("nDTO", nDTO);
		return "/home/NoticeDetail";
	}

	// 게시글 삭제
	@RequestMapping(value = "/home/NoticeDetaildel", method = RequestMethod.GET)
	public String NoticeDetaildel(HttpServletRequest request, Model model) throws Exception {

		String Notice_seq = request.getParameter("Notice_seq");
		int result = noticeService.deleteNoticeDTO(Notice_seq);

		String msg = "";
		String url = "";

		if (result != 0) {
			msg = "게시글삭제에 성공하였습니다.";
			url = "/main.do";
		} else {
			msg = "게시글삭제에 실패하였습니다.";
			url = "/main.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/Source/alert";
	}

	// 게시글 작성
	@RequestMapping(value = "/NoticeAdd.do", method = RequestMethod.POST)
	public String insertBoard(String editor,HttpServletRequest request, Model model) throws Exception {
		
		String title = request.getParameter("title");
		String yn = request.getParameter("yn");
		String contents = request.getParameter("contents");
		String user_id = "gihum@naver.com";
		System.out.println("title : " + title);
		System.out.println("yn : " + yn);
		System.out.println("contents : " + contents);

		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setTitle(title);
		nDTO.setNotice_yn(yn);
		nDTO.setContents(contents);
		nDTO.setUser_id(user_id);

		int result = noticeService.insertNoticeDTO(nDTO);

		String msg = "";
		String url = "";

		if (result != 0) {
			msg = "게시글을 작성하였습니다.";
			url = "/home.do";
		} else {
			msg = "게시글을 작성하지 못하였습니다.";
			url = "/home.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//return "redirect:/fileUpload.do";
		return "/Source/alert";
	}

	// 게시글 수정화면
	@RequestMapping(value = "notice/NoticeUpdateView", method = RequestMethod.GET)
	public String NoticeUpdateView(HttpServletRequest request, Model model) throws Exception {
		String Notice_seq = request.getParameter("Notice_seq");
		NoticeDTO nDTO = noticeService.getNoticeDetail(Notice_seq);
		model.addAttribute("nDTO", nDTO);
		return "/notice/NoticeUpdateView";
	}

	// 게시글 수정
	@RequestMapping(value = "notice/NoticeUpdateProc", method = RequestMethod.POST)
	public String NoticeUpdateProc(HttpServletRequest request, Model model) throws Exception {
		String Notice_seq = request.getParameter("Notice_seq");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");

		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_seq(Notice_seq);
		nDTO.setTitle(title);
		nDTO.setContents(contents);

		int result = noticeService.updateNotice(nDTO);

		if (result != 0) {
			return "redirect:/main.do";
		} else {
		}
		String msg = "수정 실패";
		String url = "notice/NoticeUpdateView.do?Notice_seq=" + Notice_seq;
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/alert";
	}
}
