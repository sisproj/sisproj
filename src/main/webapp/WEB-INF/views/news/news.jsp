<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/w3/w3.css'/>">
<!-- 0. include부분 -->

<style>
hr{
	margin: 0;
}
.newsMaindiv {
	width: 1500px;
}

.newsDiv {
	width: 60%;
	float: left;
}

.photoNewsdiv {
	width: 35%;
	float: right;
}

#newstitle {
	color: #069;
	font-weight: bold;
}
.newsMainContent{
line-height: 200%;
}
</style>
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li class="active"><a href="<c:url value='/news/news.do'/>"><i
				class="fa fa-pencil-square-o"></i>&nbsp;<span>뉴스 홈</span></a></li>
		<li><a href="<c:url value='/news/dailyNews.do'/>"><i
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
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;뉴스 홈&nbsp;<a
			href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<!-- 3. 내용 -->
	<div class="newsMaindiv">
		<div class="newsDiv">
			<div class="w3-light-grey w3-padding-64 w3-margin-bottom w3-center">
				<h1 class="w3-jumbo">SIS 사내뉴스</h1>
			</div>

			<div class="w3-row-padding w3-content" style="max-width: 1400px">
			<c:if test="${!empty list}">
			<c:forEach var="vo" items="${list}">
			<c:if test="${vo.newsMain=='Y'}">
				<div class="w3-twothird">
					<img src="<c:url value='/news_images/${vo.newsImage }'/>" alt="Notebook" style="width: 100%">
					<c:if test="${fn:length(vo.newsTitle)>50 }">
							<h2 id="dnewstitle">
								<a
									href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
									${fn:substring(vo.newsTitle,0,50) }...</a>
							</h2>
						</c:if>
						<c:if test="${fn:length(vo.newsTitle)<=50}">
							<h2 id="dnewstitle">
								<a
									href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
									${vo.newsTitle}</a>
							</h2>
						</c:if>
						
					<div class="w3-justify">
					<c:if test="${fn:length(vo.newsContent)>1000 }">
							<p class="newsMainContent">${fn:substring(vo.newsContent,0,1000) }...</p>
						</c:if>
					<c:if test="${fn:length(vo.newsContent)<=1000}">
							<p class="newsMainContent">${vo.newsContent}</p>
						</c:if> 
					</div>


				</div>
				</c:if>
				</c:forEach>
				</c:if>
				<div class="w3-third">
					<!-- 반복시작 -->
					<c:if test="${!empty list}">
						<c:forEach var="vo" items="${list }">
							<c:if test="${vo.newsMain=='N'}">
								<div class="w3-container w3-light-grey">
									<c:if test="${fn:length(vo.newsTitle)>30 }">
										<h4 id="newstitle">
											<a
												href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
												${fn:substring(vo.newsTitle,0,30) }...</a>
										</h4>
									</c:if>
									<c:if test="${fn:length(vo.newsTitle)<=30}">
										<h4 id="newstitle">
											<a
												href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">${vo.newsTitle}</a>
										</h4>
									</c:if>
									<c:if test="${fn:length(vo.newsContent)>200 }">
										<p class="w3-justify">${fn:substring(vo.newsContent,0,200) }...</p>
									</c:if>
									<c:if test="${fn:length(vo.newsContent)<=200}">
										<p class="w3-justify">${vo.newsContent}</p>
									</c:if>
								</div>
								<br>
							</c:if>
					</c:forEach>
				</c:if>


				<!-- 반복끝 -->
			</div>
		</div>
	</div>



	<div class="photoNewsdiv">
		<div class="w3-container w3-teal">
			<h1>SIS Photo뉴스</h1>
		</div>

		<div class="w3-content">

			<div class="w3-row w3-margin">

				<div class="w3-third">
					<img src="<c:url value='/resources/images/airplain.png'/>"
						style="width: 100%; min-height: 200px">
				</div>
				<div class="w3-twothird w3-container">
					<h2>5 Terre</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

			</div>


		</div>
	</div>
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