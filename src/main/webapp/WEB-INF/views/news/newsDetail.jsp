<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/w3/w3.css'/>">
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function() {
		var empNo='${sessionScope.empVo.empLev}';
		$(".comContent").keydown(function (key) {
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	           $('form[name=newsComfrm]').submit();
	        }
	 
	    });
		if(empNo!=$('.empNochk').val()){
			$('.editdeletechk').css('visibility','hidden');
		} 
		
		$('#clickLike').click(function() {
			location.href="<c:url value='/news/newsLike.do?newsNo=${newsVo.newsNo}'/>";
		});
		
		$('#btnewsEdit').click(function () {
			location.href="<c:url value='/news/newsEdit.do?newsNo=${newsVo.newsNo}'/>";
		}); 
		$('#newshomego').click(function () {
			location.href="<c:url value='/news/dailyNews.do'/>";
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
.newsDtitle{
text-align:center;
}

.newsregdate{
	color:blue; 
}
.readcnt{
	color: gray;
}

.nocommantd{
	color: gray;
	text-align: center;
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
.newsempname{
	font-weight: bold;
}
#reclabel{
	font-weight: bold;
}
.editdeletechk{
	float:right;
}

.comsubmit{
width:9%;
display: inline-block;
height:45px; 
float:right;
} 
</style>
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		
		<li class="active"><a href="<c:url value='/news/dailyNews.do'/>"><i class='fa fa-newspaper-o'></i>&nbsp;<span>SIS 뉴스홈</span></a></li>
			<c:if test="${sessionScope.empVo.empLev eq '관리자'}">
		<li><a href="<c:url value='/news/newsWrite.do'/>"><i
				class="fa fa-floppy-o"></i>&nbsp;<span>SIS 뉴스등록</span></a></li>
		
		<li><a href="<c:url value='/news/newsRegdit.do'/>"><i
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
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;뉴스 보기&nbsp;<a
			href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<!-- 3. 내용 -->
	<input type="hidden" id="newsDetailempLv" name="newsDetailempLv"  value="${sessionScope.empVo.empLev  }">
	<div id="newsDmain">
		<hr>
		<div id="newsDTitle">
			<h3 class="newsDtitle">${newsVo.newsTitle }</h3>
			<div>
				<span class="newsregdate">기사입력 : <fmt:formatDate value="${newsVo.newsRegdate }"
						pattern="yyyy-MM-dd hh:MM" />
			</span>
					<div id="newsbtgroup">
						<span class="readcnt">조회수 : ${newsVo.newsReadCnt }</span>
						<input type="button" id="btnewsEdit" value="수정" > 
						<input type="button" id="btnewsDelete" value="삭제">
					</div>
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
		<form id="newsComfrm" method="post" action="<c:url value='/news/comWrite.do'/>">
		<input type="hidden" id="newsNo" name="newsNo" value="${newsVo.newsNo }">
		
		<span id="reclabel">댓글   ${list.size() }개</span>&nbsp;&nbsp;&nbsp;<input type="button" id="newshomego" value="목록으로">
		<div id="rectext"><input type="text" id="comContent" name="comContent" style="width: 90%; height:45px;"><input class="comsubmit" type="submit" value="댓글등록"></div>
		
		<c:if test="${empty list }">
		<hr>
		<span class="nocommantd">등록된 댓글이 없습니다.</span>
		</c:if>
		<!-- 댓글 반복시작 -->
		<hr>
		<c:forEach var="map" items="${list }">
		<input type="hidden" class="empNochk" value="${map['EMP_NO'] }">
		<label class="newsempname">${map['EMP_NAME'] } ${map['EMP_LEV'] }</label><br>
		${map['COM_CONTENT'] }<br>
		<fmt:formatDate value="${map['COM_REGDATE'] }" pattern="yyyy-MM-dd hh:mm:ss"/>
		
		<div class="editdeletechk">
		<a href="<c:url value="/news/newsComDelete.do?comNo=${map['COM_NO'] }&newsNo=${newsVo.newsNo }"/>">삭제</a>
		</div> 
		<br>
		<hr>
		</c:forEach>		
		
		<!-- 댓글 반복 끝 -->
		</form>
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