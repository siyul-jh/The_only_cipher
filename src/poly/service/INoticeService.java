package poly.service;

import java.util.HashMap;
import java.util.List;

import poly.dto.NoticeDTO;

public interface INoticeService {
	public List<NoticeDTO> getNoticeList(HashMap<String, Integer> hMap) throws Exception;
	public List<NoticeDTO> getNoticeDetail(NoticeDTO nDTO) throws Exception;
	public int noticeDelete(String notice_seq) throws Exception;
	public int noticeoModify(NoticeDTO nDTO) throws Exception;
	public int insertNoticeDTO(NoticeDTO nDTO) throws Exception;
	public int getNoticeListTotalCount() throws Exception;
	public int NoticeCount(String noticeNo) throws Exception;
}
