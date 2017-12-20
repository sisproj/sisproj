<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
<script type="text/javascript">
	$(function () {
	 	$('#empName').val();
		$('#deptName option:selected').val();
		$('#empPosition option:selected').val();
		
	});
</script>
</head>
<body>
<div id="dimyPage">
	<form id="frmDeSe" name="frmDeSe" method="get" 
	action="<c:url value='/employee/employeeDetailSearch.do?empName="+${empName }&empPosition=${empPosition }"'/>">
		<label for="empName">사원이름</label>
		<input type="text" id="empName" name="empName">			
		<label for="deptName">부서이름</label>
		<select id="deptName">
			<!-- value 부서 번호 입력 for문-->
				<option value="0">선택하세요</option>
			<c:forEach var="deptVo" items="${list }">
				<option value="${deptVo.deptName }">${deptVo.deptName }</option>
			</c:forEach>
		</select><br> 
		<label>직급</label>	
		<select id="empPosition">
					<option value="사원">사원<option>
					<option value="대리">대리</option>
					<option value="차장">차장</option>
					<option value="과장">과장</option>
					<option value="부장">부장</option>
					<option value="부사장">부사장</option>
					<option value="사장">사장</option>						
		</select>
		<div style="text-align: center;">
			<input type="button" id="btDeSe" name="btDeSe" value="검색">
			<input type="button" id="btDeCe" name="btDeCe" value="취소">
		</div>
	</form>
</div>
</body>
</html>