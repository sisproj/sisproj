<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<link href="<c:url value='/resources/css/pagecss/confirm_write.css'/>"
	rel="stylesheet" type="text/css">
	<script>
	$(function(){
    var editor_object = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "taNewsWrite",
        sSkinURI: "<c:url value='/resources/se2/SmartEditor2Skin.html'/>",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
});
</script>

<!-- 0. include부분 -->
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li class="active"><a href="<c:url value='/news/news.do'/>"><i
				class="fa fa-pencil-square-o"></i>&nbsp;<span>뉴스 홈</span></a></li>
		<li><a href="#"><i class="fa fa-floppy-o"></i>&nbsp;<span>SIS
					사내뉴스</span></a></li>
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
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;뉴스 등록&nbsp;<a
			href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<!-- 3. 내용 -->
	<form action="/newsWriteOk.do" method="post" id="newsFrm">
	
	<label>제목:</label><input type="text" id="newsTitle">
    <textarea name="taNewsWrite" id="taNewsWrite" rows="10" cols="100" style="width:100%; height:450px;"></textarea>
    <input type="button" id="savebutton" value="뉴스등록" />
    <input type="button" id="nobutton" value="취소" />
</form>

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