<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="groupVo" items="${addrGroupList }">
	<input type="hidden" name="groupNo" id="groupNo" value="${groupVo.groupNo }">
	<li><a href="<c:url value='/addrBook/addrBookList.do?groupNo=${groupVo.groupNo }'/>">└ ${groupVo.groupName} </a></li>
</c:forEach>  