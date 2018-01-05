<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
<script type="text/javascript">
	$(function () {	
		$.setToday();
		
		$.applyDatePicker('#startDay');
		$.applyDatePicker('#endDay');
	});
	
	$.setToday=function(){		
			var today = new Date();
			var str = $.convertDate(today); 
			
			$('#spDate').html(str);
	}	
	
	$.convertDate=function(today){
		return today.getFullYear()+" "+(today.getMonth()+1)+"월 "+today.getDate()+"일";
	}
	
	$.applyDatePicker=function(id){
		$(id).datepicker({			
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
	}
</script>
          <!-- 0. include부분 -->
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="<c:url value='/employee/employeeRegister.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>사원 등록</span></a></li>
                <li><a href="<c:url value='/employee/employeeList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>사원 리스트 </span></a></li>         
                <li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>결재양식관리 </span></a></li>                          
                <li><a href="<c:url value='/commue/commueDateList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>일별 근태현황 </span></a></li>                          
                <li><a href="<c:url value='/commue/commueMonthList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>월별 근태현황 </span></a></li>                          
                <li><a href="<c:url value='/notice/noticeWrite.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>공지사항 등록 </span></a></li>                          
                <li><a href="<c:url value='/news/newsWrite.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스등록 </span></a></li>                          
                <li><a href="<c:url value='/news/newsRegdit.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스관리 </span></a></li>                               
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>     
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;근태 현황&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
	<div id="dimyPage">	
			<div id="diBtCa">
				<div id="diCal">	
					<span id="spDate"></span>
				</div>
				<div id="diSearch" style="margin-left: 10px;">
						<input type="text" name="startDay" id="startDay" 
							value="${dateSearchVO.startDay }" placeholder="누르시면 달력이나옵니다."> 
						<input type="button" id="btSearch" value="검색">
				</div>
			</div>