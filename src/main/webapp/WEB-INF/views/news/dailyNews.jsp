<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/w3/w3.css'/>">
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function() {
		
		
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

#dnewstitle {
	color: #069;
	font-weight: bold;
}

.newsReg {
	color:blue;
	float: right;
}

#dnewsContentDiv {
	max-width:100%;
	width: 78%;
	float: right;
}

#dnewsImageDiv {
	margin-top:15px;
	width: 18%;
	float: left;
}

.newsMainContent{
line-height: 200%;
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
	<div class="testText" style="visibility: hidden;"></div>
	<div class="w3-light-grey w3-padding-32 w3-center">
		<h1 class="w3-jumbo">SIS News</h1>
	</div>
	<div class="newsbtdiv">
		<input type="button" value="뉴스등록">
	</div>

	<c:if test="${!empty list}">
		<c:forEach var="vo" items="${list}">
			<c:if test="${vo.newsMain=='Y'}">
				<div class="w3-third">
					<img src="<c:url value='/news_images/${vo.newsImage }'/>"
						style="width: 100%; max-height: 250px; min-height: 200px">
				</div>
				<br>
				<div class="w3-twothird w3-container">
					<c:if test="${fn:length(vo.newsTitle)>30 }">
						<h2 id="dnewstitle">
							<a
								href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
								${fn:substring(vo.newsTitle,0,30) }...</a>
						</h2>
					</c:if>
					<c:if test="${fn:length(vo.newsTitle)<=30}">
						<h2 id="dnewstitle">
							<a
								href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
								${vo.newsTitle}</a>
						</h2>
					</c:if>
					<c:if test="${fn:length(vo.newsContent)>300 }">
						<p class="newsMainContent">${fn:substring(vo.newsContent,0,300) }...</p>
					</c:if>
					<c:if test="${fn:length(vo.newsContent)<=300}">
						<p class="newsMainContent" style="height: 300px; width: 30%">${vo.newsContent}</p>
					</c:if>
					<div class="newsReg">작성일 : ${vo.newsRegdate }</div>
				</div>
			</c:if>
		</c:forEach>
	</c:if>
	<br><br><br>

	<c:if test="${empty list }">
		<img src="<c:url value='/resources/images/error.png'/>" alt="에러이미지"
			id="errorimg">
		<h2>등록된 글이 없습니다.</h2>
	</c:if>
	<!-- 반복시작 -->
	<c:if test="${!empty list}">
		<div class="w3-row-padding">

			<c:forEach var="vo" items="${list}">
				<c:if test="${vo.newsMain=='N'}">
					<div class="w3-third w3-justify">
						<c:if test="${!empty vo.newsImage }">
						<div id="dnewsImageDiv">
							<img src="<c:url value='/news_images/${vo.newsImage }'/>"
								style="width: 100px; height: 150px;">
						</div>
						</c:if>
						
						<c:if test="${empty vo.newsImage }">
						</c:if>
						<div id="dnewsContentDiv">
							<c:if test="${fn:length(vo.newsTitle)>30 }">
								<h4 id="dnewstitle">
									<a
										href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
										${fn:substring(vo.newsTitle,0,30) }...</a>
								</h4>
							</c:if>
							<c:if test="${fn:length(vo.newsTitle)<=30}">
								<h4 id="dnewstitle">
									<a
										href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
										${vo.newsTitle}</a>
								</h4>
							</c:if>
							
							<c:if test="${fn:length(vo.newsContent)>100 }">
								<p>${fn:substring(vo.newsContent,0,100) }...</p>
							</c:if>
							<c:if test="${fn:length(vo.newsContent)<=100}">
								<p style="height: 300px; width: 30%">${vo.newsContent}</p>
							</c:if>
							<div class="newsReg">작성일 : <fmt:formatDate value="${vo.newsRegdate }" pattern="yyyy-MM-dd hh:mm"/> </div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</c:if>
	<!-- 반복끝 -->
	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>