<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
        <!-- 0. include부분 -->
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li class="active"><a href="#"><i class="fa fa-floppy-o"></i>&nbsp;<span>웹하드</span></a></li>
                <li class="active"><a href="#"><i class="fa fa-floppy-o"></i>&nbsp;<span>요청사항</span></a></li>
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-floppy-o"></i>&nbsp;웹하드&nbsp;<a href="#"><i class="fa fa-bookmark"></i></a></h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
        <div id="fileZone">
        	Drag n Drop Here
        	<form name="upfileFrm" id="upfileFrm" method="post" action="" enctype="multipart/form-data">
        		<input type="file" name="upfile" multiple="multiple">
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