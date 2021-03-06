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

    <script src="<c:url value="/resources/js/zipcode.js"/>"></script>
        
    <c:set var="userAgentInfo" value="${header['User-Agent']}" />
    <c:if test="${fn:indexOf(userAgentInfo, 'Linux') > 0 || fn:indexOf(userAgentInfo, 'iPhone') > 0 || fn:indexOf(userAgentInfo, 'iPad') > 0 }">
		<link rel='stylesheet' href="<c:url value='/resources/css/css_m/mainStyle_m.css'/>">
	    <script src="<c:url value='/resources/js/js_m/mainjs_m.js'/>"></script>
    </c:if>
    <c:if test="${fn:indexOf(userAgentInfo, 'Linux') <= 0 && fn:indexOf(userAgentInfo, 'iPhone') <= 0 && fn:indexOf(userAgentInfo, 'iPad') <= 0 }">
	 	<link rel='stylesheet' href='<c:url value="/resources/css/mainStyle.css"/>'>
	 	<script src='<c:url value="/resources/js/mainjs.js"/>'></script>
 	</c:if>

    <%-- firebase init --%>
    <script src="https://www.gstatic.com/firebasejs/4.8.0/firebase.js"></script>
    <script src="<c:url value="/resources/js/pagejs/firebase_init.js"/>"></script>

</head>
<body>
<!-- 상단부분 -->
<header>
    <h1><a href="<c:url value='/home.do'/>"><img src="${pageContext.request.contextPath }/resources/images/logo_w.png" alt=""></a></h1>
    <div id="navSlideBtn"><i class="fa fa-bars"></i></div>
    <nav>
        <ul>
            <li><a href="<c:url value='/home.do'/>">HOME</a></li>
            <li><a href="<c:url value='/addrBook/addrBookList.do'/>">주소록</a></li>
            <li><a href="<c:url value='/scheduler/scheduler.do'/>">스케줄</a></li>
            <li><a href="<c:url value='/resource/resource.do'/>">자원관리</a></li>
            <li><a href="<c:url value='/confirm/main.do'/>">전자결재</a></li>
            <li><a href="<c:url value='/commue/employeeMonthList.do?empNo=${sessionScope.empVo.empNo }'/>">근태관리</a></li>
            <li><a href="<c:url value='/webhard/main.do'/>">웹하드</a></li>
            <li><a href="<c:url value='/notice/noticeList.do'/>">공지사항</a></li>
            <li><a href="<c:url value='/news/dailyNews.do'/>">사내뉴스</a></li>
        </ul>
    </nav>
</header>
<div id="mainNavButton" class="hide"><i class="fa fa-th"></i></div>
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