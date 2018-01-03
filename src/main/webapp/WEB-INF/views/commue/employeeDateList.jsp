<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="commueTop.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="<c:url value='/commue/commueDateList.do' />">
	<div id="dimyPage">
		<table id="DList" border="1" >
		
		<colgroup>
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="20%">
			<col width="20%">
			<col width="15%">
		</colgroup>
				<tr>
					<th>사원이름</th>
					<th>부서명</th>
					<th>직급</th>
					<th>출근</th>
					<th>퇴근</th>		
					<th>상태</th>
				</tr>	
			<c:forEach var="vo" items="${list }">
				<tr>
					<td><a href="<c:url value='/' />">${vo.empName }</a></td>
					<td>${vo.deptName }</td>
					<td>${vo.posName }</td>
					<td>${vo.cmtIn }</td>
					<td>${vo.cmtOut }</td>
					<c:if test="${vo.cmtStatus eq ('Y') }">
						<td>출근</td>
					</c:if>
					<c:if test="${vo.cmtStatus eq ('N') }">
						<td>퇴근</td>
					</c:if>
					<c:if test="${empty vo.cmtStatus }">
						<td>기록이 없습니다</td>
					</c:if>
				</tr>
			</c:forEach>
			</table>
	</div>
</form>
</body>
</html>
<%@include file="commueBottom.jsp" %>