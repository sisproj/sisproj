<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty awaitList }">
	<tr>
		<td colspan="3">조회된 데이터가 없습니다.</td>
	</tr>
</c:if>
<c:if test="${!empty awaitList }">
	<c:forEach var="vo" items="${awaitList }">
		<tr>
			<td><a href="<c:url value='/confirm/detail.do?cfNo=${vo.cfNo }'/>">${vo.cfTitle }</a></td>
			<td>${vo.empName }</td>
			<td>
				<fmt:formatDate value="${vo.cfRegdate }" pattern="yy-MM-dd"/>
			</td>
		</tr>
	</c:forEach>
</c:if>