package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
			PagingDTO paging = new PagingDTO();
			int pagenum = 0;
			int contentnum = 4;
			if (CmmUtil.nvl(request.getParameter("pagenum")).equals("") || Integer.parseInt(request.getParameter("pagenum")) == 0 || Integer.parseInt(request.getParameter("pagenum")) == 1)  {
				pagenum = 1;
			} else {
				pagenum =Integer.parseInt(request.getParameter("pagenum"));
			}
			
			int totalCount = noticeService.getNoticeListTotalCount();
			paging.setTotalcount(totalCount);//전체 게시글 지정
			paging.setPagenum(pagenum-1);// 현재페이지를 페이지 객체에 지정한다 -1 해야 쿼리에서 사용가능
			paging.setContentnum(contentnum);// 현재페이지를 페이지 객체에 지정한다 -1 해야 쿼리에서 사용가능
			paging.setCurrentblock(pagenum);//현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정함
			paging.setLastblock(paging.getTotalcount());//마지막 블록 번호를 전체 게시글 수를 통해 정함
			paging.setStartPage(paging.getCurrentblock());//시작페이지를 페이지 블록번호로 정함
			paging.setEndPage(paging.getLastblock(), paging.getCurrentblock());//마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록번호로 정함
			paging.prevnext(pagenum); //현재 페이지 번호로 화살표를 나타낼지 정함
						
			List<NoticeDTO> rList = new ArrayList<>();
			int i = paging.getPagenum()*4;
			int j = paging.getContentnum();
			HashMap<String, Integer> hMap = new HashMap<>();
			HashMap<String, Object> sMap = new HashMap<>();
			hMap.put("pagenum",i);
			hMap.put("contentnum", j);
			rList = noticeService.getNoticeList(hMap);
			// 페이징 정보 전달.
			if (rList == null) {
				rList = new ArrayList<NoticeDTO>();
			}
			for(int r = 0; r < rList.size(); r++) {
				String ReXSS_Title = getReXSS(rList.get(r).getTitle());
				rList.get(r).setTitle(ReXSS_Title);
			}
			sMap.put("rList", rList);
			sMap.put("paging", paging);

			rList = null;
			paging=null;
			return sMap;
		}
	
	// 게시글 상세정보
	@RequestMapping(value = "/home/NoticeDetail")
	public @ResponseBody HashMap<String, Object> NoticeDetail(HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("NoticeDetail");
		String notice_seq = CmmUtil.nvl(request.getParameter("notice_seq"));
		Object user_id = session.getAttribute("user_id");
		HashMap<String, Object> sMap = new HashMap<>();
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_seq(notice_seq);
		List<NoticeDTO> cList = noticeService.getNoticeDetail(nDTO);
		for(int i = 0; i < cList.size(); i++) {
			String ReXSS_Title = getReXSS(cList.get(i).getTitle());
			String ReXSS_Contents = getReXSS(cList.get(i).getContents());
			cList.get(i).setTitle(ReXSS_Title);
			cList.get(i).setContents(ReXSS_Contents);
		}
		sMap.put("cList",cList);
		sMap.put("user_id", user_id);
		return sMap;
	}
	// 게시글 작성
	@RequestMapping(value = "/NoticeAdd", method = RequestMethod.POST)
	public String insertBoard(String editor,HttpServletRequest request, Model model) throws Exception {
		String title = request.getParameter("title");
		String yn = request.getParameter("yn");
		String contents = request.getParameter("contents");
		String user_id = "admin";

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
	// 게시글 수정
	@RequestMapping(value = "/NoticeoModify", method = RequestMethod.POST)
	public String NoticeoModify(HttpServletRequest request, Model model) throws Exception {
		String Notice_seq = request.getParameter("notice_seq");
		String title = request.getParameter("title");
		String yn = request.getParameter("yn");
		String contents = request.getParameter("contents");

		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_seq(Notice_seq);
		nDTO.setTitle(title);
		nDTO.setNotice_yn(yn);
		nDTO.setContents(contents);

		int result = noticeService.noticeoModify(nDTO);
		String msg ="";
		String url = "/home.do";
		if (result != 0) {
			msg = "수정하였습니다.";
		} else {
			msg = "수정 하지못하였습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
	// 게시글 삭제
	@RequestMapping(value = "/NoticeoDelete", method = RequestMethod.POST)
	public String NoticeoDelete(HttpServletRequest request, Model model) throws Exception {
		String notice_seq = request.getParameter("notice_seq");
		int result = noticeService.noticeDelete(notice_seq);
		String msg = "";
		String url = "/home.do";
		if (result != 0) {
			msg = "삭제하였습니다.";
		} else {
			msg = "삭제하지 못하였습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/Source/alert";
	}
	
	//XSS 처리된 텍스트들을 돌림
    public String getReXSS(String value) {
		value = value.replaceAll("& lt;" , "<");
		value = value.replaceAll("& gt;" , ">");
		value = value.replaceAll("& #40;", "(");
		value = value.replaceAll("& #41;", ")");
		value = value.replaceAll("& #39;", "'");
		value = value.replaceAll("& #star;", "'");
		value = value.replaceAll("\\\"\\\"", "[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']");
		value = value.replaceAll("& #scp;", "script");
		return value;
	}
}
