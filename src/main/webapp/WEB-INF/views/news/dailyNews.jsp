<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/css/w3/w3.css'/>">
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function() {

		if($('.sessionLv').val()!="관리자"){
			$('.newsregbt').hide();
		}
		
		$('.newsImageChk').each(function(idx, item) {
			if ($(this).val() == '') {
				$(this).siblings('.dnewsContentDiv').css('width', '95%');
			} else {
				$(this).siblings('.dnewsContentDiv').css('width', '73%');
			}
		});

		$('.newsbtdiv').click(function() {
			location.href = "newsWrite.do";
		});

		$('header nav ul li:nth-child(9) a').addClass('active');
	
	});
	
</script>

<style>
.newsbigDiv {
	width: 1100px;
	float: left;
}

.importdiv {
	margin-left: 25px;
	width: 400px;
	float: left;
}

.mainNews {
	height: 400px;
}

.thirdnewsDiv {
	width: 100%;
}

.newsmainDiv {
	width: 522px;
	height: 150px;
	float: left;
	box-shadow: 0 4px 4px #b8b8b8;
	margin-left: 5px;
}

.newsbtdiv {
	text-align: right;
}

.dnewstitle {
	color: #069;
	font-weight: bold;
}

.dnewsContentDiv {
	float: right;
}

.dnewsImageDiv {
	margin-top: 10px;
	width: 25%;
	height: 100px;
	float: left;
}

.newsMainContent {
	line-height: 200%;
}

.comcount {
	float: right;
}

.nregdate {
	color: blue;
	float: left;
}

img {
	vertical-align: middle;
}

.w3-jumbo {
	
}

/* Slideshow container */
.slideshow-container {
	position: relative;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 2em;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
	background: black;
	opacity: 0.8;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.activity, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}
}
</style>
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li class="active"><a href="<c:url value='/news/dailyNews.do'/>"><i class='fa fa-newspaper-o'></i>
		&nbsp;<span>SIS 뉴스홈</span></a></li>
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
		<i class='fa fa-newspaper-o'></i>&nbsp;SIS 뉴스&nbsp;<a
			href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<!-- 3. 내용 -->

	<input type="hidden" class="sessionLv"
		value="${sessionScope.empVo.empLev}">
	<div class="testText" style="visibility: hidden;"></div>
	<div class="w3-light-grey w3-padding-32 w3-center">
		<h1 class="w3-jumbo" style="font-style: oblique;">SIS News</h1>
	</div>
	<div class="newsbtdiv">
		<input type="button" class="newsregbt" value="뉴스등록">
	</div>
	<br>
	<br>

	<!-- Slideshow container -->
	<div class="newsbigDiv">
		<div id="mainNews">
			<div class="slideshow-container">
				<c:if test="${!empty mainlist}">
					<c:forEach var="vo" items="${mainlist}">
						<c:set var="i"></c:set>
						<c:if test="${vo.newsMain=='Y'}">
							<!-- Full-width images with number and caption text -->
							<div class="mySlides fade">
								<div class="numbertext"></div>
								<img src="<c:url value='/news_images/${vo.newsImage }'/>"
									style="width: 100%; height: 500px;">

								<c:if test="${fn:length(vo.newsTitle)>30 }">
									<div class="text">
										<a
											href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
											[메인]${fn:substring(vo.newsTitle,0,30) }...</a>
									</div>
								</c:if>
								<c:if test="${fn:length(vo.newsTitle)<=30}">
									<div class="text">
										<a
											href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
											[메인]${vo.newsTitle}</a>
									</div>
								</c:if>
							</div>

						</c:if>
					</c:forEach>
				</c:if>



				<!-- Next and previous buttons -->
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<br>

			<!-- The dots/circles -->
			<div style="text-align: center">
				<span class="dot activity" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"> </span> <span class="dot"
					onclick="currentSlide(4)"> </span> <span class="dot"
					onclick="currentSlide(5)"></span>
			</div>
		</div>
	</div>
	<div class="importdiv">
		<c:import url="/news/topDailynews.do"></c:import>
	</div>
	<div class="clr"></div>
	<c:if test="${empty list }">
		<img src="<c:url value='/resources/images/error.png'/>" alt="에러이미지"
			id="errorimg">
		<h2>등록된 글이 없습니다.</h2>
	</c:if>
	<!-- 반복시작 -->
	<c:if test="${!empty list}">
		<div class="thirdnewsDiv">
			<c:forEach var="vo" items="${list}">
				<c:if test="${vo.newsMain=='N'}">
					<div class="newsmainDiv">
						<input type="hidden" class="newsImageChk" value=${vo.newsImage }>
						<c:if test="${!empty vo.newsImage }">
							<div class="dnewsImageDiv">
								<img src="<c:url value='/news_images/${vo.newsImage }'/>"
									style="width: 100%; height: 130px;">
							</div>
						</c:if>
						<c:if test="${empty vo.newsImage }">

						</c:if>
						<div class="dnewsContentDiv">
							<c:if test="${empty vo.newsImage }">
								<c:if test="${fn:length(vo.newsTitle)>25 }">
									<h4 class="dnewstitle">
										<a
											href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
											[일반]${fn:substring(vo.newsTitle,0,25) }...</a>
									</h4>
								</c:if>
								<c:if test="${fn:length(vo.newsTitle)<=25}">
									<h4 class="dnewstitle">
										<a
											href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
											[일반]${vo.newsTitle}</a>
									</h4>
								</c:if>

								<c:if test="${fn:length(vo.newsContent)>80 }">
									<div>${fn:substring(vo.newsContent,0,80) }...</div>
								</c:if>
								<c:if test="${fn:length(vo.newsContent)<=80}">
									<div>${vo.newsContent}</div>
								</c:if>
							</c:if>
							<c:if test="${!empty vo.newsImage }">
								<c:if test="${fn:length(vo.newsTitle)>20 }">
									<h4 class="dnewstitle">
										<a
											href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
											[포토]${fn:substring(vo.newsTitle,0,20) }...</a>
									</h4>
								</c:if>
								<c:if test="${fn:length(vo.newsTitle)<=20}">
									<h4 class="dnewstitle">
										<a
											href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">
											[포토]${vo.newsTitle}</a>
									</h4>
								</c:if>

								<c:if test="${fn:length(vo.newsContent)>65 }">
									<div>${fn:substring(vo.newsContent,0,65) }...</div>
								</c:if>
								<c:if test="${fn:length(vo.newsContent)<=65}">
									<div>${vo.newsContent}</div>
								</c:if>

							</c:if>
							<br>
							<div class="newsReg">
								<div class="nregdate">
									작성일 :
									<fmt:formatDate value="${vo.newsRegdate }"
										pattern="yyyy-MM-dd hh:mm" />
								</div>
								<div class="comcount">
									<i class="fa fa-commenting-o" aria-hidden="true">&nbsp;${vo.comCount }</i>
									<i class="fa fa-thumbs-o-up" aria-hidden="true">&nbsp;${vo.newsLike }</i>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
			<%--페이징 처리--%>
			<form name="frmPage" method="post"
				action="<c:url value='/news/dailyNews.do'/>">
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
		</div>
	</c:if>
	<!-- 반복끝 -->
	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 끝-->
<script type="text/javascript">
	var slideIndex = 1;
	showSlides(slideIndex);

	function pageFunc(curPage) {
        document.frmPage.currentPage.value = curPage;
        frmPage.submit();
    }
	
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" activity", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " activity";
	}
</script>
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>