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
	<form id="searchEmp" name="searchEmp" action="list.do">
		<div id="dimyP">
			<select>
				<option value="사원이름">사원이름</option>
				<option value="사원번호">사원번호</option>
				<option value="부서">부서</option>
				<option value="직급">직급</option>
			</select>
			<input type="text" id="search" name="serach">
			<input type="submit" id="btSear" value="검색">
			<input type="button" id="btDeSe" name="btDeSe" value="상세조회">
			<select id="pl" style="float: right;">
				<option value="10">10명</option>
				<option value="20">20명</option>
			</select>
		</div>
	</form>
	<div id="diempList">
		<div id="coLi">
		<table id="allList" border="1">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<tr>
				<th style="width: 10%">사원번호</th>
				<th>사원이름</th>
				<th>사원부서</th>
				<th>사원직급</th>
				<th>재직여부</th>
				<th>권한부여</th>
				<th></th>			
			</tr>
			<!-- for문 사원 리스트 시작 -->
			<c:forEach begin="0" end="5">	
					<tr>				
						<td>5</td>
						<!-- 사원번호로 사원 디테일 이동 -->
						<td><a href="<c:url value='/employee/employeeDetail.do'/>">홍길동</a></td>
						<td>인사팀</td>
						<td>과장</td>
						<td>재직</td>
					<!-- if걸어서 관리자 일때만 나오게 함 관리자권한으로 되면 버튼 사라지고 그자리에 관리자로 바꿈 -->
						<td id="PoCh"><a href="#"><i class="fa fa-arrow-up" aria-hidden="true"></i></a></td>
					<!-- 	<td>관리자</td> -->
						<td></td>
					</tr>
			</c:forEach>	
			<!-- for문 끝 -->
			<!-- 페이징 처리 해야하는 곳 10명,25명 단위로 계산 부트스트랩 사용 페이징 스타일-->
		</table>
		
	</div>
	<div style="text-align: center;width: 90%;">
		<%@include file="../addrBook/paging.jsp" %>
	</div>
</div>    	
    </article>
        <!-- 3. 내용 끝 -->
<script type="text/javascript">
	$(function () {
		$('#PoCh').click(function(){
			confirm("관리자로 올리시겠습니까?");
		});
		$('#btDeSe').click(function(){
			window.open('<c:url value='/employee/employeeDetailSerach.do'/>','chk',
					'left=0,top=0,width=500,height=250,locations=yes,resizable=yes');
		});
	});
</script>

<%@include file="employeeBottom.jsp" %>