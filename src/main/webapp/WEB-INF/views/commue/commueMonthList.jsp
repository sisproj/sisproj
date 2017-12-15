<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="#"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<span>사원 근태현황</span></a></li>
                <li><a href="#"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;<span>부서 근태현황</span></a></li>        
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
				<div id="diSel">
					<input type="button" id="btMCom" name="btDCom" value="월별">
					<input type="button" id="btDCom" name="btMCom" value="일별">
					<input type="button" id="btExel" name="btExel" value="엑셀다운로드">
					<select style="float: right;">
						<option value="10개">10개</option>
						<option value="30개">30개</option>
					</select>
				</div>
			</div>
		</form>
	<div id="diMo">
	    	 <table id="MoList" border="1" >
	    		<colgroup>    			
	    			<col width="10%;">
	    			<col width="5%;">		
	    			<col width="2.5%;">	
	    		</colgroup>
	    		<tr id="fEmp">
	    			<th>사원</th>
	    			<th>상태</th>    			
	    		<c:forEach var="i" begin="1" end="30">
	    				<td style="text-align: center;">${i }</td>  				    							
	    		</c:forEach>				
	    		</tr>  			
	    		<tr>
	    			<!-- 사원이름 / 부서이름 / 직급 -->
	    			<th rowspan="3">김길동  인사팀  과장</th>	     			   
	    			<th>출근</th>  				
   				<c:forEach var="i" begin="1" end="6">		    							
	    				<td>08:1${i}</td>    					
	    		</c:forEach>	
	    		</tr>
	    		<tr>
	    			<th>퇴근</th>  		
   					<c:forEach var="i" begin="1" end="6">	
		    			<td>17:1${i}</td>    			
    				</c:forEach>	   
	    		</tr>
	    		<tr>
	    			<th>상태</th>
	    			<c:forEach begin="1" end="15">	
   					<td>출근</td>
   					<td>퇴근</td>
 					</c:forEach>	   	
	    		</tr>
	    	</table>
	    </div>	
	<!-- <table id="DList" border="1" >
		<tr>
			<th>사원</th>
			<th>부서명</th>
			<th>직급</th>
			<th>출근</th>
			<th>근무시간</th>			
			<th>상태</th>
		</tr>	
		<tr>
			이름클릭시 개인 출결 상태로 이동
			<td><a href="#">김길동</a></td>
			<td>인사팀</td>
			<td>과장</td>
			<td>09:59</td>
			(퇴근을 누른경우 나옴)
			<td>9시간</td>
			<td>퇴근</td>
		</tr>
		<tr>
			이름클릭시 개인 출결 상태로 이동
			<td><a href="#">김연아</a></td>
			<td>홍보팀</td>
			<td>대리</td>
			<td>08:03</td>
			(퇴근을 누른경우 나옴)
			<td>4시간</td>
			<td>출근</td>
		</tr>
		<tr>
			이름클릭시 개인 출결 상태로 이동
			<td><a href="#">박태환</a></td>
			<td>재무팀</td>
			<td>차장</td>
			<td>07:59</td>
			(퇴근을 누른경우 나옴)
			<td>5시간</td>
			<td>출근</td>
		</tr>
		<tr>
			이름클릭시 개인 출결 상태로 이동
			<td><a href="#">손연재</a></td>
			<td>영업팀1</td>
			<td>부장</td>
			<td>08:44</td>
			(퇴근을 누른경우 나옴)
			<td>7시간</td>
			<td>출근</td>
		</tr>
		<tr>
			이름클릭시 개인 출결 상태로 이동
			<td><a href="#">손흥민</a></td>
			<td>영업팀1</td>
			<td>대리</td>
			<td>08:59</td>
			(퇴근을 누른경우 나옴)
			<td>4시간</td>
			<td>조퇴</td>
		</tr>
		<tr>
			이름클릭시 개인 출결 상태로 이동
			<td><a href="#">김구라</a></td>
			<td>영업팀2</td>
			<td>과장</td>
			<td>09:59</td>
			(퇴근을 누른경우 나옴)
			<td>4시간</td>
			<td>출근</td>
		</tr>
	</table>
	-->
	<span style="color: red;">지각</span>
	<span style="color: blue;">출근</span>
</div>    
        <!-- 3. 내용 끝 -->
    </article>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(6) a').addClass('active');
        });
    </script>
    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>