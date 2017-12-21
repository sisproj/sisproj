package com.siszo.sisproj.notice.model;

import java.util.List;

import com.siszo.sisproj.common.SearchVO;

public interface NoticeDAO {
	public int insertNotice(NoticeVO vo);
	public List<NoticeVO> selectAll(SearchVO searchVo);
	public int selectTotalRecordCount(SearchVO searchVo);
	
}
