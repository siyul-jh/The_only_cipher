package poly.service;

import java.util.HashMap;
import java.util.List;

import poly.dto.NoticeDTO;

public interface INoticeService {
	public List<NoticeDTO> getNoticeList(HashMap<String, Integer> hMap) throws Exception;
	public NoticeDTO getNoticeDetail(String Notice_seq) throws Exception;
	public int deleteNoticeDTO(String Notice_seq) throws Exception;
	public int updateNotice(NoticeDTO nDTO) throws Exception;
	public int insertNoticeDTO(NoticeDTO nDTO) throws Exception;
	public int getNoticeListTotalCount() throws Exception;
}
