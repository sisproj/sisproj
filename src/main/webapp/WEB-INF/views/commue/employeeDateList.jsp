<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function () {	
		if($('#startDay').val()==''){
			$.setToday();
		}
		$('#btSearch').submit(function () {
			$.setChDate();	
		});
		$.applyDatePicker('#startDay');
	});
	
	$.setToday=function(){		
			var today = new Date();
			var str = $.convertDate(today); 

			$('#spDate').html(str);
	}	
	$.setChDate=function(){
		var chD = $.applyDatePicker('#startDay').val();
		
		$('#spDate').html(chD);
	}
	$.convertDate=function(today){
		return today.getFullYear()+" "+(today.getMonth()+1)+"월 "+today.getDate()+"일";
	}
	
	$.convertMonth=function(today){
		return today.getFullYear()+"-"+$.formatDate((today.getMonth()+1))+"-"+$.formatDate(today.getDate());
	}
	
	$.convertTime=function(today){
		return today.getHour()+":"+today.getMinutes();
	}
	$.applyDatePicker=function(id){
		$(id).datepicker({			
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
	}
	$.formatDate = function(d){
		var result=d;
		if(d<10){
			result="0"+d;
		}
		return result;
	}
</script>
</head>
<body>
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="<c:url value='/commue/commueDateList.do'/>"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<span>일별 근태현황</span></a></li>
                <li><a href="<c:url value='/commue/commueMonthList.do'/>"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;<span>월별 근태현황</span></a></li>        
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
	<form name="frmDate" id="frmDate" method="post" action="<c:url value='/commue/commueDateList.do' />">
			<div id="diSearch" style="margin-left: 10px;">
					<input type="text" name="startDay" id="startDay" 
						value="${dateSearchVO.startDay }" placeholder="누르시면 달력이나옵니다."> 
					<input type="submit" id="btSearch" value="검색">
			</div>
	</form>
			</div>
	<div id="dimyPage">
		<table id="DList" border="1" >
		<colgroup>
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="20%">
			<col width="20%">
			<col width="15%">
		</colgroup>
				<tr>
					<th>사원이름</th>
					<th>부서명</th>
					<th>직급</th>
					<th>출근</th>
					<th>퇴근</th>		
					<th>상태</th>
				</tr>	
		<c:if test="${!empty list }">
			<c:forEach var="map" items="${list }">
				<tr>
					<td><a href="<c:url value='' />">${map['EMP_NAME'] }</a></td>
					<td>${map['DEPT_NAME'] }</td>
					<td>${map['POS_NAME'] }</td>
					<td id="cmtT">${map['CMTIN'] }</td>
					<td id="cmtT">${map['CMTOUT'] }</td>
					<c:if test="${map['CMT_STATUS'] eq ('Y') }">
						<td>출근</td>	
					</c:if>
					<c:if test="${map['CMT_STATUS'] eq ('N') }">
						<td>퇴근</td>
					</c:if>
					<c:if test="${empty map['CMT_STATUS'] }">
						<td>기록이 없습니다</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
			</table>
	</div>
</body>
</html>
<%@include file="commueBottom.jsp" %>