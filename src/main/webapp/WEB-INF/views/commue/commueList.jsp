<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="#"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<span>근태 현황</span></a></li>
                <li><a href="#"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;<span>부서 근태</span></a></li>             
                <li><a href="#"><i class="fa fa-hdd-o"></i>&nbsp;<span>정보 수정</span></a></li>
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;근태 현황&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
<div id="dimyPage">
		<form id="frmCom" name="frmCom" action="">
			<div id="diBtCa">
				<div id="diCal">
				<!-- 년/월 뒤로가기 앞으로가기 
				년/월을 선택시 날짜나오게 하는 건 생각중...-->
				<a href="#"><i class="fa fa-angle-left" aria-hidden="true" style="size:1.2em;"></i></a>&nbsp
				<span>2017 1월</span>
				&nbsp<a href="#"><i class="fa fa-angle-right" aria-hidden="true" style="size: 1.2em;"></i></a>
				</div>
				<input type="button" id="btMCom" name="btDCom" value="월별">
				<input type="button" id="btDCom" name="btMCom" value="일별">
			</div>
		</form>
	<%-- 	<div>
	    	<table id="comTb" border="1" >
	    		<colgroup>    			
	    			<col width="10%;">
	    			<col width="5%;">		
	    			<col width="2.5%;">	
	    		</colgroup>
	    		<tr>
	    			<th>사원</th>
	    			<th>상태</th>
	    			<c:forEach var="i" begin="0" end="31">
	    				<td style="text-align: center;">1</td>
	    			</c:forEach>
	    		</tr>
	    			<c:forEach begin="0" end="3">	
	    		<tr>
	    			<!-- 사원이름 / 부서이름 / 직급 -->
	    			<th rowspan="3">김길동  인사팀  과장</th>
	    			<th>출근</th>
	    			<c:forEach begin="0" end="31">
	    				<td>08:59</td>
	    			</c:forEach> 
	    		</tr>
	    		<tr>
	    			<th>퇴근</th>
	    			<c:forEach begin="0" end="31">
	    			<td>08:59</td>
	    			</c:forEach> 
	    		</tr>
	    		<tr>
	    			<th>상태</th>
    				<c:forEach begin="0" end="31">
    					<td>출근</td>
    				</c:forEach> 
	    		</tr>
	    	</c:forEach>	
	    	</table>
	    </div>		
	</table> --%>
	<table id="comTb" border="1" >
		<tr>
			<th>사원</th>
			<th>부서명</th>
			<th>직급</th>
			<th>출근</th>
			<th>근무시간</th>			
			<th>상태</th>
		</tr>
		<tr>
			<!-- 이름클릭시 개인 출결 상태로 이동 -->
			<td><a href="#">김길동</a></td>
			<td>인사팀</td>
			<td>과장</td>
			<td>09:59</td>
			<!-- (퇴근을 누른경우 나옴) -->
			<td>9시간</td>
			<td>퇴근</td>
		</tr>
	</table>
</div>    	
        <!-- 3. 내용 끝 -->
    </article>
    <!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(6) a').addClass('active');
            $('#diBtCa').click(function() {
				
			});
        });
    </script>
	<style>
		#dimyPage #diBtCa input[type=button]{
			border-radius:0;
			background-color:rgb(221,221,221);
		}
		#dimyPage #diBtCa #btMCom{
			float: left;
		}
		#dimyPage #comTb{
		
			border: none;
			border-color:rgb(221,221,221);
			width: 95%;
			border-collapse: collapse;
		}
		#dimyPage #comTb td{
			font-size: 0.9em;
			text-align: center;
			border-bottom-color: black;
		}
		#dimyPage #comTb th{
			border-color:rgb(0,102,153);
			text-align:center;
			min-width: 56px;
			min-height: 67px;
			background-color: rgb(0,102,153);
			color: white;
		}
		#dimyPage #diBtCa #diCal{
			font-weight: bold;
			font-size: 1.5em;
			text-align: center;
			margin:  0 0 0 180px;
		}
		
	</style>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(7) a').addClass('active');
        });
    </script>
    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>