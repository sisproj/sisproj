<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../inc/admTop.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function () {	
		if($('#startDay').val()==''){
			$.setToday();
		}
		
		$.applyDatePicker('#startDay');
	});
	
	$.setToday=function(){		
			var today = new Date();
			var str = $.convertDate(today); 

			$('#spDate').html(str);
	}	
	
	$.setChDate=function(){
		$('#spDate').html(chD);
	}
	
	$.convertDate=function(today){
		return today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일";
	}
	
	$.convertMonth=function(today){
		return today.getFullYear()+"-"+$.formatDate((today.getMonth()+1))+"-"+$.formatDate(today.getDate());
	}
	
	$.convertTime=function(today){
		return today.getHour()+":"+today.getMinutes();
	}
	$.applyDatePicker=function(id){
		$(id).datepicker({			
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
	}
	$.formatDate = function(d){
		var result=d;
		if(d<10){
			result="0"+d;
		}
		return result;
	}
	 function pageFunc(curPage){
			document.searchEmp.currentPage.value=curPage;
			searchEmp.submit();
	} 
</script>
<style type="text/css">
	#diPage {
		text-align: center;
		width: 90%;
	}
	#dimyP{
		margin: 0 auto;
		margin-bottom:10px;
	}
	#allList {
		width: 90%;
		margin: 0 auto;
		padding : 10px;
		box-sizing:border-box;
		border:0;
		border-collapse: collapse;
	}
	#allList tr{
		transition:all 300ms linear;
	}
	#allList tbody tr:hover{
		background-color: #e1e1e1;
	}
	#allList th{
		box-sizing:border-box;
		padding: 5px;
		height: 30px;
		color: #036;
		font-size: 1.17em;
		border:0;
		border-top: 2px solid #e1e1e1;
		border-bottom: 2px solid #e1e1e1;
	}
	#allList td {
		box-sizing:border-box;
		padding: 5px;
		border:0;
		text-align: center;
		border-bottom: 2px solid #e1e1e1;
	}
	/*하단 페이징 버튼*/
	#pagingbtn{
		width: 100%;
		max-width:1100px;
		margin: 0 auto;
		height: 40px;
		width: auto;
		box-sizing:border-box;
		padding-bottom: 10px;
		text-align:center;
		margin-top: 10px;
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
	#diCal{
		width: 90%;
	}
	#diCal #spDate{
		text-align: center;
	}
	#diSearch{
		width: 90%;
		margin: 0 auto;
		padding : 10px;
	}
</style>
</head>
<body>

    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;근태 현황&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
<form name="frmPage" method="post">
	<input type="hidden" name="eventName" 	value="${param.eventName}">
	<input type="hidden" name="currentPage">	
</form>
    <article id="bodysection">
        <!-- 3. 내용 -->
	<div id="dimyPage">	
			<div id="diBtCa">
				<div id="diCal">
					<span id="spDate"></span>
				</div>			
		<form name="frmDate" id="frmDate" method="post" action="<c:url value='/commue/adm/commueDateList.do' />">
				<div id="diSearch" style="margin-left: 10px;">
						<input type="text" name="startDay" id="startDay" 
							value="${dateSearchVO.startDay }" placeholder="누르시면 달력이나옵니다."> 
						<input type="submit" id="btSearch" value="검색">
				</div>
		</form>
	</div>
	<div id="dimyPage">
		<table id="allList" border="1" >
		<colgroup>
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="20%">
			<col width="20%">
			<col width="15%">
		</colgroup>
				<tr>
					<th>사원이름</th>
					<th>부서명</th>
					<th>직급</th>
					<th>출근</th>
					<th>퇴근</th>		
					<th>상태</th>
				</tr>	
		<c:if test="${!empty list }">
			<c:forEach var="map" items="${list }">
				<tr>
					<!-- 해당 사원의 근태관리로 갑니다.  -->
					<td><a href="<c:url value='/commue/adm/searchEmpName.do?empName=${map["EMP_NAME"] }' />">${map['EMP_NAME'] }</a></td>
					<!-- 해당 부서근태를 보여줍니다. -->
					<td><a href="<c:url value='/commue/adm/searchDeptName.do?deptName=${map["DEPT_NAME"] }' />">${map['DEPT_NAME'] }</a></td>
					<!-- 해당 직급근태를 보여줍니다.  -->
					<td><a href="<c:url value='/commue/adm/searchPosName.do?posName=${map["POS_NAME"] }' />">${map['POS_NAME'] }</a></td>
					<td id="cmtT">${map['CMTIN'] }</td>
					<td id="cmtT">${map['CMTOUT'] }</td>
					<c:if test="${map['CMT_STATUS'] eq ('Y') }">
						<td>출근</td>	
					</c:if>
					<c:if test="${map['CMT_STATUS'] eq ('N') }">
						<td>퇴근</td>
					</c:if>
					<c:if test="${empty map['CMT_STATUS'] }">
						<td>기록이 없습니다</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
			</table>
	</div>
	<div id="pagingbtn">
			<!-- 이전 블럭으로 이동 ◀ -->
			<c:if test="${pagingInfo.firstPage>1 }">
				<a id="prevbtn" href="#" onclick="pageFunc(${pageInfo.firstPage-1})"><i class="fa fa-chevron-left"></i></a>	
			</c:if>	
		
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
				<c:if test="${i==pagingInfo.currentPage}">
					<span class="thispage">${i }</span>	
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage}">
					<a href="#" onclick="pageFunc(${i })">${i }</a>		
		 		</c:if>				
			</c:forEach>
			<!-- 다음 블럭으로 이동 ▶ -->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				<a id=nextbtn href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"><i class="fa fa-chevron-right"></i></a>
			</c:if>
		</div>
</body>
</html>
<%@include file="commueBottom.jsp" %>