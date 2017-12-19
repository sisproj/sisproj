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
			scheduler.config.first_hour = 8;
			scheduler.config.limit_time_select = true;
			scheduler.config.details_on_dblclick = true;
			scheduler.config.details_on_create = true;
			
			
			
			scheduler.templates.event_class = function(start, end, event){
				var css = "";
				if(event.subject) // if event has subject property then special class should be assigned
					css += "event_"+event.subject;
				if(event.id == scheduler.	getState().select_id){
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
				{ key: '야근', label: '야근' },
				{ key: '기타', label: '기타' }
			];

			scheduler.config.lightbox.sections=[
				{name:"제목", height:22, map_to:"title", type:"textarea" , focus:true},
				{name:"내용", height:43, map_to:"text", type:"textarea" },
				{name:"장소", height:22, map_to:"place", type:"textarea"},
				{name:"카테고리", height:20, type:"select", options: subject, map_to:"subject" }
				/* {name:"시간", height:72, type:"time", map_to:"auto" } */
				
			];
			
			
			scheduler.init('scheduler_here', new Date(), "day");
			
			scheduler.attachEvent("onConfirmedBeforeEventDelete", function(id,ev){
				var pschNo = ev.pschid;
				location.href="schedulerDelete.do?pschNo="+pschNo;
			});
			
			
			  scheduler.attachEvent("onBeforeEventChanged", function(ev, e, is_new, original){
				  
			    var pschNo = ev.pschid;
			    console.log(pschNo);
			    if(pschNo != null) {
			    	console.log(ev);
			    	$('#pschStart').val(ev.start_date);
			    	$('#pschEnd').val(ev.end_date);
			    	$('#pschNo').val(ev.pschid);
			    	$('#schfrm').attr("action", "schedulerEdit.do");	
			    	$('#schfrm').submit();
			    } else {
			    	return true;
			    }
			 }); 
			
			scheduler.attachEvent("onEventSave",function(id,ev,is_new,original){
				var start_date = scheduler.getEvent(id).start_date; //시작날짜
				var end_date = scheduler.getEvent(id).end_date; //끝날짜
				var title = ev.title; //제목
				var text = ev.text; //내용
				var place = ev.place; //장소
				var selection = ev.subject; //카테고리
			    if (!ev.title) {
			        alert("제목을 입력하세요");
			        return false;
			    }
			    if (!ev.text) {
			        alert("내용을 입력하세요");
			        return false;
			    }
			    else if (!ev.place) {
			        alert("장소를 입력하세요");
			        return false;
			    }
			    else {
		        $('#pschNo').val(id);
		        $('#pschStart').val(start_date);
		        $('#pschEnd').val(end_date);
		        $('#pschText').val(text);
		        $('#pschTitle').val(title);
		        $('#pschPlace').val(place);
		        $('#pschCateg').val(selection);
		        $('#schfrm').submit();
			    return true; 
			   }
			}); 
			
			scheduler.parse([
				<c:if test="${empty list}">
				 
				</c:if>
				<c:if test="${!empty list}">
				<c:forEach var="i" begin="0" end="${list.size()-1}" step="1">
					{ start_date: "${list[i].pschStart}", end_date: "${list[i].pschEnd}", title:"${list[i].pschTitle}", subject: '${list[i].pschCateg}', place: '${list[i].pschPlace}', text: '${list[i].pschText}', pschid:"${list[i].pschNo}"},
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

.dhx_cal_event div.dhx_footer, .dhx_cal_event.past_event div.dhx_footer,
	.dhx_cal_event.event_출장 div.dhx_footer, .dhx_cal_event.event_회의 div.dhx_footer,
	.dhx_cal_event.event_외근 div.dhx_footer, .dhx_cal_event.event_회식 div.dhx_footer, 
	.dhx_cal_event.event_야근 div.dhx_footer, .dhx_cal_event.event_기타 div.dhx_footer,{
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

.dhx_cal_event.event_출장 div, .dhx_cal_event_line.event_출장 {
	background-color: orange !important;
	border-color: #a36800 !important;
}

.dhx_cal_event_clear.event_출장 {
	color: orange !important;
}

.dhx_cal_event.event_회의 div, .dhx_cal_event_line.event_회의 {
	background-color: #36BD14 !important;
	border-color: #698490 !important;
}

.dhx_cal_event_clear.event_회의 {
	color: #36BD14 !important;
}

.dhx_cal_event.event_외근 div, .dhx_cal_event_line.event_외근 {
	background-color: #FC5BD5 !important;
	border-color: #839595 !important;
}

.dhx_cal_event_clear.event_외근 {
	color: #B82594 !important;
}

.dhx_cal_event.event_회식 div, .dhx_cal_event_line.event_회식 {
	background-color: blue !important;
	border-color: #839595 !important;
}

.dhx_cal_event_clear.event_회식 {
	color: blue !important;
}

.dhx_cal_event.event_야근 div, .dhx_cal_event_line.event_야근 {
	background-color: purple !important;
	border-color: #839595 !important;
}

.dhx_cal_event_clear.event_야근 {
	color: purple !important;
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
		<input type="hidden" id="pschStart" name="pschStart"> <input
			type="hidden" id="pschEnd" name="pschEnd"> <input type="hidden"
			id="pschTitle" name="pschTitle"> <input type="hidden"
			id="pschCateg" name="pschCateg"> <input type="hidden"
			id="pschNo" name="pschNo">
			<input type="hidden"
			id="pschPlace" name="pschPlace">
			<input type="hidden"
			id="pschText" name="pschText">
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
	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(3) a').addClass('active');
        });
    </script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>
