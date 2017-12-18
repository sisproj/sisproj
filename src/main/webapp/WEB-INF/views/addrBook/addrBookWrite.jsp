<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="addrBookTop.jsp"%>
<!-- 0. include부분 -->
<script type="text/javascript">

</script>

    <!-- 3. 내용 -->
    <article id="bodysection">
        <div id="divBodysection">
	        <div class="divAddrHeader">
		        <h3>연락처 추가</h3>
		    </div>
	        <div class="divAddrBody">
				<div>
					<label for="name">이름</label> 
					<input type="text" name="name"	id="name" style="ime-mode: active">
				</div>
				<div>
			        <label for="hp1">핸드폰</label>
			        <select name="hp1" id="hp1" title="휴대폰 앞자리">
			            <option value="010">010</option>
			            <option value="011">011</option>
			            <option value="016">016</option>
			            <option value="017">017</option>
			            <option value="018">018</option>
			            <option value="019">019</option>
			       	</select>
			        -
			        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"	class="width_80"> -
			        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리" 	class="width_80">
			    </div>
			    <div>
			        <label for="email1">이메일 주소</label>
			        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리"> @
			        <select name="email2" id="email2"  title="이메일주소 뒷자리">
			            <option value="naver.com">naver.com</option>
			            <option value="hanmail.net">hanmail.net</option>
			            <option value="nate.com">nate.com</option>
			            <option value="gmail.com">gmail.com</option>
			            <option value="etc">직접입력</option>
			        </select>
			        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" style="visibility:hidden">
			    </div>
			    <div>
			    	<label for="company">회사</label>
			    	<input type="text" name="company" id="company" title="회사명">
			    </div>
			    <div>
			    	<label for="company">그룹</label>
				    <select name="groupName" id="groupName">
				    	<option value="가족">가족</option>
				    	<option value="친구">친구</option>
				    	<option value="거래처">거래처</option>
				    	<option value="동아리">동아리</option>
				    </select>
			    </div>
			    <div class="center">
			         <input type="submit" id="wr_submit" value="등록">
			    </div>
			</div>
	        <div class="divPaging">
	        	<p>이곳에 페이징 처리를 합시다</p>
	        </div>
        </div>
    </article>
    <!-- 3. 내용 끝 -->

    <%@include file="addrBookBottom.jsp" %>
