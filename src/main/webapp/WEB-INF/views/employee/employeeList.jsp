<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="#"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<span>사원 등록</span></a></li>
                <li><a href="#"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;<span>사원 조회 </span></a></li>             
                <li><a href="#"><i class="fa fa-hdd-o"></i>&nbsp;<span>정보 수정</span></a></li>
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;사원 조회&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
<div id="dimyPage" style="margin-left: 30px;">
	<form id="searchEmp" name="searchEmp" action="list.do">
		<div id="dimyPage">
			<select>
				<option value="사원이름">사원이름</option>
				<option value="사원번호">사원번호</option>
				<option value="부서">부서</option>
				<option value="직급">직급</option>
			</select>
			<input type="text" id="search" name="serach">
			<input type="submit" id="btSear" value="검색">
			<span style="float: right;">검색조건 <span style="color: blue;">사원이름</span> 검색조회 <span style="color: blue;">5</span>건</span>
		</div>
	</form>
	<table id="emplist" border="1">
		<tr>
			<th style="width: 10%">사원번호</th>
			<th>사원이름</th>
			<th>사원부서</th>
			<th>사원직급</th>
			<th>재직여부</th>
		</tr>
		<!-- for문 사원 리스트 시작 -->
		<c:forEach begin="0" end="20">
				<tr>				
					<td>5</td>
					<!-- 사원번호로 사원 디테일 이동 -->
					<td><a href="<c:url value='/employee/employeeDetail.do'/>">홍길동</a></td>
					<td >인사팀</td>
					<td>과장</td>
					<td>재직</td>
				</tr>
		</c:forEach>
		<!-- for문 끝 -->
		<!-- 페이징 처리 해야하는 곳 20명 단위로 계산 부트스트랩 사용 페이징 스타일-->
	</table>
</div>    	
        <!-- 3. 내용 끝 -->
    </article>
    <!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(6) a').addClass('active');
        });
    </script>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>