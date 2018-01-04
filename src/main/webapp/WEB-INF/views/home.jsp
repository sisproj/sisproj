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
        <div id="clock">
        	시계! 난크다
        </div>
        <div class="clr"></div>
        <div id="mainTable">
        	<div id="mainNoti">
        		공지사항
        	</div>
        	<div id="mainConfirm">
        		결재대기함
        	</div>
        	<div id="mainMessage">
        		받은쪽지함
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
		margin:0 40px 50px 300px;	
	}
	#mainbanner{
		width:760px;
		float:left;
	}
	#clock{
		float:left;
		width:calc(100% - 760px);
		min-height: 250px;
		border : 2px solid #000;
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
		border : 2px solid #000;
		height: 300px;	
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
</style>