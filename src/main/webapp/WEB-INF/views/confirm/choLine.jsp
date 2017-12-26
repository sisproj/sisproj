<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${!empty empNoList }">
	<c:forEach var="clVo" items="${empNoList }" varStatus="status">
		<tr class="${status.index+1 }">
			<td>${status.index+1 }</td>
			<td>${clVo.deptName }</td>
			<td class='cf_empPo'>${clVo.posName }</td>
			<td class='cf_empName'>${clVo.empName }</td>
			<input type='hidden' name='confirmerNo' class='confirmerNo' value='${clVo.empNo }'>
		</tr>	
	</c:forEach>
</c:if>
<c:if test="${!empty clVo }">
	<td>${clVo.deptName }</td>
	<td class='cf_empPo'>${clVo.posName }</td>
	<td class='cf_empName'>${clVo.empName }</td>
	<input type='hidden' name='confirmerNo' class='confirmerNo' value='${clVo.empNo }'>
</c:if>