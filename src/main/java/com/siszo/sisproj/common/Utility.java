package com.siszo.sisproj.common;

import javax.servlet.http.HttpServletRequest;

public class Utility {
    public static final int RECORD_COUNT_PER_PAGE = 5;  //페이지당 보여질 레코드수
    public static final int BLOCK_SIZE = 10;                //블럭당 보여질 페이지 수

    public static String getFileInfo(String originalFileName, long fileSize, HttpServletRequest request) {
        double dfileSize = Math.round((fileSize / 1000.0) * 100) / 100.0;

        String fileInfo = "<img src='" + request.getContextPath() + "/images/file.gif'>";
        fileInfo += originalFileName + "(" + dfileSize + "KB)";

        return fileInfo;
    }
    
    //input[type=text] 부분 db에서 가져 올때 <script or <style 태그 변환작업
    public static String changeTag(String contents) {
    	if(contents=="" || contents.equals("") || contents.isEmpty()) {
    		contents="";
    	} else {
    		contents = contents.replace("<script","&lt;script");
    		contents = contents.replace("<style","&lt;style");
    	}
    	return contents;
    }
}//class







