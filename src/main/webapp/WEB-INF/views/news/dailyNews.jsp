<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 0. include부분 -->
<script type="text/javascript">
	
		$('.newsbtdiv').click(function() {
			location.href = "newsWrite.do";
		});
		
		$('header nav ul li:nth-child(9) a').addClass('active');
		
	});
</script>

<style>
.newsbtdiv {
	text-align: right;
}
</style>
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li><a href="<c:url value='/news/news.do'/>"><i
				class="fa fa-pencil-square-o"></i>&nbsp;<span>뉴스 홈</span></a></li>
		<li class="active"><a href="<c:url value='/news/dailyNews.do'/>"><i
				class="fa fa-floppy-o"></i>&nbsp;<span>SIS 사내뉴스</span></a></li>
		<li><a href="<c:url value='/news/photoNews.do'/>"><i
				class="fa fa-floppy-o"></i>&nbsp;<span>SIS 포토뉴스</span></a></li>
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
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;SIS 뉴스&nbsp;<a
			href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<!-- 3. 내용 -->

	<div class="w3-light-grey w3-padding-32 w3-center">
		<h1 class="w3-jumbo">SIS News</h1>
	</div>
	<div class="newsbtdiv">
		<input type="button" value="뉴스등록">
	</div>

	<div class="w3-third">
		<img src="<c:url value='/resources/images/airplain.png'/>"
			style="width: 100%; min-height: 200px">
	</div>
	<div class="w3-twothird w3-container">
		<h2>Main News</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
			eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
			ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
			aliquip ex ea commodo consequat.</p>
	</div>

	<br> <br> <br> <br>

	<c:if test="${empty list }">
		<img src="<c:url value='/resources/images/error.png'/>" alt="에러이미지"
			id="errorimg">
		<h2>등록된 글이 없습니다.</h2>
	</c:if>
	<!-- 반복시작 -->
	<c:if test="${!empty list }">
		<div class="w3-row-padding w3-margin-top">
			<c:forEach var="vo" items="${list}">
				<div class="w3-third w3-justify">
					<c:if test="${fn:length(vo.newsTitle)>30 }">
						<h4><a href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>"> ${fn:substring(vo.newsTitle,0,30) }...</a></h4>
					</c:if>
					<c:if test="${fn:length(vo.newsTitle)<=30}">
						<h4><a href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>"> ${vo.newsTitle}</a></h4>
					</c:if>
					<p id="contentP"></p>
				<%-- 	
					<c:if test="${fn:length(vo.newsContent)>500 }">
						<p>${fn:substring(vo.newsContent,0,500) }...</p>
					</c:if>
					<c:if test="${fn:length(vo.newsContent)<=500}">
						<div style="height:300px; width: 30%">${vo.newsContent}</div>
					</c:if> --%>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<!-- 반복끝 -->
	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>