<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../inc/admTop.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/w3/w3.css'/>">
<script type="text/javascript">
	function pageFunc(curPage) {
	      document.frmPage.currentPage.value = curPage;
	      frmPage.submit();
	}
	$(function(){
		
		$('input[name=chkAll]').click(function(){
			$('tbody input[type=checkbox]').prop('checked', this.checked);
		});
		
		$('#btDeleteMulti').click(function(){
			//선택한 상품들 삭제
			var len = $('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 항목을 먼저 체크하세요');
				return;
			}
			$('#frmList').prop('action',
				'<c:url value="/news/deleteMulti.do"/>');
			$('#frmList').submit();
		});
	});
</script>	

<style>
.align_center{
	text-align: center;
}


</style>

<!-- 0. include부분 -->
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
	<li><a href="<c:url value='/employee/employeeRegister.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>사원 등록</span></a></li>
                <li><a href="<c:url value='/employee/employeeList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>사원 리스트 </span></a></li>         
                <li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>결재양식관리 </span></a></li>                          
                <li><a href="<c:url value='/commue/commueDateList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>일별 근태현황 </span></a></li>                          
                <li><a href="<c:url value='/commue/commueMonthList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>월별 근태현황 </span></a></li>                          
                <li><a href="<c:url value='/notice/noticeWrite.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>공지사항 등록 </span></a></li>                          
                <li><a href="<c:url value='/news/newsWrite.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스등록 </span></a></li>                          
                <li class="active"><a href="<c:url value='/news/newsRegdit.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스관리 </span></a></li>
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
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;뉴스 관리&nbsp;<a
			href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<br>
		<!-- 3. 내용 -->

<form name="frmList" id="frmList" method="post" 
action="<c:url value='/news/newsRegdit.do'/>">
<div class="divList"> 
<table width="1200" class="box2" >
	<colgroup>
		<col style="width:5%" />
		<col style="width:15%" />
		<col style="width:50%" />
		<col style="width:15%" />	
		<col style="width:9%" />
		<col style="width:9%" />			
	</colgroup>
	<thead>
	  <tr>
		<th><input type="checkbox" name="chkAll"></th>
		<th scope="col">뉴스이미지</th>
		<th scope="col">뉴스제목</th>
		<th scope="col">등록일</th>
		<th scope="col">수정</th>
		<th scope="col">삭제</th>
	  </tr>
	</thead> 
	<tbody>  
	<c:if test="${empty list }">
		<tr>
			<td colspan="6">뉴스가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty list }">
		<!-- 반복 시작 -->
		<c:forEach var="vo" items="${list }" varStatus="status">
			<tr class="align_center">
				<td><input type="checkbox" 
				name="newsItem[${status.index}].newsNo"
					value="${vo.newsNo }">
					<input type="hidden" 
				name="newsItem[${status.index}].newsImage"
					value="${vo.newsImage }">
					</td>
				<td>
				<c:if test="${empty vo.newsImage }">
				<div style="width: 90px;height: 70px;"></div>
				</c:if>
				<c:if test="${!empty vo.newsImage }">
				<img src="<c:url value='/news_images/${vo.newsImage}'/>"
					alt="${vo.newsImage }" width="90px" height="70px">
				</c:if>
				</td>
				<td class="align_left"><a href="<c:url value='/news/newsDetailcnt.do?newsNo=${vo.newsNo }'/>">
				<c:if test="${vo.newsMain=='Y'}">
				[메인]&nbsp;
				 </c:if>
				<c:if test="${vo.newsMain=='N'}">
				[일반]&nbsp; 
				</c:if>
				${vo.newsTitle }</a></td>
				<td><fmt:formatDate value="${vo.newsRegdate }" 
					pattern="yyyy-MM-dd"/>
				</td>
				<td><a href="<c:url value='/news/newsEdit.do?newsNo=${vo.newsNo }'/>">수정</a></td>	
				<td><a href="<c:url value='/news/newsDelete.do?newsNo=${vo.newsNo}&newsImage=${vo.newsImage}'/>" class="deleteNews">삭제</a></td>	
			</tr>
		</c:forEach>
		<!-- 반복 끝 -->
	</c:if>
	</tbody>
</table>


</div>
</form>
<input type="button" id="btDeleteMulti" value="선택한 뉴스 삭제" >
	<form name="frmPage" method="post"
				action="<c:url value='/news/newsRegdit.do'/>">
				 <input type="hidden" name="currentPage">
			</form>
			<div class="w3-bar w3-margin w3-center">
				<a href="#" class="w3-button"
					onclick="pageFunc(${pagingInfo.firstPage})">&laquo;</a>
				<c:forEach var="i" begin="${pagingInfo.firstPage}"
					end="${pagingInfo.lastPage}">
					<c:if test="${i==pagingInfo.currentPage}">
						<span style="font-weight: bold; color: blue" class="w3-button">${i}</span>
					</c:if>
					<c:if test="${i != pagingInfo.currentPage}">
						<a href="#" onclick="pageFunc(${i})" class="w3-button">${i}</a>
					</c:if>
				</c:forEach>
				<a href="#" class="w3-button"
					onclick="pageFunc(${pagingInfo.lastPage})">&raquo;</a>
			</div>
			
			
		<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
	$(function() {
		$('header nav ul li:nth-child(9) a').addClass('active');
	});
</script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>