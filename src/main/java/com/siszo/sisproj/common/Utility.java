package com.siszo.sisproj.common;

import javax.servlet.http.HttpServletRequest;

public class Utility {
    public static final int RECORD_COUNT_PER_PAGE = 11;  //페이지당 보여질 레코드수
    public static final int BLOCK_SIZE = 10;                //블럭당 보여질 페이지 수

    public static String getFileInfo(String originalFileName, long fileSize, HttpServletRequest request) {
        double dfileSize = Math.round((fileSize / 1000.0) * 100) / 100.0;

        String fileInfo = "<img src='" + request.getContextPath() + "/images/file.gif'>";
        fileInfo += originalFileName + "(" + dfileSize + "KB)";

        return fileInfo;
    }
    
}//class









