<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/admTop.jsp" %>
<style type="text/css">
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}		
</style>

<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script type="text/javascript">

var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "serial",
	  "theme": "light",
	  "dataProvider": [ {
	    "country": "USA",
	    "visits": 2025
	  }, {
	    "country": "China",
	    "visits": 1882
	  }, {
	    "country": "Japan",
	    "visits": 1809
	  }, {
	    "country": "Germany",
	    "visits": 1322
	  }, {
	    "country": "UK",
	    "visits": 1122
	  }, {
	    "country": "France",
	    "visits": 1114
	  }, {
	    "country": "India",
	    "visits": 984
	  }, {
	    "country": "Spain",
	    "visits": 711
	  }, {
	    "country": "Netherlands",
	    "visits": 665
	  }, {
	    "country": "Russia",
	    "visits": 580
	  }, {
	    "country": "South Korea",
	    "visits": 443
	  }, {
	    "country": "Canada",
	    "visits": 441
	  }, {
	    "country": "Brazil",
	    "visits": 395
	  } ],
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
	  "categoryField": "country",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "gridAlpha": 0,
	    "tickPosition": "start",
	    "tickLength": 20
	  },
	  "export": {
	    "enabled": true
	  }

});
</script>
<!-- 0. include부분 -->
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
<script type="text/javascript">
	$(function () {	
		$.setToday();
		
	});
	
	$.setToday=function(){		
			var today = new Date();
			var str = $.convertDate(today); 
			
			$('#spDate').html(str);
	}	
	
	$.convertDate=function(today){
		return today.getFullYear()+"년 "+(today.getMonth()+1)+"월";
	}
</script>
          <!-- 0. include부분 -->
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
			<div id="diCal">	
				<span id="spDate"></span>
			</div>
			<div id="diSearch" style="margin-left: 10px;">
					<input type="button" id="btSearch" value="검색">
			</div>
	</div>
<div id="chartdiv"></div>
<%@include file="commueBottom.jsp" %>