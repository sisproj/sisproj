<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/mypage.css'/>"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function () {
		$('#seFrm').submit(function () {
			window.open("<c:url value='/login/viewPwd.do?' />",'chkPwd',
			'left=0,top=0,width=400,height=250,locations=yes,resizable=yes');
	});
</script>
</head>
<body>
<div id="dimyPage">
	<form id="seFrm" name="seFrm" method="post" action="<c:url value='/login/searchPwd.do' />">
		<div>
			<label>사원번호</label>
			<input type="text" id="empNo" name="empNo">
		</div>
		<div>
			<label>이름</label>
			<input type="text" id="empName" name="empName">		
		</div>
		<div>
			<input type="submit" id="seBt" value="확인">
			<input type="button" id="ceBt" value="취소">
		</div>
	</form>
</div>
</body>
</html>