<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(function () {	
		$.setYear();
		alert("0");
		
		 $('#btSe').submit(function () {
		 	 $.ajax({
		        url: '<c:url value='/commue/employeeMonthList.do' />',
		        dataType:"json",
		        type: 'post',
		        success: function(lists) {
		            google.charts.load('current', {'packages':['corechart']});
		            google.charts.setOnLoadCallback(drawChart);
		            function drawChart() {
		                var dataChart = [['Task', 'Hours per Day']];
		                if(lists.length != 0) {
		                    $.each(lists, function(i, item){
		                        dataChart.push([item.map['CMTIN'], item.map['TOTAL']]);
		                    });
		                }else {
		                    dataChart.push(['입력해주세요', 1]);
		                }
		                var data = google.visualization.arrayToDataTable(dataChart);
		                var view = new google.visualization.DataView(data);
		                var options = {
		                        title: "제목옵션",
		                        width: 900, // 넓이 옵션
		                        height: 300, // 높이 옵션
		                }
		                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		                chart.draw(view, options);
		            }
		        },error:function(xhr,status,error){
		        	alert("에러"+status+"=>"+error);
		        	}
		   	 });
		});
	});
	$.setMonth=function(){

		for(var i=1;i<=12;i++){
			if(mo==i){
				$('#month').append("<option value='"+i+"' selected>"+i+"</option>");
			}else{
				$('#month').append("<option value='"+i+"'>"+i+"</option>");				
			}
		}
	}
	
	$.setToday=function(){		
		var today = new Date();
		var str = $.convertDate(today); 

		$('#spDate').html(str);
	}	
	
	$.convertDate=function(today){
		return today.getFullYear()+"년";
	}
	$.setYear=function(){
		var date = new Date();
		var year = date.getFullYear();
		
		var ye = "${param.year}";
		
		for(var i=year;i>=year-50;i--){
			if(ye==i){
				$('#year').append("<option value='"+i+"' selected>"+i+"</option>");
			}else{
				$('#year').append("<option value='"+i+"' >"+i+"</option>");					
			}
		}
	}
</script>
<!-- 0. include부분 -->
<nav>
        <ul>
           <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
            <li><a href="<c:url value='/commue/employeeMonthList.do'/>">
            <i class="fa fa-address-book-o"></i>&nbsp;<span>월별 근태현황</span>
            	<i id="myAddressRight" class="myAddress fa fa-chevron-right"></i></a>
            </li>
        </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <hr>
    <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
    <article id="headsection">
        <h1>
        	<i class="fa fa-address-book-o"></i>&nbsp;월별 근태현황&nbsp;
        	<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a>
        </h1>
    </article>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- 왼쪽 사이드 메뉴 끝 -->
     <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;근태 현황&nbsp;<i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
    <div id="dimyPage">	
			<div id="diBtCa">
				<div id="diCal">
					<!-- <a href="#"><i class="fa fa-angle-left" aria-hidden="true" style="font-size: 1.4em;" id="fDate"></i></a>&nbsp; -->
					<span id="spDate"></span>
					<!-- <a href="#"><i class="fa fa-angle-right" aria-hidden="true" style="font-size: 1.4em;" id="lDate"></i></a> -->
				</div>			
			<form name="frmDate" id="frmDate" method="post" <c:url value="/commue/employeeMonthList.do" />>
				<input type="hidden" name="empNo" value="${sessionScope.empVo.empNo }">
				<select id="year" name="year">
					<option value="">선택하세요</option>				
				</select>년
				<input type="submit" id="btSe" name="btSe" value="검색">
			</form>
			</div>
		</div>
    <!-- 0. include부분 끝-->
			   <div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
       
<%@include file="../inc/bottom.jsp" %>