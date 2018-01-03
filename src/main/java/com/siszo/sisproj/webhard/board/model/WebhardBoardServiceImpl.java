package com.siszo.sisproj.webhard.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siszo.sisproj.webhard.common.WebhardSearchVO;

@Service
public class WebhardBoardServiceImpl implements WebhardBoardService{
	@Autowired
	private WebhardBoardDAO wbDao;

	@Override
	public int insertWebBoard(WebhardBoardVO wbVo) {
		return wbDao.insertWebBoard(wbVo);
	}

	@Override
	public WebhardBoardVO selectWebBoardByWebNo(int webNo) {
		return wbDao.selectWebBoardByWebNo(webNo);
	}

	@Override
	public List<WebhardBoardVO> selectWebBoardList(WebhardSearchVO searchVo) {
		return wbDao.selectWebBoardList(searchVo);
	}

	@Override
	public int cntWebBoardList(WebhardSearchVO searchVo) {
		return wbDao.cntWebBoardList(searchVo);
	}

	@Override
	public int updateWebBoard(WebhardBoardVO wbVo) {
		return wbDao.updateWebBoard(wbVo);
	}

	@Override
	public int deleteWebBoard(int webNo) {
		return wbDao.deleteWebBoard(webNo);
	}

}
