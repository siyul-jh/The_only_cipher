package poly.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.NoticeDTO;
import poly.persistance.mapper.NoticeMapper;
import poly.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{
	
	@Resource(name = "NoticeMapper")
	private NoticeMapper noticeMapper;

	@Override
	public List<NoticeDTO> getNoticeList(HashMap<String, Integer> hMap) throws Exception {
		return noticeMapper.getNoticeList(hMap);
	}

	@Override
	public NoticeDTO getNoticeDetail(String Notice_seq) throws Exception {
		return noticeMapper.getNoticeDetail(Notice_seq);
	}

	@Override
	public int deleteNoticeDTO(String Notice_seq) throws Exception {
		return noticeMapper.deleteNoticeDTO(Notice_seq);
	}

	@Override
	public int updateNotice(NoticeDTO nDTO) throws Exception {
		System.out.println(nDTO.getNotice_seq());
		return noticeMapper.updateNotice(nDTO);
	}

	@Override
	public int insertNoticeDTO(NoticeDTO nDTO) throws Exception {
		return noticeMapper.insertNoticeDTO(nDTO);
	}
	
	@Override
	public int getNoticeListTotalCount() throws Exception {
		return noticeMapper.getNoticeListTotalCount();
	}
}
