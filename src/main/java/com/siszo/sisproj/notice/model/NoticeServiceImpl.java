package com.siszo.sisproj.notice.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.common.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	private static final Logger logger
	=LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	private NoticeDAO noticeDao;
	
	@Override
	public int insertNotice(NoticeVO vo) {
		return noticeDao.insertNotice(vo);
	}

	@Override
	public List<NoticeVO> selectAll(SearchVO searchVo) {
		return noticeDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecordCount(SearchVO searchVo) {
		return noticeDao.selectTotalRecordCount(searchVo);
	}

	@Override
	public NoticeVO selectByNo(int notiNo) {
		return noticeDao.selectByNo(notiNo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return noticeDao.updateNotice(vo);
	}

	@Override
	public int deleteNotice(int notiNo) {
		return noticeDao.deleteNotice(notiNo);
	}

	@Override
	public int updateReadCount(int notiNo) {
		return noticeDao.updateReadCount(notiNo);
	}

	@Override
	public int updateDownCount(int notiNo) {
		return noticeDao.updateDownCount(notiNo);
	}
	
	
	
/*	@Override
	public int deleteNotice(NoticeVO vo) {
		return noticeDao.deleteNotice(vo);
	}
*/
	
}
