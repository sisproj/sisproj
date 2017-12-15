<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype HTML>
<html>
<head>
   <script src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
	<script type="text/javascript">
		$(function() {
			$('#orgDown').hide();
			$('#organbody').hide();
			$('#organbody ul ul li').hide();
			$('.deptMinus').hide();
			
		    $('#orgUp').click(function() {
				$('#organ').css('height', '500px');
				$('#orgUp').hide();
				$('#orgDown').show();
				$('#organbody').show();
			});
			
			$('#orgDown').click(function() {
				$('#organ').css('height', '40px');
				$('#orgDown').hide();
				$('#orgUp').show();
				$('#organbody').hide();
			});

			$('.deptPlus').each(function(){
				$(this).click(function(){
						$(this).parent().children().children().show();
						$(this).parent().find('.deptMinus').show();
						$(this).hide();
				});
			});
			 
			$('.deptMinus').each(function(){
				$(this).click(function(){
					$(this).parent().find('.deptPlus').show();
					$(this).parent().children().children().hide();
					$(this).hide();
				});
			});

		}); 
	</script>
	<style>
		#organ {
			
		}		
		#organtitle {
			line-height: 40px;
		}		
		#organtitle>i {
			margin-left: 3px;
		}		
		#orgSearch {
			width: 200px;
			color: #fff;
			background-color: #333;
			border: 0;
			height: 25px;
			box-sizing: border-box;
			padding-left: 10px;
			float: left;
		}		
		#organbody ul li {
			padding-left: 10px;
		}		
		#organbody ul ul li {
			padding-left: 20px;
		}
		#organbody {
			background: white;
			height: 445px;
			margin: 0 5px;
			padding: 5px;
			overflow:auto;
		}		
		#organbody ul li ul li i {
			color: rgb(119, 198, 231);
		}		
		.orgSearch {
			display: inline-block;
			height: 30px;
			padding: 1px;
		}		
		#orgSearchIcon {
			display: inline-block;
			background-color: #333;
			color: rgb(82, 82, 82);
			width: 40px;
			height: 25px;
			text-align: center;
			vertical-align: middle;
			margin-top: 0px;
		}		
		#orgSearchIcon i {
			display: inline-block;
			line-height: 25px;
		}
	</style>
</head>
<body>
	<div id="organtitle">
         <i class="fa fa-sitemap" aria-hidden="true"></i>
         <div class="orgSearch">
          <input type="text" id="orgSearch" name="orgSearch" placeholder="부서/이름/아이디/직급/직책">
          <a href="#" id="orgSearchIcon"><i class="fa fa-search"></i></a>
         </div>
         <i id="orgUp" class="fa fa-chevron-up" aria-hidden="true"></i>
         <i id="orgDown" class="fa fa-chevron-down" aria-hidden="true"></i>
	</div>
     <div id="organbody">
     	<c:forEach var="deptVo" items="${deptList}">
	     	<ul >
	     		<li class="deptName"><i id="deptPlus-${deptVo.deptNo }" class="fa fa-plus-square deptPlus"></i>
	     				<i id="deptMinus-${deptVo.deptNo }" class="fa fa-minus-square deptMinus"></i>
	     		 ${deptVo.deptName }
	     			<ul>
	     				<li><i class="fa fa-user"></i> 김팀장</li>
	     				<li><i class="fa fa-user"></i> 이과장</li>
	     				<li><i class="fa fa-user"></i> 박대리</li>
	     				<li><i class="fa fa-user"></i> 정사원</li>
	     				<li><i class="fa fa-user"></i> 최인턴</li>
	     			</ul>
	     		</li>
	     	</ul>
     	</c:forEach>
     	
     </div>
</body>
</html>
     