<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="groupVo" items="${addrGroupList }">
	<li><a href="#">└ ${groupVo.groupName} </a></li>
</c:forEach>  