<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="employeeTop.jsp" %>
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
      	<form id="frmEmp" name="frmEMP" 
      	action="<c:url value='/employee/employeeEdit.do'/>" method="post" enctype="multipart/form-data">
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
     			<label for="deptName">부서</label>
				<c:forEach var="deVo" items="${list }">
					<select>
						<option value="${deVo.deptNo }">
					${deVo.deptName }</option>
					</select>				
				</c:forEach>
			</div>
			<div id="diPos">
				<label for="empPosition">직급</label>  
				<select id="empPosition" name="empPosition">
				<option value="인턴" 
				<c:if test="${vo.empPosition=='인턴' }">
				selected</c:if>
				>인턴</option>
				<option value="대리" 
				<c:if test="${vo.empPosition=='대리' }">
				selected</c:if>
				>대리</option>
				<option value="차장" 
				<c:if test="${vo.empPosition=='차장' }">
				selected</c:if>
				>차장</option>
				<option value="과장" 
				<c:if test="${vo.empPosition=='과장' }">
				selected</c:if>
				>과장</option>
				<option value="부장" 
				<c:if test="${vo.empPosition=='부장' }">
				selected</c:if>
				>부장</option>
				<option value="부사장" 
				<c:if test="${vo.empPosition=='부사장' }">
				selected</c:if>
				>부사장</option>
				<option value="사장" 
				<c:if test="${vo.empPosition=='사장' }">
				selected</c:if>
				>사장</option>
				</select>  
			</div>
       		<div id="diJumin">
		        <label for="jumin">주민번호</label>	
				<input type="text" name="jumin1" id="jumin1" maxlength="6"> -
				<input type="text" name="jumin2" id="jumin2" maxlength="7">
			</div>
			<div id="diHobby">
				<label for="hobby">취미</label>   	
				<input type="text" name="empHobby" id="empHobby" value="${vo.empHobby }">
			</div>
	        <div id="diZipcode">
		        <label for="zipcode">우편번호</label>
		        <input type="text" name="empZipcode" id="empZipcode" ReadOnly title="우편번호" value="${vo.empZipcode }">
		        <input type="button" value="우편번호 찾기" id="btnZipcode" title="새창열림">
				<label for="address" id="address">주소</label>
				<input type="text" name="empAddr" id="empAddr" value="${vo.empAddr }">	
				<label for="addressDetail" id="addressDetail" >상세주소</label>
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
				value='<fmt:formatNumber value="${vo.empSal }" pattern="#,###" /> 원'>   
			</div>
			<div id="diTel">
			<label for="hp1">휴대폰</label>&nbsp;
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
	        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
	        	class="width_80" value="${tel[1]}">-
	        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
	        	class="width_80" value="${tel[2] }">
	   		</div>
			<div id="diEmail">   
		        <label for="email1">이메일 주소</label>
		        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리" value="${vo.email1}">@
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
			            		&& email[1]!='gmail.com' && !empty email[1]}">
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
		        		value="email[1]"
		            	style="visibility:visible"	
		            </c:if>
		            <c:if test='${!isEtc}'>         
		        		style="visibility:hidden"
		        	</c:if>	>
	        	</div>
	        	<div>
	        		<input type="submit" id="btS" name="btS" value="수정">
	        		<input type="button" id="btC" name="btC" value="취소">
	        		<input type="button" id="btL" name="btL" value="목록">	        			        		 
	        	</div>
        	</fieldset>
        </form>
    </div>
</article>
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
		
		var email = ${(vo.empEmail).split("@")};
		
		var tel = ${(vo.empTel).split("-")};
	});
</script>
<%@include file="employeeBottom.jsp" %>