<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <!-- 3. 내용 끝 -->
    </article>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(6) a').addClass('active');
        });
    </script>
    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>

<!-- 

var chart = AmCharts.makeChart( "chartdiv", {
			  "type": "serial",
			  "theme": "light",
			  "dataProvider": [ {
			    "month": "1월",
			    "visits": 2025
			  }, {
			    "month": "2월",
			    "visits": 1882
			  }, {
			    "month": "3월",
			    "visits": 1809
			  }, {
			    "month": "4월",
			    "visits": 1322
			  }, {
			    "month": "5월",
			    "visits": 1122
			  }, {
			    "month": "6월",
			    "visits": 1114
			  }, {
			    "month": "7월",
			    "visits": 984
			  }, {
			    "month": "8월",
			    "visits": 711
			  }, {
			    "month": "9월",
			    "visits": 665
			  }, {
			    "month": "10월",
			    "visits": 580
			  }, {
			    "month": "11월",
			    "visits": 443
			  }, {
			    "month": "12월",
			    "visits": 441
			  }],
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
			  "categoryField": "month",
			  "categoryAxis": {
			    "gridPosition": "start",
			    "gridAlpha": 0,
			    "tickPosition": "start",
			    "tickLength": 20
			  },
			  "export": {
			    "enabled": true
			  }

			}); -->