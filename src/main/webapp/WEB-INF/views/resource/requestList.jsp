<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="../inc/top.jsp"%>
<!-- scheduler -->
<script src="<c:url value="/resources/codebase/dhtmlxscheduler.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/codebase/dhtmlxscheduler.css"/>">

<script type="text/javascript" charset="utf-8">
	$(function(){
		$('#checkAll').click(function() {
			if($("#checkAll").prop("checked")) {
				//전체 checkbox들을 체크해준다 
				$("td input[type=checkbox]").prop("checked",true); 
			} else { 
				//모든 checkbox들의 체크해제
				$("td input[type=checkbox]").prop("checked",false); 
			}
		});
	});
</script>
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow: hidden;
}

</style>
<!-- 0. include부분 -->
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li class="active"><a href="<c:url value='/resource/resource.do'/>"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;<span>자원관리</span></a></li>
		<c:if test="${sessionScope.empVo.empLev=='관리자' }">
			<li class="active"><a href="<c:url value='/resource/requestList.do'/>"><i class="fa fa-hourglass-half" ></i>&nbsp;<span>승인대기</span></a></li>
		</c:if>
		<!-- <li><a href="#"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li> -->
                
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
	<h1>
		<i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;자원 관리&nbsp;<a href="#"> <i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>

<article id="bodysection">
	<!-- 3. 내용 -->

		<form name="frmList" id="frmList" method="post" action="<c:url value='/resource/requestList.do'/>">
	        <input type="hidden" id="currentPage" name="currentPage" value="1">			        
	        <div id="divBodysection">
		        <div class="divRequestHeader">
			        <a href="#"><div id="divOkMulti"><i class="fa fa-check"></i><span> 선택 승인</span></div></a>
			        <a href="#"><div id="divBackMulti"><i class="fa fa-times"></i><span> 선택 반려</span></div></a>
			        <div>
			        	<input type="text" placeholder="검색" id="searchKeyword" name="searchKeyword" value='${param.searchKeyword}'>
			        	<a href="#"><i id="reqSearch" class="fa fa-search"></i></a>
		        	</div>		        	
			    </div>
			    
	        	<table id="addrTable">
	        		<colgroup>
	        			<col width="5%">
	        			<col width="10%">
	        			<col width="*">
	        			<col width="10%">
	        			<col width="10%">
	        			<col width="10%">
	        			<col width="10%">
	        			<col width="10%">
	        			<col width="10%">
	        		</colgroup>
	        		<thead>
	        		<tr>
	        			<th><input type="checkbox" id="checkAll"></th>
	        			<th><a href="#">자원이름</a></th>
	        			<th>예약 내용</th>
	        			<th>시작일</th>
	        			<th>종료일</th>
	        			<th>예약자</th>
	        			<th>부서</th>
	        			<th>등록일</th>
	        			<th>승인여부</th>
	        		</tr>
	        		</thead>
	        		<tbody>
	        		<c:forEach var="" items="" varStatus="status">
		        		<tr>
		        			<td><input type="checkbox" name="resItems[${status.index }].rvNo" value=""></td>
		        			<td></td>
		        			<td></td>
		        			<td></td>
		        			<td></td>
		        			<td></td>
		        			<td></td>
		        			<td>
		        				<input type="button" name="btOk" id="btOk" value="승인">
		        				<input type="button" name="btBack" id="btBack" value="반려">
		        			</td>
		        			
		        		</tr>
	        		</c:forEach>
	        		</tbody>
	        	</table>
		        
		        <!-- 페이징처리 -->
		    	<div id="pagingbtn">
					<ul>
						<!-- 이전 블럭으로 이동 ◀ -->
						<c:if test="${pagingInfo.firstPage>1 }">
							<a id="prevbtn" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"><i class="fa fa-chevron-left"></i></a>		
						</c:if>	
					
						<!-- [1][2][3][4][5][6][7][8][9][10] -->
						<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
							<c:if test="${i==pagingInfo.currentPage}">
								<span class="thispage">${i }</span>	
							</c:if>
							<c:if test="${i!=pagingInfo.currentPage}">
								<a href="#" onclick="pageFunc(${i })" class="active">${i }</a>
					 		</c:if>				
						</c:forEach>
					
						<!-- 다음 블럭으로 이동 ▶ -->
						<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
							<a id=nextbtn href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"><i class="fa fa-chevron-right"></i></a>
						</c:if>
					</ul>
		        </div>
		        <!-- 페이징 처리 끝 -->


	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
	$(function() {
		$('header nav ul li:nth-child(4) a').addClass('active');
	});
</script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>
