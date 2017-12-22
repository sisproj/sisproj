package com.siszo.sisproj.confirm.common;

public class ConfirmUtility {
	public static final int RECORD_COUNT_PER_PAGE=15; //페이지당 보여질 레코드 수
	public static final int BLOCK_SIZE=7; //블럭당 보여질 페이지 수
    
    //input[type=text] 부분 db에서 가져 올때 태그 or 특수문자 변환작업
    public static String changeTag(String contents) {
    	if(contents==null || contents.isEmpty()) {
    		contents="";
    	} else {
    		contents = contents.replace("<","&lt;");
    		contents = contents.replace(">","&gt;");
    		contents = contents.replace("\"", "&quot;");
    		contents = contents.replace("\'", "&#39;");
    	}
    	System.out.println("contents="+contents);
    	return contents;
    }
    
    //제목 부분 너무 길을 경우 원하는 길이 만큼 잘라서 ... 표시해줌
    public static String titleLength(String str, int len){
    	String title="";
    	int length=0;

    	for(int i=0; i<str.length(); i++){
    		length+=((int)str.charAt(i) > 128) ? 2 : 1;
    		if(length>len){
    			title = str.substring(0,i) + "...";
    			break;
    		}
    	}
    	
    	if("".equals(title)){
    		title = str;
    	}
    	return title;
    }
}
