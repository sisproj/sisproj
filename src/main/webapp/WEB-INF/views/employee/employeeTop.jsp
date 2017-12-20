<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
     <!-- 0. include부분 -->
         <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                 <li><a href="<c:url value='/employee/employeeRegister.do'/>"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<span>사원 등록</span></a></li>
                <li><a href="<c:url value='/employee/employeeList.do'/>"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;<span>사원 리스트 </span></a></li>                         
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    
        <!-- 2. 페이지 이름 지정 끝 -->
        