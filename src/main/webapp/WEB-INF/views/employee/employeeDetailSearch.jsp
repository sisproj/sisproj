<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
</head>
<body>

<div id="dimyPage">
	<form id="frmDeSe" name="frmDeSe" method="get" 
	action="<c:url value='/employee/employeeDetailSearch.do?empName="+${empName }&empPosition=${empPosition }"'/>">
		<label for="empName">사원이름</label>
		<input type="text" id="empName" name="empName">			
		<label for="deptNo">부서이름</label>
	<%-- 	<select>
			<!-- value 부서 번호 입력 for문-->
			<c:forEach var="deptVo" items="${list }">
			<option value="${vo.deptName }">${vo.deptName }</option>
			</c:forEach>
			<option>인사팀</option>
			<option>재무</option>
			<option>홍보팀</option>
		</select><br> --%>
		<label>직급</label>	
		<select id="empPosition">
			<%-- <c:forEach var="vo" items="${list }">
			<option value="${vo.empPosition }">${vo.empPosition }</option>
			</c:forEach> --%>
				<option>대리</option>		
				<option>과장</option>		
				<option>차장</option>				
		</select>
		<div style="text-align: center;">
			<input type="submit" id="btDeSe" name="btDeSe" value="검색">
			<input type="button" id="btDeCe" name="btDeCe" value="취소">
		</div>
	</form>
</div>
</body>
</html>