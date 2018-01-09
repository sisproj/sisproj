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
  height:500px;
  float: right;
}
#chartStick {
	width		: 40%;
	height		: 500px;
	font-size	: 11px;
	float: left;
}					
</style>
<script type="text/javascript">
	$(function () {	
		if($('#startDay').val()==''){
			$.setToday();
		}
	});
	
	$.setToday=function(){		
			var today = new Date();
			var str = $.convertDate(today); 

			$('#spDate').html(str);
	}	
	
	$.setChDate=function(){
		$('#spDate').html(chD);
	}
	
	$.convertDate=function(today){
		return today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일";
	}
	
	$.convertMonth=function(today){
		return today.getFullYear()+"-"+$.formatDate((today.getMonth()+1))+"-"+$.formatDate(today.getDate());
	}
	
	$.convertTime=function(today){
		return today.getHour()+":"+today.getMinutes();
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
		
		  <c:if test="${empty lists}">
			 <c:forEach var="i" begin="1" end="12">
						 {
						    "month": ${i}, 
						    "visits": 0
						  },			  
			</c:forEach>						  				  
		 </c:if>	  
		 <c:forEach var="map" items="${lists}">
			 <c:if test="${!empty map['CMTIN']}">
				  {
			    "month": ${map['CMTIN']},
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
			  {
		    "deptName": "Lithuania",
		    "litres": 501.9
		  },
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
        <h1><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;근태 현황&nbsp;
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
    <div id="dimyPage">	
			<div id="diBtCa">
				<div id="diCal">
					<span id="spDate"></span>
				</div>			
			<form name="frmDate" id="frmDate" method="post" action="<c:url value='/commue/adm/employeeDateList.do' />">
				<input type="hidden" id="currentPage" name="currentPage" value="1">
			</form>
			</div>
		</div>
	<div>
	<div id="chartOne"></div>
	<div id="chartStick"></div>
	</div>
<%@include file="commueBottom.jsp" %>