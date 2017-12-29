package com.siszo.sisproj.notice.model;

import java.util.List;

import com.siszo.sisproj.common.SearchVO;

public interface NoticeDAO {
	public int insertNotice(NoticeVO vo);
	public List<NoticeVO> selectAll(SearchVO searchVo);
	public int selectTotalRecordCount(SearchVO searchVo);
	public int updateReadCount(int notiNo);
	public int updateDownCount(int notiNo);
	public NoticeVO selectByNo(int notiNo);
	public int updateNotice(NoticeVO vo);
	public int deleteNotice(int notiNo);
	
/*	public int deleteNotice(NoticeVO vo);*/
	

}
