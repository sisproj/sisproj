<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@include file="../common/common.jsp" %>
<c:if test="${empty recMsgList}">
  <tr>
    <td colspan="3">받은 쪽지가 없습니다.</td>
  </tr>

</c:if>
<c:forEach items="${recMsgList}" var="msgVO">
  <c:if test="${msgVO.msgReadflag eq 'Y'}">
    <tr class="w3-light-gray hoverable readMessage" id="msg-${msgVO.recNo}">
  </c:if>
  <c:if test="${msgVO.msgReadflag eq 'N'}">
    <tr class="hoverable unReadMessage" id="msg-${msgVO.recNo}">
  </c:if>
  <td style="width: 20%">
    <c:if test="${fn:length(msgVO.empName)>7 }">
      ${fn:substring(msgVO.empName,0,7) }...
    </c:if>
    <c:if test="${fn:length(msgVO.empName)<=7 }">
      ${msgVO.empName}
    </c:if>
  </td>
  <td style="width: 65%">
    <div onclick="window.open('<c:url
      value="/message/detail.do?recNo=${msgVO.recNo}"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no');">
      <c:if test="${msgVO.msgImpflag eq 'Y'}">
        <span class="w3-border w3-round w3-tiny w3-light-gray">중요 쪽지</span>
      </c:if>
      <a href="#" onclick="messageDetailOpen('msg-${msgVO.recNo}')">
          ${msgVO.msgTitle}
      </a>
    </div>

  </td>
  <td class="w3-center" style="width: 10%; max-width: 125px; min-width: 125px">
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
