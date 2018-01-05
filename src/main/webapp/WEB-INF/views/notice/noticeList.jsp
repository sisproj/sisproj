<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>
<style>
	/*글쓰기 버튼*/
	.divSearch div#wrbtn{
		text-align: right;
	}
	.divSearch div#wrbtn a.button{
		display:inline-block;
		text-align:center;
		width: 66px;
		height: 34px;
		line-height: 34px;
	}
	/*테이블*/
	#noticeTable {
		width: 90%;
		max-width:1100px;
		margin: 0 auto;
		padding : 10px;
		box-sizing:border-box;
		border:0;
		border-collapse: collapse;
	}
	#noticeTable tr{
		transition:all 300ms linear;
	}
	#noticeTable td b{
		color: #306;	
	}
	#noticeTable tbody tr:hover{
		background-color: #e1e1e1;
	}
	#noticeTable th{
		box-sizing:border-box;
		padding: 5px;
		height: 30px;
		color: #036;
		font-size: 1.17em;
		border:0;
		border-top: 2px solid #e1e1e1;
		border-bottom: 2px solid #e1e1e1;
	}
	#noticeTable td {
		box-sizing:border-box;
		padding: 5px;
		border:0;
		text-align: center;
		border-bottom: 2px solid #e1e1e1;
	}
	/*하단 페이징 버튼*/
	#pagingbtn{
		width: 100%;
		max-width:1100px;
		margin: 0 auto;
		height: 40px;
		width: auto;
		box-sizing:border-box;
		padding-bottom: 10px;
		text-align:center;
		margin-top: 10px;
	}
	#pagingbtn span, #pagingbtn a{
		display: inline-block;
		width: 24px;
		line-height: 24px;
		border-radius:12px;
		background-color: #369;
		color: fff;
		text-align: center;
		font-weight: bold;
		margin-left: 5px;
		box-shadow:2px 2px 3px #333;
		font-size: 0.8em;
	}
	#pagingbtn a:hover,
	#pagingbtn span.thispage{
		background-color:#09f;
		box-shadow:2px 2px 3px transparent;	
	}
	#pagingbtn span:first-child{
		margin-left: 0;	
	}
	#pagingbtn a i {
		line-height: 24px;
		color: fff;
		text-align: center;
		font-size: 0.8em;
	}
	#pagingbtn #firstbtn,
	#pagingbtn #lastbtn{
		background-color: #333;
	}
	#pagingbtn #prevbtn,
	#pagingbtn #nextbtn{
		background-color: #306;
	}
</style>
<!-- 0. include부분 -->
		<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
		        <nav>
					<ul>
						<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
						<li class="active"><a href="<c:url value='/notice/not	iceList.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>공지사항 홈</span></a></li>
					</ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
					<div id="listbtn">
						<p>
							<i class="fa fa-chevron-circle-left" style="text-align: center;"></i>
						</p>
					</div>
				</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-bullhorn"></i>&nbsp;공지 사항&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
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
action="<c:url value='/notice/noticeList.do'/>"> 
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
					<table id="noticeTable">
						<thead>
							<tr>
								<th>번호</th>
								<th>카테고리</th>
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
										<td>${vo.notiCategory }</td>								
										<td style="text-align:left">
											<!-- 파일이 첨부된 경우 파일 이미지 보여주기 -->
											<c:if test="${!empty vo.notiFilename}">
												<img src="<c:url value='/noti_images/file.gif' />" 
												alt="파일 이미지">
											</c:if>
											<a href
					="<c:url value='/notice/countUpdate.do?notiNo=${vo.notiNo}'/>">
												<!-- 제목이 긴 경우 일부만 보여주기 -->
												<c:if test="${fn:length(vo.notiTitle)>30 }">
													${fn:substring(vo.notiTitle,0,30) }...
												</c:if>
												<c:if test="${fn:length(vo.notiTitle)<=30 }">						
													${vo.notiTitle}
												</c:if>
											</a>
											<!-- 24시간 이내의 글인 경우 -->
											<c:if test="${vo.newImgTerm<24 }">
												<img src='<c:url value="/noti_images/new2.gif"/>' 
												alt="new 이미지">
											</c:if>
										</td>									
										<td>${vo.empLev }</td>									
										<td><fmt:formatDate value="${vo.notiRegdate}" 
											pattern="yyyy-MM-dd" /></td>								
										<td>${vo.notiReadcnt}</td>								
									</tr>								
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				
				<div id="pagingbtn">
					<c:if test="${pagingInfo.firstPage>1 }">
						<a id="prevbtn" href="#" 
							onclick="pageFunc(${pagingInfo.firstPage-1})"><i class="fa fa-chevron-left"></i></a>
					</c:if>
					
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage}" 
						end="${pagingInfo.lastPage}">
						<c:if test="${i==pagingInfo.currentPage}">
							<span class="thispage">${i }</span>	
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage}">
							<a href="#" onclick="pageFunc(${i })">
							${i }</a>
				 		</c:if>				
					</c:forEach>
					
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
						<a id=nextbtn href="#" 
							onclick="pageFunc(${pagingInfo.lastPage+1})"><i class="fa fa-chevron-right"></i></a>
					</c:if>
				</div>
				
		
				<div class="divSearch" style="text-align: center;">
					<form name="frmSearch" method="post"
						action="<c:url value='/notice/noticeList.do'/>">
						<select name="searchCondition">
							<option value="noti_title"
								<c:if test="${param.searchCondition=='notiTitle' }"> 
		            		selected
		            	</c:if>>제목</option>
							<option value="noti_content"
								<c:if test="${param.searchCondition=='notiContent' }"> 
		            		selected
		            	</c:if>>내용</option>
							<option value="emp_no"
								<c:if test="${param.searchCondition=='empNo' }"> 
		            		selected
		            	</c:if>>작성자</option>
						</select> <input type="text" name="searchKeyword" title="검색어 입력"
							value="${param.searchKeyword }"> <input type="submit" class="btn btn-primary"
							value="검색">
					</form>
					<%-- <c:if test="${sessionScope.empVo.empLev=='관리자'}">
						<div id="wrbtn"><a href="noticeWrite.do" class="btn btn-primary pull-right">글쓰기</a></div>
					</c:if> --%>
				</div>
			</div>
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