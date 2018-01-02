package com.siszo.sisproj.bookmark.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siszo.sisproj.bookmark.model.BookmarkService;
import com.siszo.sisproj.bookmark.model.BookmarkVO;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.employee.model.EmployeeVO;

@Controller
@RequestMapping("/bookmark")
public class BookmarkController {
	private static final Logger logger = LoggerFactory.getLogger(BookmarkController.class);
	/* 로직 : 북마크 버튼 클릭시 - 파라미터 : 해당 메뉴 상수 - 북마크는 최대 5개
	1. 해당 a태그안의 i의 클래스가 bookmark인지 nobook인지 파악
	2. nobook이라면
		2-1. 세션 유저의 즐겨찾기 목록에 추가 (update) - 기존 값을 불러와서 추가후 업데이트 (구분자,)
	3. bookmark라면
		3-1. 세션 유저의 즐겨찾기 목록을 가져옴
		3-2. 목록을 ,으로 구분 배열을 얻어냄
		3-3. 상수중에 해당 상수를 찾아 지움
		3-4. 배열을 다시 String으로 합쳐 업데이트
	/////
	4. 해당 유저 로그인시 유저 즐겨찾기 목록 가져옴
		4-1. 목록을 ,으로 구분 배열을 얻어냄
		4-2. 해당 상수에 해당하는 주소와, 이름, 아이콘을 뿌려줌
	*/
	@Autowired
	private BookmarkService bService;
	
	@RequestMapping("/mark.do")
	@ResponseBody
	public int mark(@RequestParam int pageNo, @RequestParam String markStat, HttpSession session) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("ajax 북마크 체크 혹은 체크해제, 파라미터 pageNo={}, markStat={}",pageNo, markStat);
		
		int res = 0;
		if(markStat.equals(BookmarkService.NO_BOOK)) {
			String empBookmark = bService.selectBookMarkByEmpNo(empVo.getEmpNo());
			if(empBookmark==null || empBookmark.isEmpty()) {
				empBookmark=Integer.toString(pageNo);
			} else {
				empBookmark=empBookmark+","+pageNo;				
			}
			logger.info("추가되는 북마크 목록 empBookmark={}",empBookmark);
			BookmarkVO bVo = new BookmarkVO();
			bVo.setEmpNo(empVo.getEmpNo());
			bVo.setEmpBookmark(empBookmark);
			
			int cnt = bService.updateBookMark(bVo);
			logger.info("북마크 목록 업데이트 결과, cnt={}",cnt);
			if(cnt>0) {
				res=1;
			}			
		} else if(markStat.equals(BookmarkService.BOOKMARK)) {
//			3-1. 세션 유저의 즐겨찾기 목록을 가져옴
			String empBookmark = bService.selectBookMarkByEmpNo(empVo.getEmpNo());
//			3-2. 목록을 ,으로 구분 배열을 얻어냄
			String[] bookmarkArr = empBookmark.split(",");
//			3-3. 상수중에 해당 상수를 찾아 지움
			for(int i=0; i<bookmarkArr.length; i++) {
				if(bookmarkArr[i].equals(Integer.toString(pageNo))) {
					bookmarkArr[i] = "";
				}
			}
			String newBookmark = "";
//			3-4. 배열을 다시 String으로 합쳐 업데이트
			for(int i=0; i<bookmarkArr.length; i++) {
				if(!bookmarkArr[i].equals("") && !bookmarkArr[i].isEmpty()) {
					newBookmark+=bookmarkArr[i];
					if(i!=bookmarkArr.length-1) {
						newBookmark+=",";
					}
				}
			}
			logger.info("삭제된 후 새로운 북마크 목록 newBookmark={}", newBookmark);
			BookmarkVO bVo = new BookmarkVO();
			bVo.setEmpBookmark(newBookmark);
			bVo.setEmpNo(empVo.getEmpNo());
			
			int cnt = bService.updateBookMark(bVo);
			logger.info("북마크 목록 업데이트 결과, cnt={}",cnt);
			if(cnt>0) {
				res=1;
			}	
		} //if
		return res;
	}
	
	@RequestMapping("/bookmark.do")
	public String bookmark(HttpSession session, Model model) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("북마크 리스트 불러오기");
		List<Map<String, String>> bookmarkList = null;
		String bookmark = bService.selectBookMarkByEmpNo(empVo.getEmpNo());
		if(bookmark!=null && !bookmark.isEmpty()) {
			String[] bookmarkArr = bookmark.split(",");
			bookmarkList = new ArrayList<Map<String,String>>();
			
			for(int i=0; i<bookmarkArr.length; i++) {
				if(!bookmarkArr[i].equals("") && !bookmark.isEmpty()) {
					Map<String, String> map = Utility.getBookmark(Integer.parseInt(bookmarkArr[i]));
					
					bookmarkList.add(map);
				}
			}
			logger.info("북마리 리스트 사이즈, bookmarkList.size()={}",bookmarkList.size());
			
		}
		
		model.addAttribute("bookmarkList",bookmarkList);
		model.addAttribute("bookmark",bookmark);
		
		return "bookmark/bookmark";
	}
}
