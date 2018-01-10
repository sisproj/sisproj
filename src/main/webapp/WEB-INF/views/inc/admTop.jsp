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

    <script src="https://www.gstatic.com/firebasejs/4.8.0/firebase.js"></script>
    <script src="<c:url value="/resources/js/pagejs/firebase_init.js"/>"></script>

</head>
<body>
<!-- 상단부분 -->
<header>
    <h1><a href="<c:url value='/home.do'/>"><img src="${pageContext.request.contextPath }/resources/images/logo_admin.png" alt=""></a></h1>
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
      	<nav>
			<ul>
				<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="<c:url value='/employee/adm/adminEmployeeRegister.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>사원 등록</span></a></li>
                <li><a href="<c:url value='/employee/adm/adminEmployeeList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>사원 리스트 </span></a></li>         
                <li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>결재양식관리 </span></a></li>                          
                <li><a href="<c:url value='/commue/adm/adminDateList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>일별 근태현황 </span></a></li>                          
                <li><a href="<c:url value='/commue/adm/adminMonthList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>월별 근태현황 </span></a></li>                          
                <li><a href="<c:url value='/notice/adm/noticeWrite.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>공지사항 등록 </span></a></li>                          
                <li><a href="<c:url value='/news/adm/newsWrite.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스등록 </span></a></li>                          
                <li><a href="<c:url value='/news/adm/newsRegdit.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스관리 </span></a></li>
                <li><a href="<c:url value='/resource/adm/reservationList.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>자원 사용 현황</span></a></li> 
                <li><a href="<c:url value='/resource/adm/resourceList.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>자원 목록/등록</span></a></li> 
			</ul>	
			<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
			<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
		</nav>
	</aside>