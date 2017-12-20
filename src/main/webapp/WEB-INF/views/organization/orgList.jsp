<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype HTML>
<html>
<head>
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
			
			$('#divEmpInfo').hide();
			$('#organBody ul li ul li').each(function(){
				$(this).click(function(){
					$('#divEmpInfo').show();
				});
			});
			
			$('#orgSearchIcon').click(function(){
				var searchKey = $('#orgSearch').val();
				$('#organbody li').each(function(index, item){
					var sentence = $(this).text();
					var cnt = sentence.indexOf(searchKey);
					if(cnt>=0){
						$('#organbody ul ul li').hide();
						$(this).show();
					}
				})
			});
		}); 
	</script>
	<style>
		#organ {
			transition:all 500ms cubic-bezier(0.34, -0.13, 0.6, 1.18);
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
		#divEmpInfo{
			display: none;
		}
	</style>
</head>
<body>
	<div id="organtitle">
         <i class="fa fa-sitemap"></i>
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
	     			<c:forEach var="empVo" items="${empList }">
	     				<c:if test="${empVo.deptNo == deptVo.deptNo }">
	     					<li id="${empVo.empNo }"><i class="fa fa-user"></i>  ${empVo.empName } ${empVo.empPosition }(${empVo.empNo }) </a></li>
	     				</c:if>
	     			</c:forEach>
	     			</ul>
	     		</li>
	     	</ul>
     	</c:forEach>     	
     </div>
     
    <!--  조직도에서 사원클릭시 개인정보 보여줌  -->
    <!-- 
     <div id="divEmpInfo">
     	<div id="divClose"><i class="fa fa-times"></i></div>
     	<div id="divEmpImg">
     		<img alt="사원이름" src="사원이미지">
     	</div>
     	<div id="divEmp">
	     	<div>사원이름(사원번호) 사원직급</div>
	     	<div>사원 전화번호</div>
	     	<div><i class="fa fa-envelope-o"></i>사원 이메일</div>
	     	<div><i class="fa fa-paper-plane"></i>쪽지 아이콘, <i class="fa fa-comments-o"></i>메신저 아이콘</div>
     	</div>
     </div>
      -->
     <!-- 조직도 : 사원정보 끝 -->
     
</body>
</html>
     