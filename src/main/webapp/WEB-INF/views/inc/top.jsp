<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page session="false" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>

    <!-- font icon, FA -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mainStyle.css"/>">
    <!-- jquery-ui css -->
    <link rel="stylesheet" href="<c:url value="/resources/jquery-ui/jquery-ui.min.css"/>">

    <!-- jquery -->
    <script src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/jquery/jquery.easing.1.3.js"/>"></script>
    <!-- jquery-ui -->
    <script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/>"></script>

    <!-- mainjs -->
    <script src="<c:url value="/resources/js/mainjs.js"/>"></script>
</head>
<body>
<!-- 상단부분 -->
<header>
    <h1><a href="#"><img src="<c:url value="/resources/images/logo_w.png"/>" alt=""></a></h1>
    <nav>
        <ul>
            <li><a href="#">HOME</a></li>
            <li><a href="#">주소록</a></li>
            <li><a href="#">메신저</a></li>
            <li><a href="#">스케줄</a></li>
            <li><a href="#">자원관리</a></li>
            <li><a href="#">전자결재</a></li>
            <li><a href="#">근태관리</a></li>
            <li><a href="#">웹하드</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">사내뉴스</a></li>
        </ul>
    </nav>
</header>
<section>
    <div id="bookmark" class="hidden">
        <div id="bookmarkbtn">
            <i class="fa fa-bookmark" aria-hidden="true"></i>
            <span class="bold" style="display:none">Bookmark</span>
        </div>
        <ul>
            <!-- 북마크 리스트 -->
            <li>
                <hr>
            </li>
            <li><a href="#"><i class="fa fa-pencil-square-o"></i><span style="display:none">&nbsp;전자결재</span></a></li>
            <li><a href="#"><i class="fa fa-calendar"></i><span style="display:none">&nbsp;스케쥴</span></a></li>
            <li><a href="#"><i class="fa fa-id-badge"></i><span style="display:none">&nbsp;근태관리</span></a></li>
            <!-- 북마크 리스트 끝 -->
        </ul>
    </div>
    <!-- 왼쪽 사이드 메뉴 -->
    <aside>
        <div id="loginfo">
            <div id="photo">
                <img src="<c:url value="/resources/images/avatar.png"/>" alt="사진이미지">
            </div>
            <div id="info">
                <ul>
                    <li><i class="fa fa-id-card"></i>&nbsp;<span class="name bold">이름(id)</span></li>
                    <li><i class="fa fa-cog"></i>&nbsp;<span><a href="#">개인정보수정</a></span></li>
                    <li><i class="fa fa-envelope"></i>&nbsp;<span><a href="#">쪽지</a></span>&nbsp;<span
                            class="red">0</span></li>
                    <li><i class="fa fa-comments"></i>&nbsp;<span><a href="#">대화</a></span>&nbsp;<span
                            class="red">0</span></li>
                    <li><i class="fa fa-pencil-square-o"></i>&nbsp;<span><a href="#">결재할 문서</a></span>&nbsp;<span
                            class="red">0</span></li>
                </ul>
            </div>
            <div id="asidebtn">
                <ul>
                    <li><a href="#">출근</a></li>
                    <li><a href="<c:url value='/login.do'/>">로그 아웃</a></li>
                </ul>
            </div>

        </div>
        <div id="organ">
            <div id="organtitle"><span>조직도</span><i class="fa fa-chevron-up" aria-hidden="true"></i></div>
            <div id="organbody">
            </div>
        </div>