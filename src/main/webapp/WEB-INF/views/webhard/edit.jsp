<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
    <link rel="stylesheet" href="<c:url value='/resources/css/pagecss/webhard_write.css'/>">
        <!-- 0. include부분 -->
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="<c:url value='/webhard/main.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>웹하드</span></a></li>
                <li><a href="<c:url value='/webhard/requireList.do'/>"><i class="fa fa-list-alt"></i>&nbsp;<span>요청 게시판</span></a></li>
                <li class="active"><a href="<c:url value='/webhard/write.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>요청 글 쓰기</span></a></li>
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-list-alt"></i>&nbsp;요청 글 쓰기&nbsp;<a href="#"><i class="fa fa-bookmark"></i></a></h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
        <div id="requireWrite">
	        <form name="writeFrm" id="writeFrm" method="post" action="<c:url value='/webhard/edit.do'/>">
	        	<input type="hidden" name="webNo" value="${wbVo.webNo }">
				<div id="divTitle">
					<label for="title">제목</label><input id="title" name="webTitle" value="${wbVo.webTitle }">
				</div>
				<div id="divContent">
					<textarea id="ir1" name="webContent">${wbVo.webContent }</textarea>
				</div>
				<div id="btns">
					<input type="submit" value="수정등록">
					<a href="<c:url value='/webhard/requireList.do'/>" class="button">목록보기</a>
				</div>
			</form>
		</div>
        <!-- 3. 내용 끝 -->
    </article>
    <!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(7) a').addClass('active');
        });
    </script>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>
<script>
	function submitContents() {
		 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	}
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "/sisproj/resources/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
	$('#writeFrm').submit(function(){
		submitContents();
	});
</script>