<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty noticeList }">
	<tr>
		<td colspan="2">조회된 데이터가 없습니다.</td>
	</tr>
</c:if>
<c:if test="${!empty noticeList }">
	<c:forEach var="notiVo" items="${noticeList }">
		<tr>
			<td><a href="<c:url value='/notice/countUpdate.do?notiNo=${notiVo.notiNo}'/>">${notiVo.notiTitle }</a></td>
		</tr>
	</c:forEach>
</c:if>