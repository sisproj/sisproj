<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function() {
		$('#clickLike').click(function() {
			$(this).css("color", "blue");
		});
		
		$('#btnewsEdit').click(function () {
			location.href="<c:url value='/news/newsEdit.do?newsNo=${newsVo.newsNo}'/>";
		}); 
		$('#btnewsDelete').click(function () {
			var result = confirm("정말 ${newsVo.newsNo}번 뉴스를 삭제하시겠습니까?"); 
			if(result) { 
				location.href="<c:url value='/news/newsDelete.do?newsNo=${newsVo.newsNo}&newsImage=${newsVo.newsImage}'/>";
			} else { 
			
			}
			
		}); 
		

	});
	
	
</script>

<style>
#newsDmain {
	width: 60%;
	margin: 0 auto;
}

#likeCount {
	margin: 0 auto;
	border: 3px solid blue;
	border-radius: 1.1em;
	text-align: center;
	width: 100px;
	height: 80px;
	clear: both;
	border: 3px solid blue;
}

#like {
	border-top: 1px solid black;
	font-size: 2em;
}

#clickLike {
	font-size: 2em;
	cursor: pointer;
}

#newsbtgroup{
	float:right;
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
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;뉴스 보기&nbsp;<a
			href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<!-- 3. 내용 -->
	<div id="newsDmain">
		<hr>
		<div id="newsDTitle">
			<h3>${newsVo.newsTitle }</h3>
			<div>
				<span>기사입력 : <fmt:formatDate value="${newsVo.newsRegdate }"
						pattern="yyyy-MM-dd hh:MM" />
					<div id="newsbtgroup">
						<input type="button" id="btnewsEdit" value="수정" > 
						<input type="button" id="btnewsDelete" value="삭제">
					</div>
			</span>
			</div>
		</div>
		<hr>
		<div id="newsDContent">
		<c:if test="${newsVo.newsImage==null }">
			<div></div>
		</c:if>
		<c:if test="${newsVo.newsImage!=null }">
			<img src="<c:url value='/news_images/${newsVo.newsImage }'/>"
				style="width: 100%; max-height: 500px; min-height: 200px">
		</c:if>
			<h3>${newsVo.newsContent }</h3>
		</div>
		<div id="likeCount">
			<i class="fa fa-thumbs-up" id="clickLike"></i>추천
			<div id="like">${newsVo.newsLike}</div>
		</div>
		<hr>
		
		<span id="reclabel">댓글</span>
		<div id="rectext"><textarea style="width: 100%" rows="2"></textarea></div>
	
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