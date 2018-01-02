package com.siszo.sisproj.bookmark.model;

public interface BookmarkService {
	// 북마크 플래그
	public static final int ADDR_BOOK = 2; // 주소록
	public static final int SCHEDULER = 3; // 스케쥴관리
	public static final int RESOURCES = 4; // 자원관리
	public static final int CONFIRM = 5; // 전자 결재
	public static final int COMMUE = 6; // 근태 현황
	public static final int WEBHARD = 7; // 웹하드
	public static final int NOTICE = 8; // 공지 사항
	public static final int NEWS = 9; // 뉴스 홈
	
	//북마크 플래그 str
	public static final String STR_ADDR_BOOK = "주소록";
	public static final String STR_SCHEDULER = "스케쥴";
	public static final String STR_RESOURCES = "자원관리";
	public static final String STR_CONFIRM = "전자 결재";
	public static final String STR_COMMUE = "근태 현황";
	public static final String STR_WEBHARD = "웹하드";
	public static final String STR_NOTICE = "공지 사항";
	public static final String STR_NEWS = "뉴스 홈";
	
	//북마크 플래그당 해당 아이콘
	public static final String ICON_ADDR_BOOK = "<i class='fa fa-phone'></i>";
	public static final String ICON_SCHEDULER = "<i class='fa fa-calendar-check-o'></i>";
	public static final String ICON_RESOURCES = "자원관리 fa아이콘";
	public static final String ICON_CONFIRM = "<i class='fa fa-book'></i>";
	public static final String ICON_COMMUE = "<i class='fa fa-clock-o'></i>";
	public static final String ICON_WEBHARD = "<i class='fa fa-floppy-o'></i>";
	public static final String ICON_NOTICE = "<i class='fa fa-bullhorn'></i>";
	public static final String ICON_NEWS = "<i class='fa fa-newspaper-o'></i>";
	
	//북마크 됨
	public static final String NO_BOOK = "nobook"; //북마크 off
	public static final String BOOKMARK = "bookmark"; //북마크 on
	
	//북마크에 해당하는 주소
	public static final String URL_ADDR_BOOK = "/addrBook/addrBookList.do";
	public static final String URL_SCHEDULER = "/scheduler/scheduler.do";
	public static final String URL_RESOURCES = "자원관리";
	public static final String URL_CONFIRM = "/confirm/main.do";
	public static final String URL_COMMUE = "/commue/commueMonthList.do";
	public static final String URL_WEBHARD = "/webhard/main.do";
	public static final String URL_NOTICE = "/notice/noticeList.do";
	public static final String URL_NEWS = "/news/news.do";
	
	public String selectBookMarkByEmpNo(int empNo);
	public int updateBookMark(BookmarkVO bVo);
}
