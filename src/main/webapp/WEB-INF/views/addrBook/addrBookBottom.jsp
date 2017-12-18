<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <!-- 4. 상단 네비 색먹이기 // li태그 순서(주소록 : 2번) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(2) a').addClass('active');
        });
    </script>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <!-- 0. include부분 끝-->
    <%@include file="../inc/bottom.jsp" %>    