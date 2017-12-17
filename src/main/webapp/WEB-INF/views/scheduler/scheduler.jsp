<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>

<script type="text/javascript" charset="utf-8">
		window.onload=function() {
			scheduler.config.xml_date = "%Y-%m-%d %h:%i";
			scheduler.config.time_step = 30;
			scheduler.config.multi_day = true;
			scheduler.locale.labels.section_subject = "Subject";
			scheduler.config.first_hour = 6;
			scheduler.config.limit_time_select = true;
			scheduler.config.details_on_dblclick = true;
			scheduler.config.details_on_create = true;

			scheduler.templates.event_class = function(start, end, event){
				var css = "";
				if(event.subject) // if event has subject property then special class should be assigned
					css += "event_"+event.subject;
				if(event.id == scheduler.getState().select_id){
					css += " selected";
				}
				return css; // default return

				/*
					Note that it is possible to create more complex checks
					events with the same properties could have different CSS classes depending on the current view:

					var mode = scheduler.getState().mode;
					if(mode == "day"){
						// custom logic here
					}
					else {
						// custom logic here
					}
				*/
			};

			var subject = [
				{ key: '출장', label: '출장' },
				{ key: '회의', label: '회의' },
				{ key: '외근', label: '외근' },
				{ key: '회식', label: '회식' },
				{ key: '기타', label: '기타' },
			];

			scheduler.config.lightbox.sections=[
				{name:"내용", height:43, map_to:"text", type:"textarea" , focus:true},
				{name:"카테고리", height:20, type:"select", options: subject, map_to:"subject" },
				{name:"시간", height:72, type:"time", map_to:"auto" }
			];

			scheduler.init('scheduler_here', new Date(), "month");
			
			scheduler.attachEvent("onEventSave",function(id,ev,is_new){
				var end_date = scheduler.getEvent(id).end_date;
				var start_date = scheduler.getEvent(id).start_date;
				var text = ev.text;
				var selection = ev.subject;
			
			    if (!ev.text) {
			        alert("내용을 입력하세요");
			        return false;
			    } else {
			   	
		        $('#pschStart').val(start_date);
		        $('#pschEnd').val(end_date);
		        $('#pschTitle').val(text);
		        $('#pschNo').val(id);
		        $('#pschCateg').val(selection);
		        $('#schfrm').submit();
			    return true;
			    }
			}); 
		
		 /*  scheduler.parse([
			  for(var i=0; i<${fn:length(list)};i++){
				    if(i=${fn:length(list)}-1)){
						{ start_date: "${list[i].pschStart}", end_date: "${list[i].pschEnd}", text:"${list[i].pschTitle}", subject: '${list[i].pschCateg}' }
	         		}else{
						{ start_date: "${list[i].pschStart}", end_date: "${list[i].pschEnd}", text:"${list[i].pschTitle}", subject: '${list[i].pschCateg}' }
	         		}
			  }
			], "json"); 
			*/
			
			scheduler.parse([
					{ start_date: "${list[1].pschStart}", end_date: "${list[1].pschEnd}", text:"${list[1].pschTitle}", subject: '${list[1].pschCateg}' },
					{ start_date: "${list[2].pschStart}", end_date: "${list[2].pschEnd}", text:"${list[2].pschTitle}", subject: '${list[2].pschCateg}' },
					{ start_date: "${list[3].pschStart}", end_date: "${list[3].pschEnd}", text:"${list[3].pschTitle}", subject: '${list[3].pschCateg}' },
					{ start_date: "${list[4].pschStart}", end_date: "${list[4].pschEnd}", text:"${list[4].pschTitle}", subject: '${list[4].pschCateg}' },
					{ start_date: "${list[5].pschStart}", end_date: "${list[5].pschEnd}", text:"${list[5].pschTitle}", subject: '${list[5].pschCateg}' },
					{ start_date: "${list[6].pschStart}", end_date: "${list[6].pschEnd}", text:"${list[6].pschTitle}", subject: '${list[6].pschCateg}' },
					{ start_date: "${list[7].pschStart}", end_date: "${list[7].pschEnd}", text:"${list[7].pschTitle}", subject: '${list[7].pschCateg}' }
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

.dhx_cal_event div.dhx_footer, .dhx_cal_event.past_event div.dhx_footer,
	.dhx_cal_event.event_english div.dhx_footer, .dhx_cal_event.event_math div.dhx_footer,
	.dhx_cal_event.event_science div.dhx_footer {
	background-color: transparent !important;
}

.dhx_cal_event .dhx_body {
	-webkit-transition: opacity 0.1s;
	transition: opacity 0.1s;
	opacity: 0.7;
}

.dhx_cal_event .dhx_title {
	line-height: 12px;
}

.dhx_cal_event_line:hover, .dhx_cal_event:hover .dhx_body,
	.dhx_cal_event.selected .dhx_body, .dhx_cal_event.dhx_cal_select_menu .dhx_body
	{
	opacity: 1;
}

.dhx_cal_event.event_math div, .dhx_cal_event_line.event_math {
	background-color: orange !important;
	border-color: #a36800 !important;
}

.dhx_cal_event_clear.event_math {
	color: orange !important;
}

.dhx_cal_event.event_science div, .dhx_cal_event_line.event_science {
	background-color: #36BD14 !important;
	border-color: #698490 !important;
}

.dhx_cal_event_clear.event_science {
	color: #36BD14 !important;
}

.dhx_cal_event.event_english div, .dhx_cal_event_line.event_english {
	background-color: #FC5BD5 !important;
	border-color: #839595 !important;
}

.dhx_cal_event_clear.event_english {
	color: #B82594 !important;
}
</style>
<!-- 0. include부분 -->
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li class="active"><a href="#"><i
				class="fa fa-pencil-square-o"></i>&nbsp;<span>개인스케줄</span></a></li>
		<li><a href="#"><i class="fa fa-floppy-o"></i>&nbsp;<span>공식
					스케줄</span></a></li>
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
		<i class="fa fa-calendar-check-o" aria-hidden="true"></i></i>&nbsp;스케쥴관리&nbsp;<a
			href="#"> <i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>

<article id="bodysection">
	<!-- 3. 내용 -->
	<form name="schfrm" id="schfrm" method="post" action="schedulerOK.do">
		<input type="text" id="pschStart" name="pschStart"> <input
			type="text" id="pschEnd" name="pschEnd"> <input type="text"
			id="pschTitle" name="pschTitle"> <input type="text"
			id="pschCateg" name="pschCateg"> <input type="text"
			id="pschNo" name="pschNo">
	</form>
	<div id="scheduler_here" class="dhx_cal_container"
		style='width: 1400px; height: 700px;'>
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
	</body>
	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(4) a').addClass('active');
        });
    </script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>
