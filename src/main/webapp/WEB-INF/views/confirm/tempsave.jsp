<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_tempsave.css'/>" rel="stylesheet" type="text/css">
<!-- 0. include부분 -->
		<nav>
			<ul>
				<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
				<li><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
				<li class="active"><a href="<c:url value='/confirm/tempsave.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
				<li><a href="<c:url value='/confirm/await.do'/>"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
				<li><a href="<c:url value='/confirm/complete.do'/>"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
				<li><a href="<c:url value='/confirm/return.do'/>"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
				<li><a href="<c:url value='/confirm/setting.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
				<li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
			</ul>	
			<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
			<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
		</nav>
	</aside>
	<!-- 왼쪽 사이드 메뉴 끝 -->
	<article id="headsection">
		<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
		<h1><i class="fa fa-book"></i>&nbsp;전자 결재 - 임시 저장함&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
		<!-- 2. 페이지 이름 지정 끝 -->
	</article>	
	<article id="bodysection">
		<form name="frmPaging" method="post" action="<c:url value='/confirm/tempsave.do'/>">
			<!-- 페이징 처리용 -->
			<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
			<input type="hidden" name="currentPage">
		</form>
		<!-- 3. 내용 -->
		<div id="wrap">
			<div id="search" class="bold">
				검색어 : <input type="text" name="searchKey" id="searchKey" placeholder="문서번호, 제목, 내용">
				<input type="button" value="검색">
			</div>
			<table id="awaittb">
				<thead>
					<tr>
						<th><input type="checkbox" id="allSelect" value="문서번호받기"></th>
						<th>문서번호</th>
						<th>제목</th>
						<th>기안일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty docuList }">
						<tr><td colspan="4">조회된 데이터가 없습니다.</td></tr>
					</c:if>
					<c:if test="${!empty docuList }">
						<c:forEach var="docuVo" items="${docuList }" varStatus="status">
							<tr>
								<td><input type="checkbox" name="docuItems[${status.index }].cfNo" value="${docuVo.cfNo }"></td>
								<td>${docuVo.cfNo }</td>
								<td><a href="#">${docuVo.cfTitle }</a></td>
								<td><fmt:formatDate value="${docuVo.cfRegdate }" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<div id="pagingbtn">
				<c:if test="${pageInfo.currentPage!=1 }">
					<a id="firstbtn" href="#" onclick="movePage(1)"><i class="fa fa-arrow-left"></i></a>
				</c:if>
				<c:if test="${pageInfo.firstPage>1 }">
					<a id="prevbtn" href="#" onclick="movePage(${pageInfo.firstPage-1})"><i class="fa fa-chevron-left"></i></a>
				</c:if>
				
				<c:forEach var="i" begin="${pageInfo.firstPage }" end="${pageInfo.lastPage }">
					<c:if test="${i==pageInfo.currentPage }">
						<span class="thispage">${i }</span>					
					</c:if>
					<c:if test="${i!=pageInfo.currentPage }">
						<a href="#" onclick="movePage(${i })">${i }</a>				
					</c:if>
				</c:forEach>
				
				<c:if test="${pageInfo.lastPage < pageInfo.totalPage }">
					<a id=nextbtn href="#" onclick="movePage(${pageInfo.lastPage+1})"><i class="fa fa-chevron-right"></i></a>
				</c:if>
				<c:if test="${pageInfo.currentPage!=pageInfo.totalPage  }">
					<a id=lastbtn href="#" onclick="movePage(${pageInfo.totalPage })"><i class="fa fa-arrow-right"></i></a>
				</c:if>
			</div>
		</div>
		<!-- 3. 내용 끝 -->
	</article>
	<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
	<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@ include file="../inc/bottom.jsp" %>
<script type="text/javascript">
	function movePage(currentP){
		document.frmPaging.currentPage.value=currentP;
		document.frmPaging.submit();
	}
	$('#search input[type=button]').click(function(){
		var sk = $('#search #searchKey').val()
		$('form[name=frmPaging] input[name=searchKeyword]').val(sk);
		movePage(1);
	});
</script>