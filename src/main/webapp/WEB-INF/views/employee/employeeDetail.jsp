<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="employeeTop.jsp" %>
<script type="text/javascript">
	$(function () {
		$('#btCen').click(function () {
			location.href="<c:url value='/employee/employeeList.do'/>";
		});
	});
</script>
    <article id="bodysection">
        <!-- 3. 내용 -->
     <div id="dimyPage">
      		<form id="frmEmp" name="frmEMP" action="">
      	  <fieldset>
      	    <div id="diId">
      	 		<label for="name">사원번호</label><input type="text" id="empId" name="empId">   
       		</div>
       		<div id="diName">
      	 		<label for="name">이름</label><input type="text" id="name" name="name" maxlength="6">   
       		</div>
	       	   <input type="image" src="" alt="이미지 등록" id="empImg">       		    
       		<div id="diEnName">
       		<label for="enName">영어이름</label> <input type="text" id="enName" name="enName">
       		</div>
       		<!-- <div id="diJumin">
		        <label for="jumin">주민번호</label>	
				<input type="text" name="jumin1" id="jumin1" maxlength="6"> -
				<input type="text" name="jumin2" id="jumin2" maxlength="7">
			</div> -->
			<div id="diDe">
				<label for="dept">부서</label>
				<input type="text" id="dept" name="dept">
			</div>
			<div id="diPos">
				<label for="position">직급</label>  
				<input type="text" id="position" name="positiion">
			</div>
			<div id="diHobby">
				<label for="hobby">취미</label>   	
				<input type="text" name="hobby" id="hobby">
			</div>
	        <div id="diZipcode">
		        <label for="zipcode" id="zipcodel">우편번호</label>
		        <input type="text" name="zipcode" id="zipcode" ReadOnly title="우편번호" style="width: 250px;">
				<!--<input type="button" value="우편번호 찾기" id="btnZipcode" title="새창열림"> -->
				<label for="address" id="address">주소</label>
				<input type="text" name="address" id="address">	
				<label for="addressDetail" id="addressDetail">상세주소</label>
				<input type="text" name="addressDetail" id="addressDetail">
			</div>
			<div id="diSchool">
				<label for="school">출신 학교</label>   	
				<input type="text" name="school" id="school">
			</div>
			<div id="diMajor">
				<label for="major">전공</label>   	
				<input type="text" name="major" id="major">
			</div>
			<div id="diSal" style="">
				<label for="sal">월급</label>   	
				<input type="text" name="sal" id="sal"> 			 				 
			</div>
			<div id="diTel">
	       		<label for="hp1">핸드폰</label><select name="tel1" id="tel1" title="휴대폰 앞자리">
	       			<option value="010">010</option>
		            <option value="011">011</option>
		            <option value="016">016</option>
		            <option value="017">017</option>
		            <option value="018">018</option>
		            <option value="019">019</option>
	       		</select>
		       		- <input type="text" id="tel2" name="tel2" maxlength="4">
		       		- <input type="text" id="tel2" name="tel3" maxlength="4"><br>   
       		</div>
       		<div id="diEmail">		
	       		<label for="email1">이메일 주소</label>
	       	 	<input type="text" name="email1"  id="email1" title="이메일주소 앞자리"> @
	        	<select name="email2" id="email2"  title="이메일주소 뒷자리">
		            <option value="naver.com">naver.com</option>
		            <option value="hanmail.net">hanmail.net</option>
		            <option value="nate.com">nate.com</option>
		            <option value="gmail.com">gmail.com</option>
		            <option value="gmail.com">nate.com</option>
		            <option value="gmail.com">hotmail.com</option>
		            <option value="gmail.com">yahoo.com</option>
		            <option value="etc">직접입력</option>
	        	</select>
		        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"><br>
       		</div>
       		<div id="diFImg">
       		   <label for="upfile" style="margin-top: 5px;">사원사진 업로드</label>
           	   <input type="file" id="upfile" name="upfile" style="margin-top: 5px;"/>	 
           	</div>
       		<div id="diReg">
				<input type="submit" id="btWrite" value="수정">
				<input type="button" id="btCen" value="목록">
			</div>
		  </fieldset>	
	   </form> 
    </div>
</article>
<%@include file="employeeBottom.jsp" %>