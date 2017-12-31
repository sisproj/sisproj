package com.siszo.sisproj.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.siszo.sisproj.bookmark.model.BookmarkService;

public class Utility {
    public static final int RECORD_COUNT_PER_PAGE = 10;  //페이지당 보여질 레코드수
    public static final int BLOCK_SIZE = 10;                //블럭당 보여질 페이지 수

    public static String getFileInfo(String originalFileName, long fileSize, HttpServletRequest request) {
        double dfileSize = Math.round((fileSize / 1000.0) * 100) / 100.0;

        String fileInfo = "<img src='" + request.getContextPath() + "/images/file.gif'>";
        fileInfo += originalFileName + "(" + dfileSize + "KB)";

        return fileInfo;
    }
	
    public static Map<String, String> getBookmark(int pageNo){
    	Map<String, String> map = new HashMap<String, String>();
    	
    	if(pageNo == BookmarkService.ADDR_BOOK) {
    		map.put("STR", BookmarkService.STR_ADDR_BOOK);
    		map.put("ICON", BookmarkService.ICON_ADDR_BOOK);
    		map.put("URL", BookmarkService.URL_ADDR_BOOK);
    	} else if(pageNo == BookmarkService.SCHEDULER) {
    		map.put("STR", BookmarkService.STR_SCHEDULER);
    		map.put("ICON", BookmarkService.ICON_SCHEDULER);
    		map.put("URL", BookmarkService.URL_SCHEDULER);
    	} else if(pageNo == BookmarkService.RESOURCES) {
    		map.put("STR", BookmarkService.STR_RESOURCES);
    		map.put("ICON", BookmarkService.ICON_RESOURCES);
    		map.put("URL", BookmarkService.URL_RESOURCES);
    	} else if(pageNo == BookmarkService.CONFIRM) {
    		map.put("STR", BookmarkService.STR_CONFIRM);
    		map.put("ICON", BookmarkService.ICON_CONFIRM);
    		map.put("URL", BookmarkService.URL_CONFIRM);
    	} else if(pageNo == BookmarkService.COMMUE) {
    		map.put("STR", BookmarkService.STR_COMMUE);
    		map.put("ICON", BookmarkService.ICON_COMMUE);
    		map.put("URL", BookmarkService.URL_COMMUE);
    	} else if(pageNo == BookmarkService.WEBHARD) {
    		map.put("STR", BookmarkService.STR_WEBHARD);
    		map.put("ICON", BookmarkService.ICON_WEBHARD);
    		map.put("URL", BookmarkService.URL_WEBHARD);
    	} else if(pageNo == BookmarkService.NOTICE) {
    		map.put("STR", BookmarkService.STR_NOTICE);
    		map.put("ICON", BookmarkService.ICON_NOTICE);
    		map.put("URL", BookmarkService.URL_NOTICE);
    	} else if(pageNo == BookmarkService.NEWS) {
    		map.put("STR", BookmarkService.STR_NEWS);
    		map.put("ICON", BookmarkService.ICON_NEWS);
    		map.put("URL", BookmarkService.URL_NEWS);
    	}
    	
    	return map;
    }
}//class







