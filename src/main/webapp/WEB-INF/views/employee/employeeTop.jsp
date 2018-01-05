<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp" %>
     <!-- 0. include부분 -->
        <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
        <c:if test="${sessionScope.empVo.empLev eq ('관리자') }">
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="<c:url value='/employee/employeeRegister.do'/>"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<span>사원 등록</span></a></li>
                <li><a href="<c:url value='/employee/employeeList.do'/>"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;<span>사원 리스트 </span></a></li>         
                <li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>결재양식관리 </span></a></li>                          
                <li><a href="<c:url value='/commue/commueDateList.do'/>"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<span>일별 근태현황 </span></a></li>                          
                <li><a href="<c:url value='/commue/commueMonthList.do'/>"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;<span>월별 근태현황 </span></a></li>                          
                <li><a href="<c:url value='/notice/noticeWrite.do'/>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;<span>공지사항 등록 </span></a></li>                          
                <li><a href="<c:url value='/news/newsWrite.do'/>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스등록 </span></a></li>                          
                <li><a href="<c:url value='/news/newsRegdit.do'/>"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스관리 </span></a></li>                          
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
        </c:if>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    
        <!-- 2. 페이지 이름 지정 끝 -->
        