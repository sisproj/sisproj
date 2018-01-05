<%@page import="com.siszo.sisproj.common.SchedulerUtility"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%SchedulerUtility schedulerUtil = new SchedulerUtility();%>
<%@include file="../inc/top.jsp"%>
<!-- scheduler -->
 <script src="<c:url value="/resources/codebase/dhtmlxscheduler.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/codebase/dhtmlxscheduler.css"/>">
      <script src="<c:url value="/resources/codebase/ext/dhtmlxscheduler_quick_info.js"/>"></script>

<script type="text/javascript" charset="utf-8">
var EMonths = ["Jan","Feb","Mar","Apr","May","Jun","Jul",
		"Aug","Sep","Oct","Nov","Dec"];
var KMonths = ["01","02","03","04","05","06","07",
		"08","09","10","11","12"];

function ChangeDate(Date) {
	var vDate=""+Date;
	console.log(vDate);
	console.log(typeof vDate);
	var day = vDate.substring(8,10); //몇일인지
	var qMonth = vDate.substring(4,7);//영어 월
	var years = vDate.substring(11,15);//년도
	var times = vDate.substring(16,21);//시간
	var Month = "";

	for(var i=0;i<EMonths.length;i++) {
		if(qMonth==(EMonths[i])) {
			Month+=KMonths[i];
			break;
		}
	}

	return years+"-"+Month+"-"+day+" "+times;
	}

	window.onload = function() {

		
		scheduler.config.readonly = true;
		scheduler.config.readonly_form = true;
		scheduler.config.xml_date = "%Y-%m-%d %H:%i";
		scheduler.config.time_step = 60;
		scheduler.config.multi_day = true;
		scheduler.locale.labels.section_subject = "Subject";
		scheduler.config.first_hour = 9;
		scheduler.config.limit_time_select = true;
		scheduler.config.details_on_dblclick = true;
		scheduler.config.details_on_create = true;
		scheduler.config.quick_info_detached = true;

		scheduler.locale.labels.section_type = "Type";  

		// default values for filters
		var filters = {
			"1" : true,
			"2" : true,
			"3" : true,
			"4" : true,
			"5" : true,
			"6" : true,
			orders : true,
		};

		var filter_inputs = document.getElementById("filters_wrapper").getElementsByTagName("input");
		for (var i=0; i<filter_inputs.length; i++) {
			var filter_input = filter_inputs[i];

			// set initial input value based on filters settings
			filter_input.checked = filters[filter_input.name];
			

			// attach event handler to update filters object and refresh view (so filters will be applied)
			filter_input.onchange = function() {
				filters[this.name] = !!this.checked;
				scheduler.updateView();
			}
		}

		// here we are using single function for all filters but we can have different logic for each view
		scheduler.filter_month = scheduler.filter_day = scheduler.filter_week = function(id, event) {
			// display event only if its type is set to true in filters obj
			// or it was not defined yet - for newly created event
			if (filters[event.subject] || event.subject==scheduler.undefined) {
				console.log(event);
				return true;
			}

			// default, do not display event
			return false;
		};
		
		
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
			name : "카테고리",
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
		
		
		 scheduler.templates.quick_info_content = function(start, end, ev){ 
		     var items=ev.subject; 
		     if(items==1){
			 return "카테고리 : 101호 회의실 " ;
		     }
		     if(items==2){
			 return "카테고리 : 102호 회의실 " ;
		     }
		     if(items==3){
			 return "카테고리 : 스타렉스 자동차 " ;
		     }
		     if(items==4){
			 return "카테고리 : 포터 자동차 " ;
		     }
		     if(items==5){
			 return "카테고리 : 축구장 " ;
		     }
		     if(items==6){
			 return "카테고리 : 법인카드 " ;
		     }	
		     if(items=='orders'){
			 return "카테고리 : 기타 " ;
		     }
		}; 
		
		
		$('#bttest').click(function(){
			scheduler.showLightbox(subject);
		});
		
		scheduler.init('scheduler_here', new Date(), "week");

		scheduler.attachEvent("onEventSave",function(id,ev,is_new,original){ //세이브버튼 클릭 시(신규등록)
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
		        $('#rvStart').val(ChangeDate(start_date));
		        $('#rvEnd').val(ChangeDate(end_date)); 
		        $('#rvContent').val(text);
		        $('#resNo').val(selection);
		  	   	$('#rvfrm').submit();
			    return true; 
		    } 
		    
		}); 
		 
		
		scheduler.parse([//화면에 뿌려주기.
			<c:if test="${!empty reslist}">
			<c:forEach var="vo" items="${reslist }">
				{start_date: "${vo.rvStart}", end_date: "${vo.rvEnd}",
					text:"${vo.rvContent}",	subject: '${vo.resNo}'},
					
			</c:forEach>
			</c:if>
			], "json");
		
		
		}
	
	function pageFunc(curPage){
		document.frmTrash.currentPage.value=curPage;
		frmTrash.submit();
	}
</script>
<style type="text/css"> 

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
.event_1
div
.dhx_footer
,
.dhx_cal_event
.event_2
div
.dhx_footer
,
.dhx_cal_event
.event_3
div
.dhx_footer
,
.dhx_cal_event
.event_4
div
.dhx_footer
,
.dhx_cal_event
.event_5
div
.dhx_footer
,
.dhx_cal_event
.event_6
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

.dhx_cal_event.event_1 div, .dhx_cal_event_line.event_1 .dhx_cal_event.event_2 div,
	.dhx_cal_event_line.event_2 {
	background-color: #36BD14 !important;
	border-color: #698490 !important;
}

.dhx_cal_event_clear.event_1, .dhx_cal_event_clear.event_2 {
	color: #36BD14 !important;
}

.dhx_cal_event.event_3 div, .dhx_cal_event_line.event_3 .dhx_cal_event.event_4 div,
	.dhx_cal_event_line.event_4 {
	background-color: #FC5BD5 !important;
	border-color: #839595 !important;
}

.dhx_cal_event_clear.event_3 .dhx_cal_event_clear.event_4 {
	color: #B82594 !important;
}

.dhx_cal_event.event_5 div, .dhx_cal_event_line.event_5 {
	background-color: blue !important;
	border-color: #839595 !important;
}

.dhx_cal_event_clear.event_5 {
	color: blue !important;
}

.dhx_cal_event.event_6 div, .dhx_cal_event_line.event_6 {
	background-color: olive !important;
	border-color: #839595 !important;
}

.dhx_cal_event_clear.event_6 {
	color: blue !important;
}

.dhx_cal_container {
	float: left;
}

#bttest {
	float: right;
}

#resource_here {
	width:50%;
	float: left;
}

	.filters_wrapper {
			line-height: 12px;
			font-size: 12px;
		}
		.filters_wrapper span {
			font-weight: bold;
			padding-right: 5px;
		}
		.filters_wrapper label {
			padding-right: 3px;
		}
	.divRequestHeader div{
   		float: left;
   		border: 1px solid rgb(195, 195, 195);
   		margin-right: 20px;
   		padding: 5px;
   		background-color: white;
   	}
   	.divRequestHeader div input{
   		border: none;
   		padding: 1px 0;
   	}
   	#reqSearch{
   		color: rgb(195, 195, 195);
   	}
   	.divOkMulti i{
   		color: #0f0;
   	}
   	.divBackMulti i{
   		color: #f00;
   	}
	#addrTable{
	font-size:14px;
		width:800px;
		margin: 0 auto;
		padding : 10px;
		box-sizing:border-box;
		border:0;
		border-collapse: collapse;	
		margin-top: 10px;	
		margin-bottom: 10px;
	}
	#addrTable tr{
		transition:all 300ms linear;
	}
	#addrTable tbody tr:hover{
		background-color: #e1e1e1;
	}
	#addrTable th{
		box-sizing:border-box;
		padding: 5px;
		height: 30px;
		color: #036;
		font-size: 1.17em;
		border:0;
		border-top: 2px solid #e1e1e1;
		border-bottom: 2px solid #e1e1e1;
	}
	#addrTable td {
		box-sizing:border-box;
		padding: 5px;
		border:0;
		text-align: center;
		border-bottom: 2px solid #e1e1e1;
	}
	#pagingbtn{
		width: 100%;
		max-width:1100px;
		margin: 0 auto;
		height: 40px;
		width: auto;
		box-sizing:border-box;
		padding-bottom: 10px;
		text-align:center;
	}
	#pagingbtn span, #pagingbtn a{
		display: inline-block;
		width: 24px;
		line-height: 24px;
		border-radius:12px;
		background-color: #369;
		color: fff;
		text-align: center;
		font-weight: bold;
		margin-left: 5px;
		box-shadow:2px 2px 3px #333;
		font-size: 0.8em;
	}
	#pagingbtn a:hover,
	#pagingbtn span.thispage{
		background-color:#09f;
		box-shadow:2px 2px 3px transparent;	
	}
	#pagingbtn span:first-child{
		margin-left: 0;	
	}
	#pagingbtn a i {
		line-height: 24px;
		color: fff;
		text-align: center;
		font-size: 0.8em;
	}
	#pagingbtn #firstbtn,
	#pagingbtn #lastbtn{
		background-color: #333;
	}
	#pagingbtn #prevbtn,
	#pagingbtn #nextbtn{
		background-color: #306;
	}
	#bodysection
	{
min-width: 1500px;
clear: both;
	}
 </style>
<!-- 0. include부분 -->
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li class="active"><a
			href="<c:url value='/resource/resource.do'/>"><i
				class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;<span>자원관리</span></a></li>
		<c:if test="${sessionScope.empVo.empLev!='사원' }">
		<li><a
			href="<c:url value='/resource/requestList.do'/>"><i
				class="fa fa-hourglass-half"></i>&nbsp;<span>승인 대기 목록</span></a></li>
		</c:if>				
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

	<div class="resbigdiv">
		<form name="rvfrm" id="rvfrm" method="post"	action="<c:url value='/resource/resourceWrite.do'/>"> 	
			<input type="hidden" id="rvStart" name="rvStart"> 
			<input type="hidden" id="rvEnd" name="rvEnd"> 
			<input type="hidden" id="resNo" name="resNo"> 
			<input type="hidden" id="rvContent" 	name="rvContent">
			<input type="hidden" id="currentPage" name="currentPage" value="1">

			<!-- 제목 -->
		</form>
		
		<div style='height:20px; padding:5px;'>
	<div class="filters_wrapper" id="filters_wrapper">
		<span>카테고리 별 검색:</span>
		<label>
			<input type="checkbox" name="1" />
			101호 회의실
		</label>
		<label>
			<input type="checkbox" name="2" />
			102호 회의실
		</label>
		<label>
			<input type="checkbox" name="3" />
			스타렉스 자동차
		</label>
		<label>
			<input type="checkbox" name="4" />
			포터 자동차
		</label>
		<label>
			<input type="checkbox" name="5" />
			축구장
		</label>
		<label>
			<input type="checkbox" name="6" />
			법인카드
		</label>
		<label>
			<input type="checkbox" name="orders" />
			기타
		</label>
	</div>
</div>

		<div id="scheduler_here" class="dhx_cal_container"
			style='width: 50%; height: 800px;'>
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
			<hr>
			<h4 style="text-align: center;">나의 자원신청 승인 현황</h4>
			<hr>
			<table id="addrTable">
	        		<colgroup>
	        			<col width="15%">
	        			<col width="*">
	        			<col width="17%">
	        			<col width="17%">
	        			<col width="13%">
	        			<col width="15%"> 
	        		</colgroup>
	        		<thead>
	        		<tr>
	        			<th>자원이름</th>
	        			<th>예약 내용</th>
	        			<th>시작일</th>
	        			<th>종료일</th>
	        			<th>등록일</th>
	        			<th>승인여부</th>
	        		</tr>
	        		</thead>
	        		<tbody>
	        		<c:if test="${empty myreslist }">
	        		<tr>
	        			<td colspan="6">자원 승인 대기현황이 없습니다.</td> 
	        		</tr>
	        		</c:if>
	        		<c:if test="${!empty myreslist }">
	        		<c:forEach var="map" items="${myreslist }">
		        		<tr>
		        			<td>${map['RES_NAME']}</td>
		        			<td>${map['RV_CONTENT']}</td>
		        			<td>${map['RV_START'] }</td>
		        			<td>${map['RV_END'] }</td>
		        			<td><fmt:formatDate value="${map['RV_REGDATE']}" pattern="yyyy-MM-dd"/></td>		        			
		        			<td>
			        				<c:if test="${map['RV_CONFIRM']=='N'}">승인 대기중</c:if>
			        				<c:if test="${map['RV_CONFIRM']=='R'}">반려</c:if>			        				
		        			</td>		        			
		        		</tr>
	        		</c:forEach>
	        		</c:if>
	        		</tbody>
	        	</table>
		        
			<hr>
			 <!-- 페이징처리 -->
		    	<div id="pagingbtn">
					<ul>
						<!-- 이전 블럭으로 이동 ◀ -->
						<c:if test="${pagingInfo.firstPage>1 }">
							<a id="prevbtn" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"><i class="fa fa-chevron-left"></i></a>		
						</c:if>	
					
						<!-- [1][2][3][4][5][6][7][8][9][10] -->
						<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
							<c:if test="${i==pagingInfo.currentPage}">
								<span class="thispage">${i }</span>	
							</c:if>
							<c:if test="${i!=pagingInfo.currentPage}">
								<a href="#" onclick="pageFunc(${i })" class="active">${i }</a>
					 		</c:if>				
						</c:forEach>
					
						<!-- 다음 블럭으로 이동 ▶ -->
						<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
							<a id=nextbtn href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"><i class="fa fa-chevron-right"></i></a>
						</c:if>
					</ul>
		        </div>
		        <!-- 페이징 처리 끝 -->


		</div>
	</div>
	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
	$(function() {
		$('header nav ul li:nth-child(4) a').addClass('active');
	});
	
</script>
<style>
.dhx_qi_big_icon{
		display: none;
	}
</style>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>
