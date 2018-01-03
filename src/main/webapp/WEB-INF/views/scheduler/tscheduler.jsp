<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@include file="../inc/top.jsp"%>
	<!-- scheduler -->
    <script src="<c:url value="/resources/codebase/dhtmlxscheduler.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/codebase/dhtmlxscheduler.css"/>">
    <!-- google map -->
   <script src="//maps.google.com/maps/api/js?sensor=false&key=AIzaSyAixzCJO-GWZfFwOVEaVZBD-VKvmfgMK98"></script> 
	<script src="<c:url value='/resources/codebase/ext/dhtmlxscheduler_map_view.js'/> "></script>
	<!-- PDF로 보내기 -->
	<script src="<c:url value='/resources/codebase/ext/dhtmlxscheduler_pdf.js'/>"></script>

<script type="text/javascript" charset="utf-8">
		window.onload=function() {
			if ($('#tschDept').val()=='사원') {
				scheduler.config.readonly = true;
			} else {
				scheduler.config.readonly = false;
			}
			scheduler.config.xml_date = "%Y-%m-%d %h:%i";
			scheduler.config.prevent_cache = true;
			scheduler.config.time_step = 30;
			scheduler.config.multi_day = true;
			scheduler.locale.labels.section_subject = "Subject";
			scheduler.config.first_hour = 8;
			scheduler.config.limit_time_select = true;
			scheduler.config.details_on_dblclick = true;
			scheduler.config.details_on_create = true;
			
			
			scheduler.locale.labels.map_tab = "Map";
			scheduler.locale.labels.section_location = "Location";
			scheduler.config.map_resolve_event_location = true;

			scheduler.xy.map_date_width = 180; // date column width
			scheduler.xy.map_description_width = 350; // description column width	
			
			scheduler.config.map_initial_position =new google.maps.LatLng(37.4946366,126.8354642);
			scheduler.config.map_error_position = new google.maps.LatLng(37.4946366,126.8354642);
			scheduler.config.map_initial_zoom = 5;
			
			
			scheduler.templates.event_class = function(start, end, event){
				
				var css = "";
				if(event.subject) // if event has subject property then special class should be assigned
					css += "event_"+event.subject;
				if(event.id == scheduler.getState().select_id){
					css += " selected";
				}
				return css; // default return
				
			};
				scheduler.attachEvent("onBeforeViewChange", function(old_mode, old_date, new_mode, new_date) {
					scheduler.config.map_start = scheduler.date.month_start(new Date((new_date || old_date).valueOf()));
					scheduler.config.map_end = scheduler.date.add(scheduler.config.map_start, 1, "month");
					
					return true;
				});

				// defining add function for prev/next arrows
				scheduler.date.add_map = function(date, inc) {
					return scheduler.date.add(date, inc, "month");
				};

				// defining date header
				var format = scheduler.date.date_to_str("%Y-%m-%d");
				scheduler.templates.map_date = function(start, end, mode) {
					return format(start) + " — " + format(end);
				};
				

			var subject = [ //카테고리 항목 지정
				{ key: '세미나', label: '세미나' },
				{ key: '회의', label: '회의' },
				{ key: '회식', label: '회식' },
				{ key: '기타', label: '기타' }
			];

			scheduler.config.lightbox.sections=[  //라이트박스 설정
				{name:"제목", height:22, map_to:"text", type:"textarea" ,focus:true},
				{name:"장소", height:22, map_to:"event_location", type:"textarea"},
				{name:"내용", height:43, map_to:"content", type:"textarea" },
				{name:"카테고리", height:20, type:"select", options: subject, map_to:"subject" },
				{name:"시간", height:72, type:"time", map_to:"auto" }
				
			];
			
			scheduler.init('scheduler_here', new Date(), "month");
			
			scheduler.attachEvent("onConfirmedBeforeEventDelete", function(id,ev){ //삭제버튼 눌렀을때
				var tschNo = ev.tschid;
				location.href="tschedulerDelete.do?tschNo="+tschNo;
			});
			
			  scheduler.attachEvent("onBeforeEventChanged", function(ev, e, is_new, original){ //드래그해서 값이변경됬을떄(날짜수정)
			    var tschNo = ev.tschid;
			    if(tschNo != null) {
			    	$('#tschStart').val(ev.start_date);
			    	$('#tschEnd').val(ev.end_date);
			    	$('#tschNo').val(ev.tschid);
			    	$('#schfrm').attr("action", "tschedulerEdit.do");	
			    	$('#schfrm').submit();
			    } else {
			    	return true;
			    }
			 }); 
			
			  scheduler.attachEvent("onBeforeLightbox", function(id) { //라이트박스 열었을때
					var ev = scheduler.getEvent(id);
					var tschNo = ev.tschid;
					$('#tschNo').val(tschNo);
					console.log(scheduler.map);
					
					if(ev.content==null){ //스케줄 신규등록일시
						 scheduler.attachEvent("onEventSave",function(id,ev,is_new,original){ //세이브버튼 클릭 시(신규등록)
						 
						 
					    if (!ev.text) {
					        alert("제목을 입력하세요");
					        return false;
					    }
					    else if (!ev.content) {
					        alert("내용을 입력하세요");
					        return false;
					    }
					    else if (!ev.event_location) {
					        alert("장소를 입력하세요");
					        return false;
					    }
					    else {
							 var start_date = ev.start_date; //시작날짜
							 var end_date = ev.end_date; //끝날짜
							 var text = ev.text; //제목
							 var content = ev.content; //내용
							 var event_location = ev.event_location; //장소
							 var selection = ev.subject; //카테고리
							 var tschNo=ev.tschid; //아이디
							$('#tschNo').val(id);
					        $('#tschStart').val(start_date);
					        $('#tschEnd').val(end_date);
					        $('#tschContent').val(content);
					        $('#tschText').val(text);
					        $('#tschEventLocation').val(event_location);
					        $('#tschCateg').val(selection);
					  	 	$('#tschfrm').submit();
						    return true;  
						    
						    
					    } 
					    
					}); 
					
					}else if(ev.content!=null){ //값이있을시(수정)
						 scheduler.attachEvent("onEventSave",function(id,ev,is_new,original){ //세이브버튼 클릭 시(기존 값 수정)
							    if (!ev.text) {
								        alert("제목을 입력하세요");
								        return false;
								}
							    else if (!ev.content) {
								        alert("내용을 입력하세요");
								        return false;
								}
								else if (!ev.event_location) {
								        alert("장소를 입력하세요");
								        return false;
								}
								else {
								 var start_date = ev.start_date; //시작날짜
								 var end_date = ev.end_date; //끝날짜
								 var text = ev.text; //제목
								 var content = ev.content; //내용
								 var event_location = ev.event_location; //장소
								 var selection = ev.subject; //카테고리
						        $('#tschText').val(text);
						        $('#tschContent').val(content);
						        $('#tschStart').val(start_date);
						        $('#tschEnd').val(end_date);
						        $('#tschEventLocation').val(event_location);
						        $('#tschCateg').val(selection);
						        
						      $('#tschfrm').attr("action", "tschedulerEditContent.do");	
						    	$('#tschfrm').submit(); 
						    }
						});
					 }
					return true; 
			});			     
			  
			
			scheduler.parse([//화면에 뿌려주기.
				<c:if test="${empty list}">
				 
				</c:if>
				<c:if test="${!empty list}">
				<c:forEach var="i" begin="0" end="${list.size()-1}" step="1">
					{ start_date: "${list[i].tschStart}", end_date: "${list[i].tschEnd}",
						text:"${list[i].tschText}", event_location: "${list[i].tschEventLocation}",
						content: '${list[i].tschContent}', subject: '${list[i].tschCateg}', 
						tschid:"${list[i].tschNo}"},
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
	.dhx_cal_event.event_회의 div.dhx_footer,
	.dhx_cal_event.event_회식 div.dhx_footer, .dhx_cal_event.event_세미나 div.dhx_footer,
	.dhx_cal_event.event_기타 div.dhx_footer,{
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




</style>
<!-- 0. include부분 -->
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li><a href="<c:url value='/scheduler/scheduler.do'/>"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;<span>개인 스케줄</span></a></li>
		<li class="active"><a href="<c:url value='/scheduler/tscheduler.do'/>"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;<span>공식
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
		<i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;공식 팀 스케쥴관리&nbsp;<a href="#"> 
		<i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>

<article id="bodysection">
	<!-- 3. 내용 -->
	<form name="tschfrm" id="tschfrm" method="post" action="tschedulerOK.do">
		<input type="hidden" id="tschStart" name="tschStart"> 
		<input type="hidden" id="tschEnd" name="tschEnd">
		<input type="hidden" id="tschContent" name="tschContent"><!-- 내용 -->
		<input type="hidden" id="tschCateg" name="tschCateg">
		<input type="hidden" id="tschNo" name="tschNo">
		<input type="hidden" id="tschEventLocation" name="tschEventLocation">
		<input type="hidden" id="tschText" name="tschText"><!-- 제목 -->
		<input type="hidden" id="tschDept" name="tschDept"  value="${sessionScope.empVo.empLev  }"><!-- 등급 -->
	</form>
	<div id="scheduler_here" class="dhx_cal_container"
		style='width: 1500px; height: 750px;'>
		<div class="dhx_cal_navline">
			<div class='dhx_cal_export pdf' id='export_pdf' title='Export to PDF' onclick='scheduler.toPDF("http://dhtmlxscheduler.appspot.com/export/pdf", "color")'>&nbsp;</div>
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right: 204px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right: 140px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right: 76px;"></div>
			<div class="dhx_cal_tab" name="map_tab" style="right:280px;"></div>
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
