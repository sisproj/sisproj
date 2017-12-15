<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
<link rel="stylesheet" href="<c:url value="/resources/css/commueStyle.css"/>">
<script type="text/javascript">
	$(function () {
		$('#DeSe').click(function () {
			window.open('<c:url value='/employee/employeeDetailSerach.do'/>','chk',
				'left=0,top=0,width=500,height=250,locations=yes,resizable=yes');
		});
	});
</script>
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="<c:url value='/commue/commueDateList.do'/>"><i class="fa fa-address-card-o" aria-hidden="true"></i>&nbsp;<span>일별 근태현황</span></a></li>
                <li><a href="<c:url value='/commue/commueMonthList.do'/>"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;<span>월별 근태현황</span></a></li>        
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
					<input type="button" id="DeSe" name="DeSe" value="상세검색">
					<input type="button" id="btExel" name="btExel" value="엑셀다운로드">
					<select style="float: right;">
						<option value="10개">10개</option>
						<option value="20개">20개</option>
					</select>
				</div>
			</div>
		</form>