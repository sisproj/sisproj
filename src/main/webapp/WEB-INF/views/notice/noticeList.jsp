<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>
<!-- 0. include부분 -->
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li><a href="newcho.html"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
					<li><a href="save.html"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
					<li><a href="await.html"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
					<li><a href="complete.html"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
					<li><a href="return.html"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
					<li><a href="setting.html"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
					<li><a href="typeform.html"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
				</ul>	
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;공지 사항&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>

<!-- 페이징 처리에 필요한 form 태그 -->
<form name="frmPage" method="post" 
action="<c:url value='/reBoard/list.do'/>">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword }">
	<input type="hidden" name="currentPage">
</form>

<c:if test="${!empty param.searchKeyword }">
	<!-- 검색의 경우 -->
	<p>검색어 : ${searchVO.searchKeyword}, ${pagingInfo.totalRecord }건 검색되었습니다.</p>
</c:if>
<c:if test="${empty param.searchKeyword }">
	<!-- 전체 조회의 경우 -->
	<p>전체 조회 결과, ${pagingInfo.totalRecord }건 조회되었습니다.</p>
</c:if>

			<div class="container" style="max-width: 1045px;">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border-collapse:collapse; border: 1px solid #c5bdbd;">
						<thead>
							<tr style="background-color: #eeeeee;">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5">해당하는 데이터가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty list}">
								<!-- 공지사항 내용 반복분 시작 -->
								<c:forEach var="vo" items="${list }">
									<tr>
										<td>${vo.notiNo}</td>									
										<td style="text-align:left">
												<a href
						="<c:url value='/notice/noticeDetail.do?no=${vo.notiNo}'/>">
													<!-- 제목이 긴 경우 일부만 보여주기 -->
													<c:if test="${fn:length(vo.notiTitle)>30 }">
														${fn:substring(vo.notiTitle,0,30) }...
													</c:if>
													<c:if test="${fn:length(vo.notiTitle)<=30 }">						
														${vo.notiTitle}
													</c:if>
												</a>
										</td>									
										<td>${vo.empNo }</td>									
										<td>2015-05-05</td>								
										<td>0</td>								
									</tr>								
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="divPage" style="text-align: center;">
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" class="btn btn-success btn-arrow-left"
							onclick="pageFunc(${pagingInfo.firstPage-1})">이전</a>
					</c:if>
					
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage}" 
						end="${pagingInfo.lastPage}">
						<c:if test="${i==pagingInfo.currentPage}">
							<span style="font-weight:bold;color:blue">${i }</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage}">
							<a href="#" onclick="pageFunc(${i })">
							[${i }]</a>
				 		</c:if>				
					</c:forEach>
					
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
						<a href="#" class="btn btn-success btn-arrow-left"
							onclick="pageFunc(${pagingInfo.lastPage+1})">다음</a>
					</c:if>
					
					<a href="noticeWrite.do" class="btn btn-primary pull-right">글쓰기</a>
				</div>
			</div>	
<div class="divSearch">
   	<form name="frmSearch" method="post" 
   	action="<c:url value='/notice/noticeList.do'/>">
        <select name="searchCondition">
            <option value="noticeTitle"
            	<c:if test="${param.searchCondition=='noticeTitle' }"> 
            		selected
            	</c:if>
            	>제목</option>
            <option value="noticeContent"
            	<c:if test="${param.searchCondition=='noticeContent' }"> 
            		selected
            	</c:if>    
            >내용</option>
            <option value="empNo" 
            	<c:if test="${param.searchCondition=='empNo' }"> 
            		selected
            	</c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="${param.searchKeyword }">   
		<input type="submit" value="검색">
    </form>
</div>
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript">
			$(function(){
				$('header nav ul li:nth-child(8) a').addClass('active');
			});
		</script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@include file="../inc/bottom.jsp" %>