<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/mypage.css'/>"/> 
<script src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/resources/jquery/jquery.easing.1.3.js"/>"></script>
<script type="text/javascript">
	$(function () {
		$('form[name=seFrm]').submit(function(){
			var re = /^[0-9]+$/;
	        if(!re.test($('#empNo').val())) {			
	               alert("사원번호는 숫자만 넣으셔야 합니다.");
	               $('#empNo').val().focus();
	               return false;		     
			}else if($('#empNo').val()==''){
				alert('사번을 입력하세요');
				$('#empNo').focus();
				return false;
			}else if($('#empName').val()==''){
				alert('이름를 입력하세요');
				$('#empName').focus();
				return false;
			}
		});
		
		$('#seFrm').submit(function() {

		});
		
		$('#ceBt').click(function() {
			if(!confirm("취소하시겠습니까?")){
				return false;
			}else{
				self.close();
			}
		});
	});
</script>
</head>
<body>
<div id="dimyPage">
	<form id="seFrm" name="seFrm" method="post" action="<c:url value="/login/searchPwd.do" />">
		<div>
			<label>사원번호</label>
			<input type="text" id="empNo" name="empNo">
		</div>
		<div>
			<label>이름</label>
			<input type="text" id="empName" name="empName">		
		</div>
		<div id="btPus">
			<input type="button" id="ceBt" value="취소">
			<input type="submit" id="seBt" value="확인">
		</div>
	</form>
</div>
</body>
</html>