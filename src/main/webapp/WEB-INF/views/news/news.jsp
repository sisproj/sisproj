<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 0. include부분 -->


<style>
.newsMaindiv{
	width:100%;
}

.newsDiv{
	width:60%;
	float: left;
}

.photoNewsdiv{
	width:35%;
	float:right;
}


</style>
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li class="active"><a href="<c:url value='/news/news.do'/>"><i
				class="fa fa-pencil-square-o"></i>&nbsp;<span>뉴스 홈</span></a></li>
		<li><a href="<c:url value='/news/dailyNews.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>SIS 사내뉴스</span></a></li>
		<li><a href="<c:url value='/news/photoNews.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>SIS 포토뉴스</span></a></li>


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
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;전자 결재&nbsp;<a
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
				<div class="w3-twothird">
					<img src="img_notebook.jpg" alt="Notebook" style="width: 100%">
					<h2>Empty Notebook Found</h2>
					<div class="w3-justify">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum.</p>
					</div>
					
					
				</div>
				<div class="w3-third">
				<!-- 반복시작 -->
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list }">
					<div class="w3-container w3-light-grey">
					<c:if test="${fn:length(vo.newsTitle)>30 }">
						<h4><a href="#"> ${fn:substring(vo.newsTitle,0,30) }...</a></h4>
					</c:if>
					<c:if test="${fn:length(vo.newsTitle)<=30}">
						<h4><a href="#"> ${vo.newsTitle}</a></h4>
					</c:if>
						<p class="w3-justify">${vo.newsContent}</p>
					</div>
					<br>
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
						<img src="<c:url value='/resources/images/airplain.png'/>" style="width: 100%; min-height: 200px">
					</div>
					<div class="w3-twothird w3-container">
						<h2>5 Terre</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>

				</div>
				
			
			</div>
		</div>
	</div>
	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(9) a').addClass('active');
        });
    </script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>