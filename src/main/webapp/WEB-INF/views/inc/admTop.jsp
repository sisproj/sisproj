<%@page import="com.siszo.sisproj.employee.model.EmployeeVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>

    <!-- font icon, FA -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/adminStyle.css"/>">
    <!-- jquery-ui css -->
    <link rel="stylesheet" href="<c:url value="/resources/jquery-ui/jquery-ui.min.css"/>">

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="<c:url value="/resources/jquery/jquery.easing.1.3.js"/>"></script>
    <!-- jquery-ui -->
    <script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/>"></script>
    <!-- smart editor 2.0 -->
    <script type="text/javascript" src="<c:url value='/resources/se2/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script>
    <!-- mainjs -->

    <script src="<c:url value="/resources/js/mainjs.js"/>"></script>
    <script src="<c:url value="/resources/js/zipcode.js"/>"></script>

</head>
<body>
<!-- 상단부분 -->
<header>
    <h1><a href="<c:url value='/home.do'/>"><img src="${pageContext.request.contextPath }/resources/images/logo_admin.png" alt=""></a></h1>
    <%-- <nav>
        <ul>
            <li><a href="<c:url value='/home.do'/>">HOME</a></li>
            <li><a href="<c:url value='/addrBook/addrBookList.do'/>">주소록</a></li>
            <li><a href="<c:url value='/scheduler/scheduler.do'/>">스케줄</a></li>
            <li><a href="<c:url value='/resource/resource.do'/>">자원관리</a></li>
            <li><a href="<c:url value='/confirm/main.do'/>">전자결재</a></li>
            <li><a href="<c:url value='/commue/commueMonthList.do'/>">근태관리</a></li>
            <li><a href="<c:url value='/webhard/main.do'/>">웹하드</a></li>
            <li><a href="<c:url value='/notice/noticeList.do'/>">공지사항</a></li>
            <li><a href="<c:url value='/news/dailyNews.do'/>">사내뉴스</a></li>
        </ul>
    </nav> --%>
</header>
<section>
    <div id="bookmark" class="hidden">
       <c:import url="/bookmark/bookmark.do" />
    </div>
    <!-- 왼쪽 사이드 메뉴 -->
    <aside>
  <!--   상단 좌측 사진과 정보가 나오는 페이지는 view/login/empInfo.jsp에 있습니다  -->
        <div id="loginfo">
            <c:import url="/login/empInfo.do"></c:import>
        </div>
        <div id="organ">
            <c:import url="/organization/orgList.do"/>
        </div>