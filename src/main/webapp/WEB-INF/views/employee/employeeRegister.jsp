<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="employeeTop.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value='/resources/js/zipcode.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#btCen').click(function() {
			if(!confirm("취소하시겠습니까?")){
				return false;
			}else{
				location.href="<c:url value='/employee/employeeList.do' />";
			}
		});
		$('#empHiredate1').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		$('#email2').change(function(){
			if($('#email2').val()=='etc'){
				$('#email3').css('visibility','visible');
				$('#email3').focus();
				$('#email3').val('');
			}
		});
		$('#frmEmp').submit(function(){
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
			
			if($('#jumin1').val()!="" && $('#jumin2').val()!="") {
				var ssn=jumin1+"-"+jumin2;
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
			}
			 
			 /*else if($('#deptNo').val()==""){
			alert('부서를 선택하세요.');
			$("#deptNo").focus();
			return false;
			}else if($('#empPosition').val()==""){
			alert('직급을 선택하세요.');
			$("#empPosition").focus();
			return false;
			}
			} */
		});	 
	});
</script>
	<article id="headsection">
    <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
    <h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;사원 등록&nbsp;<a href="#"><i class="fa fa-bookmark bookmark"
                                                                                     aria-hidden="false"></i></a>
    </h1>
</article>
    <article id="bodysection">
        <!-- 3. 내용 -->
     <div id="dimyPage">
      	<form id="frmEmp" name="frmEMP" method="post" 
      	action="<c:url value='/employee/employeeRegister.do'/>" enctype="multipart/form-data">
        <input type="hidden" name="empTel" id="empTel">
      	<input type="hidden" name="empSsn" id="empSsn">
      	<input type="hidden" name="empEmail" id="empEmail">
      	  <fieldset>
       		<div id="diName">
      	 		<label for="name">이름</label><input type="text" id="empName" name="empName" maxlength="6">   
       		</div>
	       <!-- <input type="image" src="" alt="이미지 등록" id="empImg" name="empImg">     -->
       		<div id="diEnName">
       		<label for="enName">영어이름</label> <input type="text" id="empEName" name="empEName">
       		</div>
       		<div id="diJumin">
		        <label for="jumin">주민번호</label>	
				<input type="text" name="jumin1" id="jumin1" maxlength="6"> -
				<input type="text" name="jumin2" id="jumin2" maxlength="7">
			</div>
			<!-- 부서는 계속 추가하게 만들기 -->
			<div id="diDe">
				<label for="deptNo">부서</label>
				<select id="deptNo" name="deptNo">
					<option value="101">기획</option>
					<option value="201">인사</option>
					<option value="301">재무</option>
					<option value="401">홍보</option>
					<option value="501">전산</option>
					<option value="601">영업</option>
					<option value="701">법무</option>
				</select>
			</div>
			<!--직급은 계속 추가하게 만들기 -->
			<div id="diPos">
				<label for="posNo">직급</label>
				<select id="posNo" name="posNo">					
					<option value="8">인턴</option>
					<option value="7">사원</option>
					<option value="6">대리</option>
					<option value="5">과장</option>
					<option value="4">부장</option>
					<option value="3">이사</option>
					<option value="2">전무</option>
					<option value="1">사장</option>
				</select>  
			</div>
			<div id="diHobby">
				<label for="hobby">취미</label>   	
				<input type="text" name="empHobby" id="empHobby">
			</div>
	        <div>
		        <label for="zipcode" id="zipcodel">우편번호</label>
		        <input type="text" name="empZipcode" id="empZipcode" title="우편번호" style="width:130px;">
		        <input type="button" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="daumPostcode()">
		    </div>
		    <div>
				<label for="address" id="address">주소</label>
				<input type="text" name="empAddr" id="empAddr">
			</div>
			<div>	
				<label for="addressDetail" id="addressDetail">상세주소</label>
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
			<div id="diSal" style="">
				<label for="sal">월급</label>   	
				<input type="text" name="empSal" id="empSal"> 			 				 
			</div>
			<div id="diTel">
	       		<label for="hp1">핸드폰</label>
	       		<select name="tel1" id="tel1" title="휴대폰 앞자리">
	       			<option value="010">010</option>
		            <option value="011">011</option>
		            <option value="016">016</option>
		            <option value="017">017</option>
		            <option value="018">018</option>
		            <option value="019">019</option>
	       		</select>
		       		- <input type="text" id="tel2" name="tel2" maxlength="4">
		       		- <input type="text" id="tel3" name="tel3" maxlength="4" style="width: 85px"><br>   
       		</div>
       		<div id="diDate">
       			<label for="empHiredate">입사일</label>
       			<input type="text" id="empHiredate1" name="empHiredate1" placeholder="누르시면 달력이나옵니다.">
       		</div>
       		<div id="diEmail">		
	       		<label for="email1">이메일 주소</label>
	       	 	<input type="text" name="email1"  id="email1" title="이메일주소 앞자리"> @
	        	<select name="email2" id="email2"  title="이메일주소 뒷자리">
		            <option value="naver.com">naver.com</option>
		            <option value="hanmail.net">hanmail.net</option>
		            <option value="gmail.com">gmail.com</option>
		            <option value="nate.com">nate.com</option>
		            <option value="hotmail.com">hotmail.com</option>
		            <option value="yahoo.com">yahoo.com</option>
		            <option value="etc">직접입력</option>
	        	</select>
		        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden;"><br>
			</div>
       		<div id="diFImg">
       		   <label for="upfile" style="margin-top: 5px;">사원사진 업로드</label>
           	   <input type="file" id="fileupload" name="fileupload" style="margin-top: 5px;"/>	 
           	</div>
       		<div id="diReg">
				<input type="submit" id="btWrite" value="등록">
				<input type="button" id="btCen" value="취소">
			</div>
		  </fieldset>	
	   </form> 
    </div>
        <!-- 3. 내용 끝 -->
    </article>
<%@include file="employeeBottom.jsp" %>