<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>

    <!-- font icon, FA -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mainStyle.css"/>">
    <!-- jquery-ui css -->
    <link rel="stylesheet" href="<c:url value="/resources/jquery-ui/jquery-ui.min.css"/>">

    <!-- jquery -->
    <script src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/jquery/jquery.easing.1.3.js"/>"></script>
    <!-- jquery-ui -->
    <script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/>"></script>
	<!-- smart editor 2.0 -->
	<script type="text/javascript" src="<c:url value='/resources/se2/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script>
    <!-- mainjs -->
    
    <script src="<c:url value="/resources/js/mainjs.js"/>"></script>
    <script type="text/javascript">
    	$(function(){
    		$('#orgDown').hide();
   			$('#organbody').hide();
   			$('#deptMinus').hide();
   			$('#organbody ul ul li').hide();
    		$('#orgUp').click(function(){
    			$('#organ').css('height','500px');
    			$('#orgUp').hide();
    			$('#orgDown').show();
    			$('#organbody').show();
    		});
    		$('#orgDown').click(function(){    			
    			$('#organ').css('height','40px');
    			$('#orgDown').hide();
    			$('#orgUp').show();
    		});
    		$('#deptPlus').click(function(){
    			/* var cho = $(this).attr('id'); */
    			$('#organbody ul ul li').show();
    			$('#deptPlus').hide();
    			$('#deptMinus').show();
    		});
    		$('#deptMinus').click(function(){
    			$('#organbody ul ul li').hide();
    			$('#deptPlus').show();
    			$('#deptMinus').hide();
    		});
    	});
    </script>
</head>
<body>
<!-- 상단부분 -->
<header>
    <h1><a href="#"><img src="<c:url value="/resources/images/logo_w.png"/>" alt=""></a></h1>
    <nav>
        <ul>
            <li><a href="#">HOME</a></li>
            <li><a href="<c:url value='/phoneBook/phoneBookList.do'/>">주소록</a></li>
            <li><a href="#">메신저</a></li>
            <li><a href="#">스케줄</a></li>
            <li><a href="#">자원관리</a></li>
            <li><a href="<c:url value='/confirm/main.do'/>">전자결재</a></li>
            <li><a href="#">근태관리</a></li>
            <li><a href="#">웹하드</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">사내뉴스</a></li>
        </ul>
    </nav>
</header>
<section>
    <div id="bookmark" class="hidden">
        <div id="bookmarkbtn">
            <i class="fa fa-bookmark" aria-hidden="true"></i>
            <span class="bold" style="display:none">Bookmark</span>
        </div>
        <ul>
            <!-- 북마크 리스트 -->
            <li>
                <hr>
            </li>
            <li><a href="#"><i class="fa fa-pencil-square-o"></i><span style="display:none">&nbsp;전자결재</span></a></li>
            <li><a href="#"><i class="fa fa-calendar"></i><span style="display:none">&nbsp;스케쥴</span></a></li>
            <li><a href="#"><i class="fa fa-id-badge"></i><span style="display:none">&nbsp;근태관리</span></a></li>
            <!-- 북마크 리스트 끝 -->
        </ul>
    </div>
    <!-- 왼쪽 사이드 메뉴 -->
    <aside>
        <div id="loginfo">
            <div id="photo">
                <img src="<c:url value="/resources/images/avatar.png"/>" alt="사진이미지">
            </div>
            <div id="info">
                <ul>
                    <li><i class="fa fa-id-card"></i>&nbsp;<span class="name bold">이름(id)</span></li>
                    <li><i class="fa fa-cog"></i>&nbsp;<span><a href="#">개인정보수정</a></span></li>
                    <li><i class="fa fa-envelope"></i>&nbsp;<span><a href="#">쪽지</a></span>&nbsp;<span
                            class="red">0</span></li>
                    <li><i class="fa fa-comments"></i>&nbsp;<span><a href="#">대화</a></span>&nbsp;<span
                            class="red">0</span></li>
                    <li><i class="fa fa-pencil-square-o"></i>&nbsp;<span><a href="#">결재할 문서</a></span>&nbsp;<span
                            class="red">0</span></li>
                </ul>
            </div>
            <div id="asidebtn">
                <ul>
                    <li><a href="#">출근</a></li>
                    <li><a href="<c:url value='/login.do'/>">로그 아웃</a></li>
                </ul>
            </div>

        </div>
        <style>
        	#organ{
        		
        	}
        	#organtitle{
        		line-height: 40px;
        	}
        	#organtitle > i{margin-left: 3px;}
        	#orgSearch{
        		width: 200px; 
        		color: #fff; 
        		background-color:#333; 
        		border: 0; 
        		height: 25px;
        		box-sizing:border-box;
        		padding-left: 10px;
        	}
        	#organbody ul li{      		
        		padding-left: 10px;
        	}
        	#organbody ul ul li{      		
        		padding-left: 20px;
        	}
        	#organbody{background: white; height: 445px; margin: 0 5px; padding: 5px;}
        	#organbody ul li ul li i{
        		color: rgb(119, 198, 231);
        	}
        	.orgSearch{
        		display: inline-block;
        		height: 30px;
        		padding: 0;
        	}
        	#orgSearchIcon{
        		display:inline-block;
        		background-color:#333;
        		color: rgb(82,82,82);
        		width:40px;
        		height: 25px;
        		text-align: center;
        		vertical-align: middle;
        		margin-top: -1px;
        	}
        	#orgSearchIcon i {
        		display:inline-block;
        		line-height: 25px;        	
        	}
        </style>
        <div id="organ">
            <div id="organtitle">
	            <i class="fa fa-sitemap" aria-hidden="true"></i>
	            <div class="orgSearch">
		            <input type="text" id="orgSearch" name="orgSearch" placeholder="부서/이름/아이디/직급/직책"><a href="#" id="orgSearchIcon"><i class="fa fa-search"></i></a>
	            </div>
	            <i id="orgUp" class="fa fa-chevron-up" aria-hidden="true"></i>
	            <i id="orgDown" class="fa fa-chevron-down" aria-hidden="true"></i>
            </div>
            <div id="organbody">
            	<ul>
            		<li><i id="deptPlus" class="fa fa-plus-square" aria-hidden="true"></i>
            		<i id="deptMinus" class="fa fa-minus-square" aria-hidden="true"></i>
            		 부서1
            			<ul>
            				<li><i class="fa fa-user" ></i> 김팀장</li>
            				<li><i class="fa fa-user"></i> 이과장</li>
            				<li><i class="fa fa-user"></i> 박대리</li>
            				<li><i class="fa fa-user"></i> 정사원</li>
            				<li><i class="fa fa-user"></i> 최인턴</li>
            			</ul>
            		</li>
            	</ul>
            	<ul>
            		<li><i id="deptPlus" class="fa fa-plus-square" aria-hidden="true"></i>
            		<i id="deptMinus" class="fa fa-minus-square" aria-hidden="true"></i>
            		 부서2
            			<ul>
            				<li><i class="fa fa-user" aria-hidden="true" style="color: rgb(119, 198, 231);"></i> 김팀장</li>
            				<li><i class="fa fa-user" aria-hidden="true" style="color: rgb(119, 198, 231);"></i> 이과장</li>
            				<li><i class="fa fa-user" aria-hidden="true" style="color: rgb(119, 198, 231);"></i> 박대리</li>
            				<li><i class="fa fa-user" aria-hidden="true" style="color: rgb(119, 198, 231);"></i> 정사원</li>
            				<li><i class="fa fa-user" aria-hidden="true" style="color: rgb(119, 198, 231);"></i> 최인턴</li>
            			</ul>
            		</li>
            	</ul>
            	
            </div>
        </div>