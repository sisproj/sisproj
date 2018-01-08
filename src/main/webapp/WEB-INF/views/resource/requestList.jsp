<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		$('.divOkMulti').click(function(){
			var len=$('td input[type=checkbox]:checked').length;
			if(len==0){
				alert('승인할 정보를 체크하세요');
				return;
			}
			$('#frmList').prop('action','<c:url value="/resource/updateYMulti.do"/>');
			$('#frmList').submit();
		});
		$('.divBackMulti').click(function(){
			var len=$('td input[type=checkbox]:checked').length;
			if(len==0){
				alert('반려할 정보를 체크하세요');
				return;
			}
			$('#frmList').prop('action','<c:url value="/resource/updateRMulti.do"/>');
			$('#frmList').submit();
		});
		
		$('input[name="btOk"]').click(function(){
			var rvNo=$(this).attr('id');
			$('#rvNo').val(rvNo);
			$('#frmList').prop('action',"<c:url value='/resource/confirmY.do'/>");
			$('#frmList').submit();
			$(this).hide();
			$(this).next().hide();
		});
		$('input[name="btBack"]').click(function(){
			var rvNo=$(this).prev().attr('id');
			$('#rvNo').val(rvNo);
			$('#frmList').prop('action',"<c:url value='/resource/confirmR.do'/>");
			$('#frmList').submit();
			$(this).hide();
			$(this).prev().hide();
		});
		
		$('#reqSearch').click(function(){
			$('#frmList').submit();
		});
	});
	function pageFunc(curPage){
		document.frmList.currentPage.value=curPage;
		frmList.submit();
	}
</script>
<style type="text/css">
	html, body {
		margin: 0;
		padding: 0;
		height: 100%;
		overflow: hidden;
	}
	.divRequestHeader div{
   		float: left;
   		border: 1px solid rgb(195, 195, 195);
   		margin-right: 20px;
   		margin-bottom:10px;
   		padding: 5px;
   		background-color: white;
   	}
   	.divRequestHeader div input{
   		border: none;
   		padding: 1px 0;
   	}
   	#reqSearch{
   		color: rgb(195, 195, 195);
   	}
   	.divOkMulti i{
   		color: #0f0;
   	}
   	.divBackMulti i{
   		color: #f00;
   	}
	#addrTable{
		width:100%;
		margin: 0 auto;
		padding : 10px;
		box-sizing:border-box;
		border:0;
		border-collapse: collapse;	
		margin-top: 10px;	
		margin-bottom: 10px;
	}
	#addrTable tr{
		transition:all 300ms linear;
	}
	#addrTable tbody tr:hover{
		background-color: #e1e1e1;
	}
	#addrTable th{
		box-sizing:border-box;
		padding: 5px;
		height: 30px;
		color: #036;
		font-size: 1.17em;
		border:0;
		border-top: 2px solid #e1e1e1;
		border-bottom: 2px solid #e1e1e1;
	}
	#addrTable td {
		box-sizing:border-box;
		padding: 5px;
		border:0;
		text-align: center;
		border-bottom: 2px solid #e1e1e1;
	}
	#pagingbtn{
		width: 100%;
		max-width:1100px;
		margin: 0 auto;
		height: 40px;
		width: auto;
		box-sizing:border-box;
		padding-bottom: 10px;
		text-align:center;
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
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li><a href="<c:url value='/resource/resource.do'/>"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;<span>자원관리</span></a></li>
		<c:if test="${sessionScope.empVo.empLev!='사원' }">
			<li class="active">
				<a href="<c:url value='/resource/requestList.do'/>">
				<i class="fa fa-hourglass-half" ></i>&nbsp;<span>승인 대기 목록</span></a>
			</li>
		</c:if>
		<!-- <li><a href="#"><i class="fa fa-file-text"></i>&nbsp;<span>승인 완료 목록</span></a></li> -->
                
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
	        <input type="hidden" id="rvNo" name="rvNo" value="${param.rvNo }">			        
	        <div id="divBodysection">
		        <div class="divRequestHeader">		        
			        <a href="#"><div class="divOkMulti"><i class="fa fa-check"></i><span> 선택 승인</span></div></a>
			        <a href="#"><div class="divBackMulti"><i class="fa fa-times"></i><span> 선택 반려</span></div></a>		        
			        <div>
			        	<input type="text" placeholder="검색" id="searchKeyword" name="searchKeyword" value='${param.searchKeyword}'>
			        	<a href="<c:url value='/resource/requestList.do'/>"><i id="reqSearch" class="fa fa-search"></i></a>
		        	</div>		        	
			    </div>
			    
	        	<table id="addrTable">
	        		<colgroup>
	        			<col width="5%">
	        			<col width="10%">
	        			<col width="10%">
	        			<col width="*">
	        			<col width="13%">
	        			<col width="13%">
	        			<col width="10%">
	        			<col width="10%">
	        			<col width="10%">
	        			<col width="10%">
	        		</colgroup>
	        		<thead>
	        		<tr>
	        			<th><input type="checkbox" id="checkAll"></th>
	        			<th>카테고리</th>
	        			<th>자원이름</th>
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
	        		<c:forEach var="map" items="${list }" varStatus="status">
		        		<tr>
		        			<td><input type="checkbox" name="resItems[${status.index }].rvNo" value="${map['RV_NO'] }"></td>
		        			<td>${map['RES_CATEG']}</td>
		        			<td id="${map['RES_NO'] }">${map['RES_NAME']}</td>
		        			<td>${map['RV_CONTENT']}</td>
		        			<td>${map['RV_START'] }</td>
		        			<td>${map['RV_END'] }</td>
		        			<td>${map['EMP_NAME']}</td>
		        			<td>${map['DEPT_NAME'] }</td>
		        			<td><fmt:formatDate value="${map['RV_REGDATE']}" pattern="yyyy-MM-dd"/></td>		        			
		        			<td>
			        			<c:if test="${sessionScope.empVo.empLev!='사원' }">
			        				<input type="button" name="btOk" id="${map['RV_NO'] }" value="승인">
			        				<input type="button" name="btBack" value="반려">			        				
			        			</c:if>
			        			<%-- <c:if test="${sessionScope.empVo.empLev!='관리자' }">
			        				<c:if test="${map['RV_CONFIRM']=='Y'}">승인</c:if>
			        				<c:if test="${map['RV_CONFIRM']=='N'}">승인 대기중</c:if>
			        				<c:if test="${map['RV_CONFIRM']=='R'}">반려</c:if>			        				
			        			</c:if> --%>
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
