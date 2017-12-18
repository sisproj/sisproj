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
      	<form id="frmEmp" name="frmEMP" action="<c:url value='/employee/employeeEdit.do'/>">
      	  <fieldset>
  		    <div id="diId">
      	 		<label for="name">사원번호</label>
      	 		<input type="text" id="empNo" name="empNo">   
       		</div>
       		<div id="diPwd">
      	 		<label for="name">비밀번호</label>
      	 		<input type="password" id="empPwd" name="empPwd">   
       		</div>
       		<div id="diName">
      	 		<label for="name">이름</label>
      	 		<input type="text" id=" empName" name=" empName">   
       		</div>
	       	   <input type="image" src="" alt="이미지 등록" id="empImg">       		    
       		<div id="diEnName">
       		<label for="enName">영어이름</label> <input type="text" id="empEName" name="empEName">
       		</div>
       		<div id="diDe">
				<label for="dept">부서</label>
				<select id="deptName" name="deptName">
					<option value="재무">재무</option>
					<option value="영업">영업</option>
					<option value="인사">인사</option>
					<option value="총무">총무</option>
					<option value="기획">기획</option>
					<option value="홍보">홍보</option>
					<option value="법무">법무</option>
				</select>
				<!-- <input type="text" id="dept" name="dept"> -->
			</div>
			<div id="diPos">
				<label for="empPosition">직급</label>  
				<select id="empPosition" name="empPosition">
					<option value="인턴">인턴</option>
					<option value="대리">대리</option>
					<option value="차장">차장</option>
					<option value="과장">과장</option>
					<option value="부장">부장</option>
					<option value="부사장">부사장</option>
					<option value="사장">사장</option>
				</select>  
				<!-- <input type="text" id="position" name="positiion"> -->
			</div>
       		<div id="diJumin">
		        <label for="jumin">주민번호</label>	
				<input type="text" name="jumin1" id="jumin1" maxlength="6"> -
				<input type="text" name="jumin2" id="jumin2" maxlength="7">
			</div>
			<div id="diHobby">
				<label for="hobby">취미</label>   	
				<input type="text" name="empHobby" id="empHobby">
			</div>
	        <div id="diZipcode">
		        <label for="zipcode">우편번호</label>
		        <input type="text" name="empZipcode" id="empZipcode" ReadOnly title="우편번호">
		        <input type="button" value="우편번호 찾기" id="btnZipcode" title="새창열림">
				<label for="address" id="address">주소</label>
				<input type="text" name="empAddr" id="empAddr" >	
				<label for="addressDetail" id="addressDetail" >상세주소</label>
				<input type="text" name="empAddr2" id="empAddr2">
			</div>
			<div id="diSchool">
				<label for="school">출신 학교</label>   	
				<input type="text" name="empSchool" id="empSchool">
			</div>
			<div id="diMajor">
				<label for="major">전공</label>   	
				<input type="text" name="empMajor" id="empMajor">
			</div>
			<div id="diSal">
				<label for="sal">월급</label>   	
				<input type="text" name="empSal" id="empSal">   
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
		       		- <input type="text" id="tel2" name="tel2">
		       		- <input type="text" id="tel2" name="tel3"><br>   
       		</div>
       		<div id="diEmail">		
	       		<label for="email1">이메일 주소</label>
	       	 	<input type="text" name="email1"  id="email1" title="이메일주소 앞자리">@
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
		        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" ><br>
       		</div>
       		   <label for="upfile" style="margin-top: 5px;">사원사진 업로드</label>
           	   <input type="file" id="upfile" name="upfile" style="margin-top: 5px;"/>	 
       		<div id="diReg">
				<input type="submit" id="btWrite" value="수정">
				<input type="button" id="btCen" value="취소">
				<input type="button" id="btList" value="목록">
			</div>
		  </fieldset>	
	   </form> 
    </div>
</article>
<%@include file="employeeBottom.jsp" %>