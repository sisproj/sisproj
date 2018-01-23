<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/admTop.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<!-- 0. include부분 -->
<style type="text/css">
#chartOne {
  width: 60%;
  height:450px;
  float: right;
}
#chartStick {
	width	: 40%;
	height: 400px;
	font-size: 11px;
	float: left;
}					
</style>
<script type="text/javascript">
	$(function () {		
		$('#startDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});	
		var start = $('#startDay option').val();
		var today = new Date();
		
		if(start==''){
			$.convertDate(today)
		}
	});
	 $.convertDate=function(date){
			return date.getFullYear()+"-"+$.formatDate(date.getMonth()+1)+"-"
			 + $.formatDate(date.getDate());
	}
	 $.formatDate = function(d){
			var result=d;
			if(d<10){
				result="0"+d;
			}
			return result;
		}
	/* 그래프 차트 */
 	var chart = AmCharts.makeChart( "chartStick", {
		  "type": "serial",
		  "theme": "light",
		  "dataProvider": [
	 	 <c:set var="allCnt" value="${allCnt}" />
		 <c:forEach var="map" items="${list}">
			 <c:if test="${!empty map['TOTAL']}">
				  {
			    "deptName": "${map['DEPTNAME']}",
			    "visits": ${map['TOTAL']}
			  },			  
			  </c:if>
		  </c:forEach>
		  ],
		  "valueAxes": [ {
		    "gridColor": "#FFFFFF",
		    "gridAlpha": 0.2,
		    "dashLength": 0
		  } ],
		  "gridAboveGraphs": true,
		  "startDuration": 1,
		  "graphs": [ {
		    "balloonText": "[[category]]: <b>[[value]]</b>",
		    "fillAlphas": 0.8,
		    "lineAlpha": 0.2,
		    "type": "column",
		    "valueField": "visits"
		  } ],
		  "chartCursor": {
		    "categoryBalloonEnabled": false,
		    "cursorAlpha": 0,
		    "zoomable": false
		  },
		  "categoryField": "deptName",
		  "categoryAxis": {
		    "gridPosition": "start",
		    "gridAlpha": 0,
		    "tickPosition": "start",
		    "tickLength": 20
		  },
		  "export": {
		    "enabled": true
		  }

		} );
	
	/* 원형 차트 */
	var chart = AmCharts.makeChart( "chartOne", {
		  "type": "pie",
		  "theme": "light",
		  "dataProvider": [ 
		 /*  <c:if test="${empty list}">			 
				  {
				    "deptName": "데이터가없습니다",
				    "litres": 0
				  },							  				  
		 </c:if>	   */ 
		 <c:if test="${!empty list}">
		 <c:forEach var="map" items="${list}">
				  {
			    "deptName": "${map['DEPTNAME']}",
			    "litres": ${map['TOTAL']}
			  },			  
		  </c:forEach>
		  </c:if>
		  ],
		  "valueField": "litres",
		  "titleField": "deptName",
		   "balloon":{
		   "fixedPosition":true
		  },
		  "export": {
		    "enabled": true
		  }
		} );
</script>
</head>
<body>

    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;일별 근태현황&nbsp;
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
     <div id="dimyPage">		
	    <div id="diBtCa">
		   <div id="diCal">
		   			<c:if test="${empty param.startDay }">
		   				<span id="spDa"></span>
		   			</c:if>
		   			<c:if test="${!empty param.startDay }">
		   				<c:set var="date" value="${fn:split(param.startDay, '-') }" />
						<span id="spDate">${date[0] }년 ${date[1] }월 ${date[2] }일</span>
					</c:if>
			</div>	
			</div>
	    <div>
			<div id="chartOne"></div>
			<div id="chartStick"></div>
		</div>
   
				<div id="seYear">		
				<div class="clr"></div>
					<form name="frmDate" id="frmDate" method="post" action="<c:url value='/commue/adm/adminDateList.do' />">
							<input type="text" id="startDay" name="startDay" placeholder="누르시면 달력이 나옵니다." value="${param.startDay }">
							<input type="submit" id="yeSear" name="yeSear" value="검색">
					</form>			
				</div>	
					<table border="1" id="allList">
					<c:if test="${empty list }">
						<tr>
							<th>부서</th>
							<th>데이터가 없습니다</th>
						</tr>
						<tr>
							<th>출근 인원</th>
							<th>데이터가 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<tr>					
							 <th>부서</th>
							 <c:forEach var="map" items="${list }">	
								<th>${map['DEPTNAME'] }</th>	
							</c:forEach>							
						</tr>	
						<tr>	
							<th>출근 인원</th>
							 <c:forEach var="map" items="${list }">		
								<c:if test="${!empty map['TOTAL'] }">	
									<td>${map['TOTAL'] }명</td>	
								</c:if>					
							</c:forEach>	
						</tr>	
					</c:if>									
				</table>
			</div>			
			</div>
		</div>
<%@include file="commueBottom.jsp" %>