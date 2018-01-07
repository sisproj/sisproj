<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<!-- 0. include부분 -->
<style type="text/css">
	#chartdiv {
  width: 100%;
  height: 500px;
}
</style>
<script type="text/javascript">
	$(function () {	
		if($('#startDay').val()==''){
			$.setToday();
		}
		
		 $('header nav ul li:nth-child(6) a').addClass('active');
		 
		 var chart = AmCharts.makeChart( "chartdiv", {
			  "type": "pie",
			  "theme": "light",
			  "dataProvider": [ {
			    "country": "Lithuania",
			    "litres": 501.9
			  }, {
			    "country": "Czech Republic",
			    "litres": 301.9
			  }, {
			    "country": "Ireland",
			    "litres": 201.1
			  }, {
			    "country": "Germany",
			    "litres": 165.8
			  }, {
			    "country": "Australia",
			    "litres": 139.9
			  }, {
			    "country": "Austria",
			    "litres": 128.3
			  }, {
			    "country": "UK",
			    "litres": 99
			  }, {
			    "country": "Belgium",
			    "litres": 60
			  }, {
			    "country": "The Netherlands",
			    "litres": 50
			  } ],
			  "valueField": "litres",
			  "titleField": "country",
			   "balloon":{
			   "fixedPosition":true
			  },
			  "export": {
			    "enabled": true
			  }
			} );
	});
	
	$.setToday=function(){		
			var today = new Date();
			var str = $.convertDate(today); 

			$('#spDate').html(str);
	}	
	
	$.convertDate=function(today){
		return today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일";
	}
	
	$.convertMonth=function(today){
		return today.getFullYear()+"-"+$.formatDate((today.getMonth()+1))+"-"+$.formatDate(today.getDate());
	}
	
</script>
</head>
<body>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;근태 현황&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
        <div id="chartdiv"></div>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
		<div id="dimyPage">	
				<div id="diCal">
					<span id="spDate"></span>
				</div>			
			<form name="frmDate" id="frmDate" method="post" action="<c:url value='/commue/employeeMonthList.do' />">
				<input type="hidden" id="currentPage" name="currentPage" value="1">			
			</form>
			<div id="chartdiv"></div>
		</div>
       <!-- 3. 내용 끝 -->
    </article>
    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>