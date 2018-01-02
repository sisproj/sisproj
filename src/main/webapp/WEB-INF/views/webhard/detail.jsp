<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
    <link rel="stylesheet" href="<c:url value='/resources/css/pagecss/webhard_detail.css'/>">
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
        <div id="requireDetail">
			<div id="divTitle">
				<span id="title">${wbVo.webTitle }</span>
				<span id="regdate"><fmt:formatDate value="${wbVo.webRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
			</div>
			<div id="divContent">
				${wbVo.webContent }
			</div>
			<div id=btns>
				<c:if test="${sessionScope.empVo.empNo == wbVo.empNo }">
					<a class="button" href="<c:url value='/webhard/edit.do?webNo=${wbVo.webNo }'/>" id="editbtn">수정</a>
					<a class="button" href="<c:url value='/webhard/delete.do?webNo=${wbVo.webNo }'/>" id="deletebtn">삭제</a>
				</c:if>
				<a class="button" href="<c:url value='/webhard/requireList.do'/>" id="listbtn">목록</a>
			</div>
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
	$('#deletebtn').click(function(){
		if(!confirm('이 글을 정말 삭제 하시겠습니까?')){
			return false;
		}
	});
</script>