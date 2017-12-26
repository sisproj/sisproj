<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="employeeTop.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value='/resources/js/zipcode.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#btC').click(function() {		
			if(!confirm("취소하시겠습니까?")){
				return false;
			}else{
				location.href="<c:url value='/employee/employeeList.do' />"
			}			
		});
		$('#btL').click(function() {
			location.href="<c:url value='/employee/employeeList.do' />"
		});
		$('#email2').change(function(){
			if($('#email2').val()=='etc'){
				$('#email3').css('visibility','visible');
				$('#email3').focus();
				$('#email3').val('');
			}else if($('#email2').val()!='etc'){
				$('#email3').css('visibility','hidden');
			}
		});
		$('#empHiredate1').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		$('frmEmp').submit(function () {
			var email1 = $('#email1').val();
			var email2 = $('#email2 option:selected').val();
			var email3 = $('#email3').val();
			var email="";
			
			if($('#email2').val()=="etc"){
				if($('#email1').val()!="" && $('#email3').val()!=""){
					email=email1+"@"+email3;
				}
			}else if($('#email1').val()!="" && $('#email2').val()!=""){
				email=email1+"@"+email2;
			}
			$('#empEmail').val(email);
			
			var tel1=$('#tel1 option:selected').val();
			var tel2=$('#tel2').val();
			var tel3=$('#tel3').val();
			var tel="";
			
			if($('#tel2').val()!="" && $('#tel3').val()!=""){
				tel=tel1+"-"+tel2+"-"+tel3;
				$('#empTel').val(tel);
			}			
			var jumin1=$('#jumin1').val();
			var jumin2=$('#jumin2').val();
			var ssn="";
			if($('#jumin1').val()!="" && $('#jumin2').val()!="") {
				 ssn=jumin1+"-"+jumin2;
				$('#empSsn').val(ssn);
			}
			
			if($('#empName').val()==""){
				alert('이름을 입력하세요');
				$('#empName').focus();
				return false;
			}else if($('#empEName').val()==""){
				alert('영어이름를 입력하세요');
				$('#empEName').focus();
				return false;
			}else if($('#jumin1').val()=="" || $('#jumin2').val()==""){
				alert('주민번호를 입력하세요.');
				$('#empSsn').focus();
				return false;
			}else if($('#empHobby').val()==""){
				alert('취미를 입력하세요.');
				$("#empHobby").focus();
				return false;
			}else if($('#empEmail').val()==""){
				alert('이메일을 입력하세요.');
				$("#empEmail").focus();
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
			}else if($('#empSchool').val()==""){
				alert('출신학교를 입력하세요.');
				$("#empSchool").focus();
				return false;
			}else if($('#empMajor').val()==""){
				alert('전공을 입력하세요.');
				$("#empMajor").focus();
				return false;
			}else if($('#empSal').val()==""){
				alert('월급을 입력하세요.');
				$("#empSal").focus();
				return false;
			}else if($('#tel2').val()=="" || $('#tel3').val()==""){
				alert('전화번호를 입력하세요.');
				$("#tel2").focus();
				return false;			
			}else if($('#empHiredate1').val()==""){
				alert('입사일을 입력하세요.');
				$("#empHiredate1").focus();
				return false;
			}else if($('#empEmail').val()==""){
				alert('이메일을 입력하세요.');
				$("#empEmail").focus();
				return false;
			}else if($('#empImg').val()==""){
				alert('이미지를 등록하세요.');
				$("#empImg").focus();
				return false;
			}else{
				alert('등록 실패!');
			}
		});
	});
</script>
<article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;사원정보 수정&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
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
      	<input type="text" name="empTel" id="empTel" value="${vo.empTel }">
      	<input type="text" name="empSsn" id="empSsn" value="${vo.empSsn }">
      	<input type="text" name="empEmail" id="empEmail" value="${vo.empEmail }">
      	<input type="text" name="oldFileName" id="oldFileName" value="${vo.empImg}">
      	  <fieldset>
  		    <div id="diId">
      	 		<label for="name">사원번호</label>
      	 		<input type="text" id="empNo" name="empNo" value="${vo.empNo }">   
       		</div>
       		<div id="diPwd">
      	 		<label for="name">비밀번호</label>
      	 		<input type="password" id="empPwd" name="empPwd" value="${vo.empPwd }">   
       		</div>
       		<div id="diName">
      	 		<label for="name">이름</label>
      	 		<input type="text" id=" empName" name=" empName" value="${vo.empName }">   
       		</div>
	       	  <!--  <input type="image" src="" alt="이미지 등록" id="empImg">       		     -->
       		<div id="diEnName">
       		<label for="enName">영어이름</label> 
       		<input type="text" id="empEName" name="empEName" value="${vo.empEName }"> 
       		</div>
       		<div id="diDe">
       		<c:set var="deVo" value="${list }" />
     			<label for="deptNo">부서</label>
					<select id="deptNo" name="deptNo">
					<option value="101" 
					<c:if test="${vo.deptName=='기획' }">
					selected</c:if>
					>기획</option>
					<option value="201" 
					<c:if test="${vo.deptName=='인사' }">
					selected</c:if>
					>인사</option>
					<option value="301" 
					<c:if test="${vo.deptName=='재무' }">
					selected</c:if>
					>재무</option>			
					<option value="401" 
					<c:if test="${vo.deptName=='홍보' }">
					selected</c:if>
					>홍보</option>
					<option value="501" 
					<c:if test="${vo.deptName=='전산' }">
					selected</c:if>
					>전산</option>
					<option value="601" 
					<c:if test="${vo.deptName=='영업' }">
					selected</c:if>
					>영업</option>
					<option value="701" 
					<c:if test="${vo.deptName=='법무' }">
					selected</c:if>
					>법무</option>
					</select>					
			</div>
			<div id="diPos">
				<label for="posNo">직급</label>  
				<select id="posNo" name="posNo">
				<option value="8" 
				<c:if test="${vo.posName=='인턴' }">
				selected</c:if>
				>인턴</option>
				<option value="7" 
				<c:if test="${vo.posName=='사원' }">
				selected</c:if>
				>인턴</option>
				<option value="6" 
				<c:if test="${vo.posName=='대리' }">
				selected</c:if>
				>대리</option>			
				<option value="5" 
				<c:if test="${vo.posName=='과장' }">
				selected</c:if>
				>과장</option>
				<option value="4" 
				<c:if test="${vo.posName=='부장' }">
				selected</c:if>
				>부장</option>
				<option value="3" 
				<c:if test="${vo.posName=='전무' }">
				selected</c:if>
				>차장</option>
				<option value="2" 
				<c:if test="${vo.posName=='이사' }">
				selected</c:if>
				>부사장</option>
				<option value="1" 
				<c:if test="${vo.posName=='사장' }">
				selected</c:if>
				>사장</option>
				</select>  
			</div>
       		<div id="diJumin">
       		<c:set var="jumin" value="${fn:split(vo.empSsn,'-')}" ></c:set>
		        <label for="jumin">주민번호</label>	
				<input type="text" name="jumin1" id="jumin1" maxlength="6" value="${jumin[0] }"> -
				<input type="text" name="jumin2" id="jumin2" maxlength="7" value="${jumin[1] }">
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
				<input type="text" name="empSchool" id="empSchool" value="${vo.empSchool }">
			</div>
			<div id="diMajor">
				<label for="major">전공</label>   	
				<input type="text" name="empMajor" id="empMajor" value="${vo.empMajor }">
			</div>
			<div id="diSal">
				<label for="sal">월급</label>   	
				<input type="text" name="empSal" id="empSal" 
				value='${vo.empSal }'>   
			</div>
			
			<c:set var="tel" value="${fn:split(vo.empTel, '-') }"/>
			<div id="diTel">
			<label for="hp1">휴대폰</label>
      		  <select name="hp1" id="hp1" title="휴대폰 앞자리">
		            <option value="010" 
		            	<c:if test="${tel[0]=='010'}">
		            		selected
		            	</c:if>
		            >010</option>
		            <option value="011"
		            	<c:if test="${tel[0]=='011'}">
		            		selected
		            	</c:if>
		            >011</option>
		            <option value="016"
		            	<c:if test="${tel[0]=='016'}">
		            		selected
		            	</c:if>
		            >016</option>
		            <option value="017"
		            	<c:if test="${tel[0]=='017'}">
		            		selected
		            	</c:if>
		            >017</option>
		            <option value="018"
		            	<c:if test="${tel[0]=='018'}">
		            		selected
		            	</c:if>
		            >018</option>
		            <option value="019"
		            	<c:if test="${tel[0]=='019'}">
		            		selected
		            	</c:if>
		            >019</option>
	       	</select>
	        -
	        <input type="text" name="tel2" id="tel2" maxlength="4" title="휴대폰 가운데자리"
	        	class="width_80" value="${tel[1]}">-
	        <input type="text" name="tel3" id="tel3" maxlength="4" title="휴대폰 뒷자리"
	        	class="width_80" value="${tel[2] }" style="width: 90px;">
	   		</div>
	   		<div id="diDate">
       			<label for="empHiredate">입사일</label>
       			<input type="text" id="empHiredate1" name="empHiredate1"
       			 placeholder="누르시면 달력이나옵니다." 
       			 value='<fmt:formatDate value="${vo.empHiredate }" pattern="yyyy-MM-dd" />'>
       		</div>
			<div id="diEmail">   
			<c:set var="email" value="${fn:split(vo.empEmail,'@') }" />
		        <label for="email1">이메일 주소</label>
		        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리" value="${email[0] }">@
			        <select name="email2" id="email2"  title="이메일주소 뒷자리">
			        	<option value="naver.com"
			            	<c:if test="${email[1]=='naver.com'}">
			            		selected
			            	</c:if>
			            >naver.com</option>
			            <option value="hanmail.net"
			            	<c:if test="${email[1]=='hanmail.net'}">
			            		selected
			            	</c:if>
			            >hanmail.net</option>
			            <option value="nate.com"
			            	<c:if test="${email[1]=='nate.com'}">
			            		selected
			            	</c:if>
			            >nate.com</option>
			            <option value="gmail.com"
			            	<c:if test="${email[1]=='gmail.com'}">
			            		selected
			            	</c:if>
			            >gmail.com</option> 
			            <option value="hotmail.com"
			            	<c:if test="${email[1]=='hotmail.com'}">
			            		selected
			            	</c:if>
			            >hotmail.com</option> 
			            <option value="yahoo.com"
			            	<c:if test="${email[1]=='yahoo.com'}">
			            		selected
			            	</c:if>
			            >yahoo.com</option> 			            
			            <c:set var="isEtc" value="false"/>
			            <c:choose>
			            	<c:when test="${email[1]!='naver.com' 
			            		&& email[1]!='hanmail.net' && email[1]!='nate.com'
			            		&& email[1]!='gmail.com' && email[1]!='hotmail.com' 
			            		&& email[1]!='yahoo.com' && !empty email[1]}">
					            <c:set var="isEtc" value="true"/>            		
			            	</c:when>
			            	<c:otherwise>
					            <c:set var="isEtc" value="false"/>            		
			            	</c:otherwise>
			            </c:choose>
			            <option value="etc"
			            	<c:if test='${isEtc==true}'>
			            		selected
			            	</c:if>
			            >직접입력</option>
			        </select>
		        <input type="text" name="email3" id="email3" 
		        	title="직접입력인 경우 이메일주소 뒷자리"
		        	<c:if test='${isEtc}'>
		        		value="${email[1]}";
		            	style="visibility:visible";
		            </c:if>
		            <c:if test='${!isEtc}'>         
		        		style="visibility:hidden";
		        	</c:if>	>
	        	</div>
	        	<div id="diFImg">
	       		   <label for="upfile" style="margin-top: 5px;">사원사진</label>
	           	   <input type="file" id="fileup" name="fileup" style="margin-top: 5px;"/>	 
           		</div>
	        	<div style="text-align: center;">
	        		<input type="submit" id="btS" name="btS" value="수정">
	        		<input type="button" id="btC" name="btC" value="취소">
	        		<input type="button" id="btL" name="btL" value="목록">	        			        		 
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