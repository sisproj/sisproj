<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="inc/top.jsp" %>

<%-- <!-- mobile -->
<link rel="stylesheet" href="<c:url value='/resources/css/css_m/home_m.css'/>"> --%>

<!-- 모바일, PC 구분 -->
<c:set var="userAgentInfo" value="${header['User-Agent']}" />
<c:if test="${fn:indexOf(userAgentInfo, 'Linux') > 0 || fn:indexOf(userAgentInfo, 'iPhone') > 0 || fn:indexOf(userAgentInfo, 'iPad') > 0 }">
	<link rel="stylesheet" href="<c:url value='/resources/css/css_m/home_m.css'/>">
</c:if>
<c:if test="${fn:indexOf(userAgentInfo, 'Linux') <= 0 && fn:indexOf(userAgentInfo, 'iPhone') <= 0 && fn:indexOf(userAgentInfo, 'iPad') <= 0 }">
	<link rel="stylesheet" href="<c:url value='/resources/css/pagecss/home.css'/>">
</c:if>

        <!-- 0. include부분 -->
        <nav>
	        <div id="clockSection">
	        	<c:import url="/clock.do"></c:import>
	        </div>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="homesection">
        <div id="mainbanner">
        	<!-- 모바일, PC 구분 -->
		<c:if test="${fn:indexOf(userAgentInfo, 'Linux') > 0 || fn:indexOf(userAgentInfo, 'iPhone') > 0 || fn:indexOf(userAgentInfo, 'iPad') > 0 }">
			<c:import url="/mainbanner_m.do" />
		</c:if>
		<c:if test="${fn:indexOf(userAgentInfo, 'Linux') <= 0 && fn:indexOf(userAgentInfo, 'iPhone') <= 0 && fn:indexOf(userAgentInfo, 'iPad') <= 0 }">
			<c:import url="/mainbanner.do" />
		</c:if>
        </div>
        <div id="mainCalendar">
        	<c:import url="/scheduler/sideScheduler.do" />
        </div>
        <div class="clr"></div>
        <div id="mainTable">
        	<div id="mainNoti">
	        	<h4><i class="fa fa-bullhorn"></i> 공지사항 <a href="<c:url value='/notice/noticeList.do'/>">more</a></h4>
	       		<table>
	       			<thead>
	        			<tr>
	        				<th>첨부</th>
	        				<th>제목</th> 
	        				<th>날짜</th> 
	        			</tr>
	       			</thead>
	       			<tbody>
	        			<c:import url="/mainNotice.do" />
	       			</tbody>
	       		</table>
        	</div>
        	<div id="mainConfirm">
        		<h4><i class="fa fa-book"></i> 결재 대기 <a href="<c:url value='/confirm/await.do'/>">more</a></h4>
        		<table>
        			<thead>
	        			<tr>
	        				<th>제목</th>
	        				<th>기안자</th>
	        				<th>기안일</th>
	        			</tr>
        			</thead>
        			<tbody>
	        			<c:import url="/awaitList.do"></c:import>
        			</tbody>
        		</table>
        	</div>
        	<div id="mainMessage">
        		<h4><i class="fa fa-envelope"></i> 받은 쪽지함<a href="<c:url value='/message/receive.do'/>">more</a></h4>
        		<table>
        			<thead>
	        			<tr>
	        				<th>제목</th>
	        				<th>발신인</th>
	        				<th>날짜</th>
	        			</tr>
        			</thead>
        			<tbody>
							<c:import url="/message/messageBanner.do"></c:import>
        			</tbody>
        		</table>
        	</div>
        </div>
    </article>
    <!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(1) a').addClass('active');
            
            $('#organ').css('height', '425px');
			$('#orgUp').hide();
			$('#orgDown').hide();
			$('#organbody').show();
        });
    </script>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <!-- 0. include부분 끝-->
<%@include file="inc/bottom.jsp" %>