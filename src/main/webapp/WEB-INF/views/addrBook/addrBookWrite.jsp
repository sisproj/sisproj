<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="addrBookTop.jsp"%>
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function(){
		$('frm [name=frmWrite]').submit(function(){
			if($('#addrName').val()==''){
				alert("이름을 입력하세요");
				$('#addrName').focus();
			}
			if($('#hp2').val()=='' || $('#hp3').val()==''){
				alert("핸드폰 번호를  입력하세요");
			}else{
				var hp=$('#hp1').val()+"-"+$('#hp2').val()+"-"$('#hp3').val();
				$('#addrTel').val(hp);
			}
			
			if($('#email2').val()=='etc'){
				$('#email3').show();
				$('#email3').focus();
				var email=$('#email1').val()+"@"+$('#email3').val();
				$('#addrEmail').val(email);
			}else{
				$('#email3').hide();			
				var email=$('#email1').val()+"@"+$('#email2').val();
				$('#addrEmail').val(email);
			}
		});
	});
</script>

    <!-- 3. 내용 -->
    <article id="bodysection">
        <div id="divBodysection">
	        <div class="divAddrHeader">
		        <h3>연락처 추가</h3>
		    </div>
	        <div class="divAddrBody">
	        	<form action="<c:url value='/addrBook/addrBookWrite.do'/>" method="post" name="frmWrite">
	        	<input type="text" name="addrTel" id="addrTel">
	        	<input type="text" name="addrEmail" id="addrEmail">
				<div>
					<label for="addrName">이름</label> 
					<input type="text" name="addrName"	id="addrName" style="ime-mode: active">
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
			    	<label for="addrComp">회사</label>
			    	<input type="text" name="addrComp" id="addrComp" title="회사명">
			    </div>
			    <div>
			    	<label for="addrGroupNo">그룹</label>
				    <select name="addrGroupNo" id="addrGroupNo">
				    	<option value="1">선택하세요</option>
				    	<option value="2">가족</option>
				    	<option value="3">친구</option>
				    	<option value="4">거래처</option>
				    	<option value="5">동아리</option>
				    </select>
			    </div>
			    <div class="center">
			         <input type="submit" id="wr_submit" value="등록">
			    </div>
			    </form>
			</div>
	        <div class="divPaging">
	        	<!-- <p>이곳에 페이징 처리를 합시다</p> -->
	        </div>
        </div>
    </article>
    <!-- 3. 내용 끝 -->

    <%@include file="addrBookBottom.jsp" %>
