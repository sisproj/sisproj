<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../inc/admTop.jsp" %>
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
			var len = $('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 항목을 먼저 체크하세요');
				return;
			}
			$('#frmList').prop('action',
				'<c:url value="/news/adm/deleteMulti.do"/>');
			$('#frmList').submit();
		});
		
		$('#btWriteNews').click(function(){
			location.href="<c:url value='/news/adm/newsWrite.do'/>"; 
		});
	});
</script>	

<style>
.align_center{
	text-align: center;
}

#newsRegFrm{
	width: 90%;
	margin: 0 auto;
	padding : 10px;
	box-sizing:border-box;
	border:0;
	border-collapse: collapse;
	margin-bottom: 10px;
}

#newsRegFrm tr{
	transition:all 300ms linear;
}
#newsRegFrm tbody tr:hover{
	background-color: #e1e1e1;
}
#newsRegFrm th{
	box-sizing:border-box;
	padding: 5px;
	height: 30px;
	color: #036;
	font-size: 1.17em;
	border:0;
	border-top: 2px solid #e1e1e1;
	border-bottom: 2px solid #e1e1e1;
}
#newsRegFrm td {
	box-sizing:border-box;
	padding: 5px;
	border:0;
	text-align: center;
	border-bottom: 2px solid #e1e1e1;
}
/*버튼 영역*/
#newsRegbtns{
	width: 90%;
	margin: 0 auto;
}
#newsRegbtns input[type=button]{
	display: inline-block;
	width:  110px;
	height: 30px;
	margin-right: 5px;
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

<!-- 왼쪽 사이드 메뉴 끝 -->
<article id="headsection">

	<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
	<h1>
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;뉴스 관리&nbsp;
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<br>
		<!-- 3. 내용 -->

<form name="frmList" id="frmList" method="post" 
action="<c:url value='/news/newsRegdit.do'/>">
<div class="divList"> 
<table id="newsRegFrm">
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
				<td><a href="<c:url value='/news/adm/newsEdit.do?newsNo=${vo.newsNo }'/>">수정</a></td>	
				<td><a href="<c:url value='/news/adm/newsDelete.do?newsNo=${vo.newsNo}&newsImage=${vo.newsImage}'/>" class="deleteNews">삭제</a></td>	
			</tr>
		</c:forEach>
		<!-- 반복 끝 -->
	</c:if>
	</tbody>
</table>


</div>
</form>
<div id="newsRegbtns">
	<input type="button" id="btDeleteMulti" value="선택한 뉴스 삭제" >
	<input type="button" id="btWriteNews" value="뉴스등록" >
</div>
	<form name="frmPage" method="post"
				action="<c:url value='/news/newsRegdit.do'/>">
		 <input type="hidden" name="currentPage">
	</form>
	<div id="pagingbtn">
		<!-- 이전 블럭으로 이동 ◀ -->
		<c:if test="${pagingInfo.firstPage>1 }">
			<a id="prevbtn" href="#" onclick="pageFunc(${pageInfo.firstPage-1})"><i class="fa fa-chevron-left"></i></a>	
		</c:if>	
		
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
			<c:if test="${i==pagingInfo.currentPage}">
				<span class="thispage">${i }</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage}">
				<a href="#" onclick="pageFunc(${i })">${i }</a>		
	 		</c:if>				
		</c:forEach>
	
		<!-- 다음 블럭으로 이동 ▶ -->
		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
			<a id=nextbtn href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"><i class="fa fa-chevron-right"></i></a>
		</c:if>
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