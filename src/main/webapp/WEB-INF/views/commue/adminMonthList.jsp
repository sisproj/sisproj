<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../inc/admTop.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function () {	
		$.setYear();
		$.setMonth();
	});	
	$.setYear=function(){
		//현재년도에서 5년전 부터 출력
		var date = new Date();
		var year = date.getFullYear(); //2018
		
		var ye = "${param.year}";
		
		for(var i=year;i>=year-10;i--){
			if(ye==i){
				$('#year').append("<option value='"+i+"' selected>"+i+"</option>");
			}else{
				$('#year').append("<option value='"+i+"' >"+i+"</option>");					
			}
		}
	}
	$.setMonth=function(){
		var mo = "${param.month}";
		for(var i=1;i<=12;i++){	
			if(mo==i){
				$('#month').append("<option value='"+$.formatDate(i)+"' selected>"+i+"</option>");
			}else{
				$('#month').append("<option value='"+$.formatDate(i)+"'>"+i+"</option>");				
			}
		}
	}
	 $.convertDate=function(date){
			return date.getFullYear()+"-"+$.formatDate(date.getMonth()+1)+"-"
			 + $.formatDate(date.getDate());
		}
		
		$.formatDate = function(d){
			var result=d;
			if(d<10){
				result="0"+d;
			}
			return result;
		}
	 function pageFunc(curPage){
			document.frmDate.currentPage.value=curPage;
			frmDate.submit();
	}
	
</script>

</head>
<body>

    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;월별 근태현황&nbsp;
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
		<div id="dimyPage">	
			<div id="diBtCa">
				<div id="diCal">
					<span id="spDate"></span>
				</div>			
			<form name="frmDate" id="frmDate" method="post" action="<c:url value='/commue/adm/adminMonthList.do' />">
				<input type="hidden" id="currentPage" name="currentPage" value="1">
				<div id="diSearch" style="margin-left: 10px;">
					 <select id="year" name="year">
					</select>년
					<select id="month" name="month">				
					</select>월
						<input type="submit" id="btSearch" value="검색">					
				</div>
			</div>
		</div>
		<div id="diPage">
			<table id="allList" border="1">
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
			<c:if test="${empty list }">
					<tr>
						<td colspan="6">데이터가 없습니다</td>
					</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="map" items="${list }">
					<tr>
						<!-- 해당 사원의 근태관리로 갑니다.  -->
						<td><a href="<c:url value='/commue/adm/adminMonthList.do?empName=${map["EMP_NAME"] }&year=${year }&month=${month } ' />">${map['EMP_NAME'] }</a></td>
						<!-- 해당 부서근태를 보여줍니다. -->
						<td><a href="<c:url value='/commue/adm/adminMonthList.do?deptName=${map["DEPT_NAME"] }&year=${year }&month=${month }' />">${map['DEPT_NAME'] }</a></td>
						<!-- 해당 직급근태를 보여줍니다.  -->
						<td><a href="<c:url value='/commue/adm/adminMonthList.do?posName=${map["POS_NAME"] }&year=${year }&month=${month }' />">${map['POS_NAME'] }</a></td>
						<c:set var="vo" value="" />
						<td id="cmtT">${map['CMTIN'] }</td>
						<td id="cmtT">${map['CMTOUT'] }</td>
						<c:if test="${map['CMT_STATUS'] eq ('Y')}">
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
		</form>
</body>
</html>
       <!-- 3. 내용 끝 -->
    </article>

    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>