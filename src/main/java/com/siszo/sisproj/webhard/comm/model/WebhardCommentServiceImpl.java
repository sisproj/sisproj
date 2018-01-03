package com.siszo.sisproj.webhard.comm.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebhardCommentServiceImpl implements WebhardCommentService{
	
	@Autowired
	private WebhardCommentDAO wcDao;

	@Override
	public int insertWebComment(WebhardCommentVO wcVo) {
		return wcDao.insertWebComment(wcVo);
	}

	@Override
	public List<WebhardCommentVO> selectWebComment(int webNo) {
		return wcDao.selectWebComment(webNo);
	}

	@Override
	public int webCommCnt(int webNo) {
		return wcDao.webCommCnt(webNo);
	}

	@Override
	public int updateWebComment(WebhardCommentVO wcVo) {
		return wcDao.updateWebComment(wcVo);
	}

	@Override
	public int deleteWebComment(int commNo) {
		return wcDao.deleteWebComment(commNo);
	}
}
