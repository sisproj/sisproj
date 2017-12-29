package com.siszo.sisproj.common;


/**
 * 검색 정보를 담고있는 Bean
 * 페이징 처리 관련 변수 포함
*/

public class AddrSearchVO {
	/** 검색조건(그룹번호) */
	private int groupNo;
	
	/** 검색키워드 */
	private String searchKeyword = "";
    
	/** 로그인된 아이디 */
	private int empNo;
	
	/** 현재 페이지 */
	private int currentPage = 1;
	
    
    /**블럭당 보여질 페이지 수,  페이지 사이즈 */
    private int blockSize; // properties에서 설정
    
    /** 시작 인덱스 */
    private int firstRecordIndex = 1;
    
    /** 끝 인덱스 */
    private int lastRecordIndex = 1;
    
    /**페이지 별 레코드 갯수 (pageSize) */
    private int recordCountPerPage; 
    
   /**
     * 검색 조건을  설정한다.
     * @param bean 검색조건
     */
    public void setAddrSearchVO(AddrSearchVO bean){
    	this.currentPage = bean.currentPage;
    	this.groupNo = bean.getGroupNo();
    	this.searchKeyword = bean.getSearchKeyword();
    	this.empNo = bean.getEmpNo();
    	this.blockSize = bean.blockSize;
    	this.firstRecordIndex = bean.firstRecordIndex;
    	this.lastRecordIndex = bean.lastRecordIndex;
    	this.recordCountPerPage = bean.recordCountPerPage;
    }

    public int getGroupNo() {
    	return groupNo;
    }

    public void setGroupNo(int groupNo) {
    	this.groupNo = groupNo;
    }

    public String getSearchKeyword() {
    	return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
    	this.searchKeyword = searchKeyword;
    }

    public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public int getCurrentPage() {
    	return currentPage;
    }

    public void setCurrentPage(int currentPage) {
    	this.currentPage = currentPage;
    }

    public int getBlockSize() {
    	return blockSize;
    }

    public void setBlockSize(int blockSize) {
    	this.blockSize = blockSize;
    }

    public int getFirstRecordIndex() {
    	return firstRecordIndex;
    }

    public void setFirstRecordIndex(int firstRecordIndex) {
    	this.firstRecordIndex = firstRecordIndex;
    }

    public int getLastRecordIndex() {
    	return lastRecordIndex;
    }

    public void setLastRecordIndex(int lastRecordIndex) {
    	this.lastRecordIndex = lastRecordIndex;
    }

    public int getRecordCountPerPage() {
    	return recordCountPerPage;
    }

    public void setRecordCountPerPage(int recordCountPerPage) {
    	this.recordCountPerPage = recordCountPerPage;
    }

	@Override
	public String toString() {
		return "AddrSearchVO [groupNo=" + groupNo + ", searchKeyword=" + searchKeyword + ", empNo=" + empNo
				+ ", currentPage=" + currentPage + ", blockSize=" + blockSize + ", firstRecordIndex=" + firstRecordIndex
				+ ", lastRecordIndex=" + lastRecordIndex + ", recordCountPerPage=" + recordCountPerPage + "]";
	}
	
}
 