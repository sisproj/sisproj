<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty noticeList }">
	<tr>
		<td colspan="3">조회된 데이터가 없습니다.</td>
	</tr>
</c:if>
<c:if test="${!empty noticeList }">
	<c:forEach var="notiVo" items="${noticeList }">
		<tr>   
			<td><c:if test="${!empty notiVo.notiOfilename }"><img alt="첨부" src="<c:url value='/noti_images/clip.png'/>" style="width:15px; height:15px;"></c:if></td>
			<td><a href="<c:url value='/notice/countUpdate.do?notiNo=${notiVo.notiNo}'/>">${notiVo.notiTitle }</a></td>
			<td><fmt:formatDate value="${notiVo.notiRegdate }" pattern="yyyy-MM-dd"/> </td>
		</tr>
	</c:forEach>
</c:if>