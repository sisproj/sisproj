<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="employeeTop.jsp" %>
<article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;사원 리스트&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
    </article>
<article id="bodysection">
<div id="dimyPage">
	<form id="searchEmp" name="searchEmp" method="post" action="employee/employeeList.do">
	        <div id="dimyP">
		        <select name="searchCondition">
		            <option value="empname"
		            	<c:if test="${param.searchCondition=='empName' }"> 
		            		selected
		            	</c:if>
		            	>사원이름</option>
		            <option value="deptName"
		            	<c:if test="${param.searchCondition=='deptName' }"> 
		            		selected
		            	</c:if>    
		            >사원부서</option>
		            <option value="posName" 
		            	<c:if test="${param.searchCondition=='posName' }"> 
		            		selected
		            	</c:if>
		            >사원직급</option>
		        </select>   
		        <input type="text" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword }">   
				<input type="submit" value="검색">
			    <select id="pl" style="float: right;">
					<option value="10">10명</option>
					<option value="20">20명</option>
				</select>
			</div>

	<div id="diempList">
		<div id="coLi">
		<table id="allList" border="1">
			<colgroup>
				<col width="5%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="5%">
			</colgroup>
			<tr>
				<th><input type="checkbox" id="chkAll" name="chkAll"></th>
				<th style="width: 10%">사원번호</th>
				<th>사원이름</th>
				<th>사원부서</th>
				<th>사원직급</th>
				<th>전화번호</th>
				<th>재직여부</th>
				<th></th>				
			</tr>
			<!-- for문 사원 리스트 시작 -->
			<c:forEach var="vo" items="${list}" varStatus="status">	
				<c:if test="${empty list}">
					<td colspan="7">사원 데이터가 없습니다</td>
				</c:if>
				<%-- <c:if test="${empty vo.empOutdate }"> --%>
					<tr>	
						<td><input type="checkbox" name="empItems[${status.index}].empNo" value="${vo.empNo }"></td>			
						<td>${vo.empNo }</td>
						<!-- 사원번호로 사원 디테일 이동 -->
						<td><a href="<c:url value='/employee/employeeDetail.do?empNo=${vo.empNo }'/>">${vo.empName }</a></td>
						<td>${vo.deptName }</td>
						<td>${vo.posName }</td>
						<td>${vo.empTel }</td>
					<c:if test="${empty vo.empOutdate }" >
						<td>재직</td>
					</c:if>
					<c:if test="${!empty vo.empOutdate }">
						<td>퇴직</td>
					</c:if>
					<td></td>
					</tr>
			</c:forEach>	
			<!-- for문 끝 -->
			<!-- 페이징 처리 해야하는 곳 10명,25명 단위로 계산 부트스트랩 사용 페이징 스타일-->
		</table>
	</div>
	<div style="float: right;"> 
		<input type="button" id="btCh" name="btCh" value="퇴사" style="width: 90%;">
	</div>
		<div style="text-align: center;width: 90%;">
			<%@include file="../addrBook/paging.jsp" %>
			<input type="button" id="btCh" name="btCh" value="퇴사">
		</div>
  </form> 	
</div> 
    </article>
        <!-- 3. 내용 끝 -->
<script type="text/javascript">
	$(function () {
		$('#btDeSe').click(function(){
			window.open('<c:url value='/employee/employeeDetailSearch.do'/>','chk',
					'left=0,top=0,width=500,height=250,locations=yes,resizable=yes');
		});
			$('input[name=chkAll]').click(function(){

				$('input[type=checkbox]').prop('checked', this.checked);
				
			});
			
			$('#btCh').click(function(){
				//선택한 사원 퇴사
				var len =$('td input[type=checkbox]:checked').length;
				if(len==0){
					alert('퇴사시킬 사원을 먼저 체크하세요');
					return;
				}
				
				$('#searchEmp').prop('action','<c:url value="/employee/employeeOut.do"/>');
				$('#searchEmp').submit();			
			});
	});
</script>

<%@include file="employeeBottom.jsp" %>