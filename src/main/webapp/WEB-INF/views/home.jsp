<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="inc/top.jsp" %>
        <!-- 0. include부분 -->
        <nav>
            <div id="mainCalendar">
            	캘린더
            </div>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="homesection">
        <div id="mainbanner">
        	<c:import url="/mainbanner.do"></c:import>
        </div>
        <div id="clockSection">
        	<c:import url="/clock.do"></c:import>
        </div>
        <div class="clr"></div>
        <div id="mainTable">
        	<div id="mainNoti">
        		<h4><i class="fa fa-bullhorn"></i> 공지 사항</h4>
        		<table>
       				<colgroup>
       					<col width="70%">
       					<col width="30%">
       				</colgroup>
        			<thead>
	        			<tr>
	        				<th>제목</th>
	        				<th>작성일</th>
	        			</tr>
        			</thead>
        			<tbody>
	        			<tr>
	        				<td>제목</td>
	        				<td>18-01-04</td>
	        			</tr>
        			</tbody>
        		</table>
        	</div>
        	<div id="mainConfirm">
        		<h4><i class="fa fa-book"></i> 전자 결재</h4>
        		<table>
       				<colgroup>
       					<col width="50%">
       					<col width="20%">
       					<col width="30%">
       				</colgroup>
        			<thead>
	        			<tr>
	        				<th>제목</th>
	        				<th>기안자</th>
	        				<th>기안일</th>
	        			</tr>
        			</thead>
        			<tbody>
	        			<tr>
	        				<td>제목</td>
	        				<td>김연아</td>
	        				<td>18-01-04</td>
	        			</tr>
        			</tbody>
        		</table>
        	</div>
        	<div id="mainMessage">
        		<h4><i class="fa fa-envelope"></i> 받은 쪽지함</h4>
        		<table>
       				<colgroup>
       					<col width="20%">
       					<col width="50%">
       					<col width="30%">
       				</colgroup>
        			<thead>
	        			<tr>
	        				<th>발신인</th>
	        				<th>제목</th>
	        				<th>날짜</th>
	        			</tr>
        			</thead>
        			<tbody>
	        			<tr>
	        				<td>김연아</td>
	        				<td>제목</td>
	        				<td>18-01-04</td>
	        			</tr>
        			</tbody>
        		</table>
        	</div>
        </div>
    </article>
    <!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(1) a').addClass('active');
            
            $('#organ').css('height', '350px');
			$('#orgUp').hide();
			$('#orgDown').hide();
			$('#organbody').show();
        });
    </script>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <!-- 0. include부분 끝-->
<%@include file="inc/bottom.jsp" %>
<style>
	#mainCalendar{
		width: 280px;
		height:	250px;
		border : 2px solid #fff;
		margin: 0 auto;
		color: #fff;
	}
	section #homesection{
		position: relative;
		top: 94px;
		width: calc(100% - 300px);
		min-width:1065px;
		margin:0 40px 50px 300px;	
	}
	#mainbanner{
		width:760px;
		float:left;
	}
	#clockSection{
		float:left;
		width:calc(100% - 760px);
		min-height: 150px;
		box-sizing: border-box;
	}
	#mainTable{
		display: -webkit-box;
		box-sizing: border-box;
		width: 100%;
		margin-top:10px;
	}
	#mainTable div{
		box-sizing: border-box;
		min-height: 300px;	
/*		border : 1px solid #aaa;
 		border-radius: 10px;
		padding:5px; */
	}
	#mainTable #mainNoti{
		width: calc(40% - 10px);
		margin-right: 10px;
	}
	#mainTable #mainConfirm{
		width: calc(30% - 10px);
		margin-right: 10px;
	}
	#mainTable #mainMessage{
		width: calc(30% - 10px);
	}
	#mainTable h4{
		width: 100%;
		height: 40px;
		box-sizing: border-box;
		padding-left: 15px;
		line-height: 40px;
		margin-bottom: 5px;
		font-size: 1.2em;
	}
	#mainTable table{
		width: 100%;
		box-sizing:border-box;
		border:0;
		border-collapse: collapse;		
	}
	#mainTable tr{
		transition:all 300ms linear;
	}
	#mainTable tbody tr:hover{
		background-color: #e1e1e1;
	}
	#mainTable th{
		box-sizing:border-box;
		padding: 5px;
		height: 20px;
		color: #036;
		font-size: 1em;
		border:0;
		border-top: 2px solid #e1e1e1;
		border-bottom: 2px solid #e1e1e1;
	}
	#mainTable td {
		box-sizing:border-box;
		padding: 5px;
		font-size: 0.9em;
		border:0;
		text-align: center;
		border-bottom: 2px solid #e1e1e1;
	}
	/*공지사항*/
	#mainNoti h4 {
		background-color: #dc3545;
		color: #fff;
		box-shadow: 1px 1px 3px #aaa;
	}
	#mainNoti h4 i{
		color: #fff;		
	}
	/*전자결재*/
	#mainConfirm h4 {
		background-color: #ffc107;
		color: #fff;
		box-shadow: 1px 1px 3px #aaa;
	}
	#mainConfirm h4 i{
		color: #fff;		
	}
	/*받은쪽지함*/
	#mainMessage h4 {
		background-color: #7f31ff;
		color: #fff;
		box-shadow: 1px 1px 3px #aaa;
	}
	#mainMessage h4 i{
		color: #fff;		
	}
</style>