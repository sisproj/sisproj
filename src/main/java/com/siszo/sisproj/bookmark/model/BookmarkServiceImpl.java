package com.siszo.sisproj.bookmark.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookmarkServiceImpl implements BookmarkService{
	@Autowired
	private BookmarkDAO bDao;

	@Override
	public String selectBookMarkByEmpNo(int empNo) {
		return bDao.selectBookMarkByEmpNo(empNo);
	}

	@Override
	public int updateBookMark(BookmarkVO bVo) {
		return bDao.updateBookMark(bVo);
	}
	
	
}
