<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="employeeTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function () {	
		$('#btDeSe').click(function(){
			window.open('<c:url value='/employee/employeeDetailSearch.do'/>','chk',
					'left=0,top=0,width=500,height=250,locations=yes,resizable=yes');
		});
			$('input[name=chkAll]').click(function(){
	
				$('input[type=checkbox]').prop('checked', this.checked);
				
			});
			//선택한 사원 퇴사					
			$('#btOu').click(function(){
				var len = $('td input[type=checkbox]:checked').length;
				if(len==0){
					alert('퇴사시킬 사원을 먼저 체크하세요');
					return;
				}			
				$('#searchEmp').prop('action','<c:url value="/employee/employeeOut.do"/>');
				$('#searchEmp').submit();				
			});
			
			//선택한 사원 복직					
			$('#btCo').click(function(){
				var len = $('td input[type=checkbox]:checked').length;
				if(len==0){
					alert('복직시킬 사원을 먼저 체크하세요');
					return;
				}
				
				$('#searchEmp').prop('action','<c:url value="/employee/employeeCome.do"/>');
				$('#searchEmp').submit();				
			});
			
			$('#pl option:selected').change(function () {
				var total =  $('#pl option:selected').val();
							
			});
			
	});
	 function pageFunc(curPage){
		document.searchEmp.currentPage.value=curPage;
		searchEmp.submit();
	} 
</script>
<article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;사원 리스트&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
    </article>
<article id="bodysection">
<div id="dimyPage">
	<form id="searchEmp" name="searchEmp" method="post" action="<c:url value='/employee/employeeList.do'/>">	
	<input type="hidden" id="currentPage" name="currentPage" value="1">
	
	        <div id="dimyP">
		        <select name="searchCondition">
		            <option value="emp_name"
		            	<c:if test="${param.searchCondition=='empName' }"> 
		            		selected
		            	</c:if>
		            	>사원이름</option>
		            <option value="dept_name"
		            	<c:if test="${param.searchCondition=='deptName' }"> 
		            		selected
		            	</c:if>    
		            >사원부서</option>
		            <option value="pos_name" 
		            	<c:if test="${param.searchCondition=='posName' }"> 
		            		selected
		            	</c:if>
		            >사원직급</option>
		        </select>   
		        <input type="text" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword }">   
				<input type="submit" value="검색">
				<!-- <input type="button" id="btEx" name="btEx" value="엑셀다운로드"> -->
			    <select id="pl" style="float: right;">
					<option value="10">10명</option>
					<option value="20">20명</option>
					<option value="30">30명</option>
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
				<th>사원번호</th>
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
					<tr>
						<td><input type="checkbox" name="empItems[${status.index}].empNo" value="${vo.empNo}"></td>	
						<td>${vo.empNo }</td>
						<!-- 사원번호로 사원 디테일 이동 -->
						<td><a href="<c:url value='/employee/employeeDetail.do?empNo=${vo.empNo }'/>">${vo.empName}</a></td>
						<td>${vo.deptName }</td>
						<td>${vo.posName }</td>
						<td>${vo.empTel }</td>
					<c:if test="${empty vo.empOutdate }" >
						<td>재직</td>
					</c:if>
					<c:if test="${!empty vo.empOutdate }">
						<td>퇴사</td>
					</c:if>
					<td></td>
					</tr>
			</c:forEach>	
			<!-- for문 끝 -->
			<!-- 페이징 처리 해야하는 곳 10명,25명 단위로 계산 부트스트랩 사용 페이징 스타일-->
		</table>
	</div>
	<c:if test="${sessionScope.empVo.empLev=='관리자' }">
	<div style="text-align: right; margin-top: 3px;width:90%; ">
		<input type="button" id="btOu" name="btOu" value="퇴사">
		<input type="button" id="btCo" name="btCo" value="복직">
	</div>
	</c:if>
		<div id="pagingbtn">
			<ul>
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
			</ul>
		</div>
	</div> 
</form>
    </article>
        <!-- 3. 내용 끝 -->
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
		max-width:1100px;
		margin: 0 auto;
		padding : 10px;
		box-sizing:border-box;
		border:0;
		border-collapse: collapse;
	}
	#allList tr{
		transition:all 300ms linear;
	}
	#allList td b{
		color: #306;	
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
	
</style>
<%@include file="employeeBottom.jsp" %>