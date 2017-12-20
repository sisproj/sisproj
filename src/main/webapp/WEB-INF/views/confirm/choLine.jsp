<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${!empty empNoList }">
	<c:forEach var="clVo" items="${empNoList }">
		<tr>
			<td></td>
			<td>${clVo.deptName }</td>
			<td class='cf_empPo'>${clVo.empPosition }</td>
			<td class='cf_empName'>${clVo.empName }</td>
			<input type='hidden' name='empNoo' value='${clVo.empNo }'>
		</tr>		
	</c:forEach>
</c:if>
<c:if test="${!empty clVo }">
	<td>${clVo.deptName }</td>
	<td class='cf_empPo'>${clVo.empPosition }</td>
	<td class='cf_empName'>${clVo.empName }</td>
	<input type='hidden' name='empNoo' value='${clVo.empNo }'>
</c:if>