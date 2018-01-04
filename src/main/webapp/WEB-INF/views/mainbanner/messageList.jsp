<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<c:if test="${empty recMsgList}">
  <tr>
    <td colspan="3">받은 쪽지가 없습니다.</td>
  </tr>
</c:if>
<c:forEach items="${recMsgList}" var="msgVO">
  <tr>
    <td>
      <c:if test="${fn:length(msgVO.empName)>7 }">
        ${fn:substring(msgVO.empName,0,7) }...
      </c:if>
      <c:if test="${fn:length(msgVO.empName)<=7 }">
        ${msgVO.empName}
      </c:if>
    </td>
    <td onclick="window.open('<c:url
      value="/message/detail.do?recNo=${msgVO.recNo}"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no');">
        <a href="#" onclick="messageDetailOpen('msg-${msgVO.recNo}')">
            ${msgVO.msgTitle}
        </a>
    </td>
    <td>
      <c:set var="today"><fmt:formatDate value="${now}" type="date"/></c:set>
      <c:set var="msgRegDate"><fmt:formatDate value="${msgVO.msgRegdate}" type="date"/></c:set>
      <c:if test="${today eq msgRegDate}">
        <fmt:formatDate value="${msgVO.msgRegdate}" pattern="HH:mm"/>
      </c:if>
      <c:if test="${today ne msgRegDate}">
        ${msgRegDate}
      </c:if>
    </td>
  </tr>
</c:forEach>
