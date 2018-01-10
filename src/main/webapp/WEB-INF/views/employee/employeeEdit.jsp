<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="employeeTop.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value='/resources/js/zipcode.js'/>"></script>
     <!-- 0. include부분 -->
        <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
<script type="text/javascript">
	$(function() {
		$('#btC').click(function() {		
			if(!confirm("취소하시겠습니까?")){
				return false;
			}else{
				location.href="<c:url value='/employee/employeeDetail.do?empNo=${sessionScope.empVo.empNo}' />"
			}	
		});
		$('frmEmp').submit(function () {
			var email1 = $('#email1').val();
			var email2 = $('#email2 option:selected').val();
			var email3 = $('#email3').val();
			var email="";
			
			if($('#empHobby').val()==""){
				alert('취미를 입력하세요.');
				$("#empHobby").focus();
				return false;
			}else if($('#empZipcode').val()==""){
				alert('우편번호를 입력하세요.');
				$("#empZipcode").focus();
				return false;
			}else if($('#empAddr').val()==""){
				alert('주소를 입력하세요.');
				$("#empAddr").focus();
				return false;
			}else if($('#empAddr2').val()==""){
				alert('상세주소를 입력하세요.');
				$("#empAddr2").focus();
				return false;
			}else if($('#emPwd').val()==""){
				alert('비밀번호를 입력하세요.');
				$("#empPwd").focus();
				return false			
			}else{
				alert('등록 실패!');
				return false;
			}
		});
	});
</script>
<article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;정보 수정&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                         aria-hidden="false"></i></a>
        </h1>
    </article>
<article id="bodysection">
        <!-- 3. 내용 -->
        <!-- 사원로그인시 부서/직급/월급/사원번호 수정 불가 if걸기 -->
    <div id="dimyPage">
    	<div id="diInput">
      	<form id="frmEmp" name="frmEnp"    	
  		action="<c:url value='/employee/employeeEdit.do?empNo=${vo.empNo }'/>" method="post" enctype="multipart/form-data">
      	<input type="hidden" name="empTel" id="empTel" value="${vo.empTel }">
      	<input type="hidden" name="empSsn" id="empSsn" value="${vo.empSsn }">
      	<input type="hidden" name="empEmail" id="empEmail" value="${vo.empEmail }">
      	<input type="hidden" name="oldFileName" id="oldFileName" value="${vo.empImg}">
      	  <fieldset>
  		    <div id="diId">
      	 		<label for="name">사원번호</label>
      	 		<input type="text" id="empNo" name="empNo" value="${vo.empNo }" readonly="readonly">   
       		</div>
       		<div id="diPwd">
      	 		<label for="name">비밀번호</label>
      	 		<input type="password" id="empPwd" name="empPwd" value="${vo.empPwd }">   
       		</div>
       		<div id="diName">
      	 		<label for="name">이름</label>
      	 		<input type="text" id=" empName" name=" empName" value="${vo.empName }" readonly="readonly">   
       		</div>
       		<div id="diEnName">
       		<label for="enName">영어이름</label> 
       		<input type="text" id="empEName" name="empEName" value="${vo.empEName }" readonly="readonly"> 
       		</div>
       		<div id="diDe">     
     			<label for="deptNo">부서</label>
				<input type="text" name="deptName" id="deptName" value="${vo.deptName }" readonly="readonly">				
			</div>
			<div id="diPos">
				<label for="posNo">직급</label>  
				<input type="text" name="posName" id="posName" value="${vo.posName }" readonly="readonly">	
			</div>
       		<div id="diJumin">
       		<c:set var="jumin" value="${fn:split(vo.empSsn,'-')}" ></c:set>
		        <label for="jumin">주민번호</label>	
				<input type="text" name="jumin1" id="jumin1" maxlength="6" value="${jumin[0] }" readonly="readonly"> -
				<input type="text" name="jumin2" id="jumin2" maxlength="7" value="${jumin[1] }" readonly="readonly">
			</div>
			<div id="diHobby">
				<label for="hobby">취미</label>   	
				<input type="text" name="empHobby" id="empHobby" value="${vo.empHobby }">
			</div>
		    <div>
		        <label for="zipcode" id="zipcodel">우편번호</label>
		        <input type="text" name="empZipcode" id="empZipcode" value="${vo.empZipcode }" style="width: 130px;">
		        <input type="button" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="daumPostcode()">
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
				<input type="text" name="empSchool" id="empSchool" value="${vo.empSchool }" readonly="readonly">
			</div>
			<div id="diMajor">
				<label for="major">전공</label>   	
				<input type="text" name="empMajor" id="empMajor" value="${vo.empMajor }" readonly="readonly">
			</div>
			<div id="diSal">
				<label for="sal">월급</label>   	
				<input type="text" name="empSal" id="empSal" value='${vo.empSal }' readonly="readonly">   
			</div>
			<div id="diTel">
				<label for="hp1">휴대폰</label>    		 
	     	   <input type="text" name="empTel" id="empTel" value="${vo.empTel }" readonly="readonly">
	   		</div>
	   		<div id="diDate">
       			<label for="empHiredate">입사일</label>
       			<input type="text" id="empHiredate1" name="empHiredate1"
       			 value='<fmt:formatDate value="${vo.empHiredate }" pattern="yyyy-MM-dd" />' readonly="readonly">
       		</div>
			<div id="diEmail">   
		        <label for="email1">이메일 주소</label>
		        <input type="text" name="email"  id="email" title="이메일주소 앞자리" value="${vo.empEmail }" readonly="readonly">			       
	        	</div>
	        	<div style="text-align: center;">
	        		<input type="submit" id="btS" name="btS" value="수정">
	        		<input type="button" id="btC" name="btC" value="취소">        			        		 
	        	</div>
        	</fieldset>
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