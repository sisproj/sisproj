package com.siszo.sisproj.bookmark.model;

public interface BookmarkDAO {
	public String selectBookMarkByEmpNo(int empNo);
	public int updateBookMark(BookmarkVO bVo);
}
