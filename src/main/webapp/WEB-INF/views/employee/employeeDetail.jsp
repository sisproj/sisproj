<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="employeeTop.jsp" %>
     <!-- 0. include부분 -->
<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
<script type="text/javascript">
	$(function () {			
		$('#dimypage input[type=text]').attr("disabled",true);
	
			$('#btCen').click(function () {
				location.href="<c:url value='/employee/employeeList.do'/>";
			});	
			
			$('#btEdit').click(function () {
				location.href="<c:url value='/employee/employeeEdit.do?empNo="+${vo.empNo}+"'/>";
			}); 
			
			$('#dimypage input[type=text]').attr("disabled",true);
	});
</script>
<article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;상세 정보&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
</article>
<article id="bodysection">
        <!-- 3. 내용 -->
    <div id="dimyPage">
    	<div id="diInput">
   		<form id="frmEmp" name="frmEMP" method="post">
	      	  <fieldset>
	      	    <div id="diId">
	      	 		<label for="name">사원번호</label><input type="text" id="empNo" name="empNo" value="${vo.empNo }">   
	       		</div>
	       		<div id="diName">
	      	 		<label for="name">이름</label><input type="text" id="empName" name="empName" maxlength="6" value="${vo.empName }">  
	      	 	</div>
	       		<div id="diEnName">
	       			<label for="enName">영어이름</label> <input type="text" id="empEName" name="empEName" value="${vo.empEName }">
	       		</div>		
					 <div id="diDe">
						<label for="dept">부서</label>
						<input type="text" id="deptName" name="deptName" value="${vo.deptName }">
					</div> 
				<div id="diPos">
					<label for="position">직급</label>  
					<input type="text" id="posName" name="posName" value="${vo.posName }">
				</div>
				<div id="diHobby">
					<label for="hobby">취미</label>  	
					<input type="text" name="empHobby" id="empHobby" value="${vo.empHobby }">
				</div>
		        <div>
			        <label for="zipcode" id="zipcodel">우편번호</label>
			        <input type="text" name="empZipcode" id="empZipcode" ReadOnly title="우편번호" style="width: 130px;" value="${vo.empZipcode }">
				</div>
				<div>
					<label for="address" id="address">주소</label>
					<input type="text" name="empAddr" id="empAddr" value="${vo.empAddr }">
				</div>
				<div>	
					<label for="addressDetail" id="addressDetail">상세주소</label>
					<input type="text" name="empAddr2" id="empAddr2" value="${vo.empAddr2 }">
				</div>
				<div id="diSchool">
					<label for="school">출신 학교</label>   	
					<input type="text" name="empSchool" id="empSchool" value="${vo.empSchool }">
				</div>
				<div id="diMajor">
					<label for="major">전공</label>   	
					<input type="text" name="empMajor" id="empMajor" value="${vo.empMajor }">
				</div>
				<div id="diSal">
					<label for="sal">월급</label>   	
					<input type="text" name="empSal" 
					id="empSal" value="<fmt:formatNumber value='${vo.empSal }' pattern='#,###' /> 원 ">			 				 
				</div>
				<div>
					<label for="empHiredate">입사일</label>   	
					<input type="text" name="empHiredate"
					 id="empHiredate" value="<fmt:formatDate value="${vo.empHiredate }" 
						pattern="yyyy-MM-dd"/>" > 			 				 
				</div>
				<div id="diTel">
				<label for="hp1">휴대폰</label>
	      			<input type="text" id="empTel" name="empTel" value="${vo.empTel }"> 
	    		</div>
				<div id="diEmail">   
			        <label for="email1">이메일 주소</label>
			        <input type="text" name="empEmail" id="empEmail"value="${vo.empEmail }">		        
	           	</div>
		  </fieldset>	
		        <div id="diReg">
	           		<input type="button" id="btEdit" value="수정">
			   </div>
	   </form> 
	   </div>
	   <div id="diImg1">
	        <div id="diImg2">
	       			<c:if test="${!empty vo.empImg }">
		       	   		<img src="${pageContext.request.contextPath}/emp_images/${vo.empImg }"
		       	   		 alt="${vo.empName }(${vo.empNo })" />       		    
					</c:if>
					<c:if test="${empty vo.empImg }">
						<i class="fa fa-user"></i>
					</c:if>
			</div>
		</div>	
    </div>
</article>
<%@include file="employeeBottom.jsp" %>