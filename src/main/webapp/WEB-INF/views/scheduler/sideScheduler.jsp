<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<!-- scheduler -->
    <script src="<c:url value="/resources/codebase/dhtmlxscheduler.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/codebase/dhtmlxscheduler.css"/>">
    <script src="<c:url value="/resources/codebase/ext/dhtmlxscheduler_quick_info.js"/>"></script>
    
<script type="text/javascript" charset="utf-8">
		window.onload=function() { 
			scheduler.config.readonly = true;
			scheduler.config.xml_date = "%Y-%m-%d %h:%i";
			scheduler.config.prevent_cache = true;  
			scheduler.config.time_step = 30;
			scheduler.config.multi_day = true;
			scheduler.locale.labels.section_subject = "Subject";
			scheduler.config.first_hour = 8;
			scheduler.config.limit_time_select = true;
			scheduler.config.details_on_dblclick = false;
			scheduler.config.details_on_create = false;
			scheduler.config.quick_info_detached = true;
			

			scheduler.templates.event_class = function(start, end, event){
				
				var css = "";
				if(event.subject) // if event has subject property then special class should be assigned
					css += "event_"+event.subject;
				if(event.id == scheduler.getState().select_id){
					css += " selected";
				}
				return css; // default return
				
			};

			scheduler.init('scheduler_here', new Date(), "month");
			
			scheduler.templates.quick_info_content = function(start, end, ev){ 
			       return ev.content;
			};
			scheduler.parse([//화면에 뿌려주기.
				<c:if test="${empty list}">
				 
				</c:if>
				<c:if test="${!empty list}">
				<c:forEach var="i" begin="0" end="${list.size()-1}" step="1">
					{ start_date: "${list[i].pschStart}", end_date: "${list[i].pschEnd}",
					 	text:"", event_location: "${list[i].pschEventLocation}",
						content: '${list[i].pschContent}', subject: '${list[i].pschCateg}', 
						pschid:"${list[i].pschNo}"},
				</c:forEach> 
				</c:if>
				], "json");
			
			}

	</script>
<style type="text/css">

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

.dhx_cal_event .dhx_content {
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
<body>
	<!-- 3. 내용 -->
	<form name="schfrm" id="schfrm" method="post" action="schedulerOK.do">
		<input type="hidden" id="pschStart" name="pschStart"> 
		<input type="hidden" id="pschEnd" name="pschEnd">
		<input type="hidden" id="pschContent" name="pschContent"><!-- 내용 -->
		<input type="hidden" id="pschCateg" name="pschCateg">
		<input type="hidden" id="pschNo" name="pschNo">
		<input type="hidden" id="pschEventLocation" name="pschEventLocation">
		<input type="hidden" id="pschText" name="pschText"><!-- 제목 -->
	</form>
	<div id="scheduler_here" class="dhx_cal_container"
		style='width: 500px; height: 450px;'>
		<div class="dhx_cal_navline">
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
		</div>
		<div class="dhx_cal_header"></div>
		<div class="dhx_cal_data"></div>
		
	</div>
	</body>
	</html>
	
	
<style>
	.dhx_qi_big_icon{
		display: none;
	}
	
</style>

