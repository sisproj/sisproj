<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="../inc/top.jsp"%>
<!-- scheduler -->
<script src="<c:url value="/resources/codebase/dhtmlxscheduler.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/codebase/dhtmlxscheduler.css"/>">

<script type="text/javascript" charset="utf-8">
	window.onload = function() {
		scheduler.config.readonly = true;
		scheduler.config.xml_date = "%Y-%m-%d %H:%i";
		scheduler.config.time_step = 60;
		scheduler.config.multi_day = true;
		scheduler.locale.labels.section_subject = "Subject";
		scheduler.config.first_hour = 9;
		scheduler.config.limit_time_select = true;
		scheduler.config.details_on_dblclick = true;
		scheduler.config.details_on_create = true;

		scheduler.templates.event_class = function(start, end, event) {
			var css = "";

			if (event.subject) // if event has subject property then special class should be assigned
				css += "event_" + event.subject;

			if (event.id == scheduler.getState().select_id) {
				css += " selected";
			}
			return css; // default return

		};

		var subject = [ {
			key : '',
			label : '자원을 선택하세요'
		<c:forEach var="vo" items="${resourcelist }">
		}, {
			key : "${vo.resNo}",
			label : "${vo.resName}"
		</c:forEach>
		}, {
			key : 'orders',
			label : '기타'
		} ];

		scheduler.config.lightbox.sections = [ {
			name : "내용",
			height : 43,
			map_to : "text",
			type : "textarea",
			focus : true
		}, {
			name : "자원",
			height : 20,
			type : "select",
			options : subject,
			map_to : "subject"
		}, {
			name : "시간",
			height : 72,
			type : "time",
			map_to : "auto"
		} ];

		$('#bttest').click(function(){
			scheduler.showLightbox(subject);
		});
		
		scheduler.init('scheduler_here', new Date(), "week");

		scheduler.attachEvent("onEventSave",function(id,ev,is_new,original){ //세이브버튼 클릭 시(신규등록)
		var ev = scheduler.getEvent(id);
		console.log(ev.rvid);		
		    if (!ev.text) {
		        alert("내용을 입력하세요");
		        return false;
		    }
		    else if (ev.subject=='') {
		        alert("자원을 선택하세요");
		        return false;
		    }
		    else {
		    	
				 var start_date = ev.start_date; //시작날짜
				 var end_date = ev.end_date; //끝날짜
				 var text = ev.text; //내용
				 var selection = ev.subject; //카테고리
				 var rvNo=ev.id; //아이디
				$('#rvNo').val(rvNo);
		        $('#rvStart').val(start_date);
		        $('#rvEnd').val(end_date);
		        $('#rvContent').val(text);
		        $('#resNo').val(selection);
		  	  	/*  $('#rvfrm').submit();
			    return true;  */
		    } 
		    
		}); 
		scheduler.parse([//화면에 뿌려주기.
			<c:if test="${!empty reslist}">
			<c:forEach var="vo" items="${reslist }">
				{start_date: "${vo.rvStart}", end_date: "${vo.rvEnd}",
					text:"${vo.rvContent}",	subject: '${vo.resName}'},
			</c:forEach>
			</c:if>
			], "json");
		
		
		}
</script>
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow: hidden;
}

.dhx_cal_event

 

div


.dhx_footer
,
.dhx_cal_event


.past_event

 

div


.dhx_footer
,
.dhx_cal_event


.event_회의

 

div


.dhx_footer
,
.dhx_cal_event


.event_회식

 

div


.dhx_footer
,
.dhx_cal_event


.event_세미나

 

div


.dhx_footer
,
.dhx_cal_event


.event_기타

 

div


.dhx_footer
,
{
background-color


:

 

transparent

 

!
important


;
}
.dhx_cal_event .dhx_body {
	-webkit-transition: opacity 0.1s;
	transition: opacity 0.1s;
	opacity: 0.7;
}

.dhx_cal_event .dhx_content {
	line-height: 12px;
}

.dhx_cal_event_line:hover, .dhx_cal_event:hover .dhx_body,
	.dhx_cal_event.selected .dhx_body, .dhx_cal_event.dhx_cal_select_menu .dhx_body
	{
	opacity: 1;
}

.dhx_cal_event.event_회의 div, .dhx_cal_event_line.event_회의 {
	background-color: #36BD14 !important;
	border-color: #698490 !important;
}

.dhx_cal_event_clear.event_회의 {
	color: #36BD14 !important;
}

.dhx_cal_event.event_세미나 div, .dhx_cal_event_line.event_세미나 {
	background-color: #FC5BD5 !important;
	border-color: #839595 !important;
}

.dhx_cal_event_clear.event_세미나 {
	color: #B82594 !important;
}

.dhx_cal_event.event_회식 div, .dhx_cal_event_line.event_회식 {
	background-color: blue !important;
	border-color: #839595 !important;
}

.dhx_cal_event_clear.event_회식 {
	color: blue !important;
}

.dhx_cal_container {
	float: left;
}

#resource_here {
	float: right;
}
</style>
<!-- 0. include부분 -->
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li class="active"><a
			href="<c:url value='/resource/resource.do'/>"><i
				class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;<span>자원관리</span></a></li>
		<!-- <li><a href="#"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
                <li><a href="#"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
                <li><a href="#"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li> -->
	</ul>
	<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
	<div id="listbtn">
		<p>
			<i class="fa fa-chevron-circle-left" style="text-align: center;"></i>
		</p>
	</div>
</nav>
</aside>

<!-- 왼쪽 사이드 메뉴 끝 -->
<article id="headsection">
	<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
	<h1>
		<i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;자원 관리&nbsp;<a
			href="#"> <i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>

<article id="bodysection">
	<!-- 3. 내용 -->

	<form name="rvfrm" id="rvfrm" method="post"
		action="<c:url value='/resource/resourceWrite.do'/>">
		<input type="hidden" id="rvStart" name="rvStart"> <input
			type="hidden" id="rvEnd" name="rvEnd"> <input type="hidden"
			id="resNo" name="resNo"> <input type="hidden" id="rvContent"
			name="rvContent">
		<!-- 제목 -->
	</form>
	<div id="scheduler_here" class="dhx_cal_container"
		style='width: 700px; height: 800px;'>
		<div class="dhx_cal_navline">
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right: 204px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right: 140px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right: 76px;"></div>
		</div>
		<div class="dhx_cal_header"></div>
		<div class="dhx_cal_data"></div>

	</div>
	<div id="resource_here">
		<input type="button" id="bttest" value="자원등록 신청하기">

	</div>

	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
	$(function() {
		$('header nav ul li:nth-child(4) a').addClass('active');
	});
</script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>
