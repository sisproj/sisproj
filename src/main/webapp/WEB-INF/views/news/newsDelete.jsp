<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/w3/w3.css'/>">
<script>

</script>

<style>

</style>

<!-- 0. include부분 -->
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
	<li><a href="<c:url value='/news/dailyNews.do'/>"><i class='fa fa-newspaper-o'></i>&nbsp;<span>SIS 뉴스홈</span></a></li>
	<c:if test="${sessionScope.empVo.empLev eq '관리자'}">
		<li><a href="<c:url value='/news/newsWrite.do.do'/>"><i
				class="fa fa-floppy-o"></i>&nbsp;<span>SIS 뉴스등록</span></a></li>
		
		<li class="active"><a href="<c:url value='#'/>"><i
				class="fa fa-floppy-o"></i>&nbsp;<span>SIS 뉴스관리</span></a></li>
				</c:if>



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
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;뉴스 등록&nbsp;<a
			href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<br>
	<div id="newsWriteDiv">
		<!-- 3. 내용 -->
	
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