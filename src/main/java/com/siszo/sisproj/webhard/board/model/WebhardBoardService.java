package com.siszo.sisproj.webhard.board.model;

import java.util.List;

import com.siszo.sisproj.webhard.common.WebhardSearchVO;

public interface WebhardBoardService {
	public int insertWebBoard(WebhardBoardVO wbVo);
	public WebhardBoardVO selectWebBoardByWebNo(int webNo);
	public List<WebhardBoardVO> selectWebBoardList(WebhardSearchVO searchVo);
	public int cntWebBoardList(WebhardSearchVO searchVo);
	public int updateWebBoard(WebhardBoardVO wbVo);
	public int deleteWebBoard(int webNo);
}
