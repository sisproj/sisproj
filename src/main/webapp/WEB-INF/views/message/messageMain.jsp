<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
<link rel="stylesheet" href="<c:url value='/resources/css/w3/w3.css'/>"/>
<style>
    .message-button {
        margin: 30px;
        width: 70%;
        height: 50px;
        background-color: #036;
        color: white;
    }
</style>
<nav>
    <div style="width: 298px; text-align: center">
        <button class="message-button w3-btn"
                onclick="window.open('<c:url
                        value="/message/write.do"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no')">
            쪽지 작성
        </button>
    </div>
    <ul>
        <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
        <li>
            <a href="<c:url value='/message/receive.do'/> ">
                <i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;<span>받은 쪽지함</span>
            </a>
        </li>
        <li>
            <a href="<c:url value='/message/send.do'/> ">
                <i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;<span>보낸 쪽지함</span>
            </a>
        </li>
        <li>
            <a href="<c:url value='/message/important.do'/> ">
                <i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;<span>중요 쪽지함</span>
            </a>
        </li>
        <li>
            <a href="<c:url value='/message/recycleBin.do'/> ">
                <i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;<span>휴지통</span>
            </a>
        </li>
    </ul>
    <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
    <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
</nav>
</aside>
<!-- 왼쪽 사이드 메뉴 끝 -->
<article id="headsection">
    <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
    <h1>
        <i class="fa fa-book" aria-hidden="true"></i>
        &nbsp;쪽지함&nbsp;
        <a href="#">
            <i class="fa fa-bookmark bookmark" aria-hidden="true"></i>
        </a>
    </h1>
    <!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
    <!-- 3. 내용 -->
    <div class="w3-row-padding w3-margin-bottom w3-center" style="width: 80%; margin-left: 10%">
        <div class="w3-quarter">
            <div class="w3-container w3-red w3-padding-16 w3-hover-opacity w3-hover-red"
                 onclick="location.href='<c:url value="/message/receive.do"/>'">
                <div class="w3-left"><i class="fa fa-envelope-o w3-xxxlarge w3-text-white" aria-hidden="true"></i></div>
                <div class="w3-right">
                    <h3 class="w3-text-white">
                        ${recUnreadCnt}/${recCnt}
                    </h3>
                </div>
                <div class="w3-clear"></div>
                <h4 class="w3-text-white">받은 쪽지함</h4>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-blue w3-padding-16 w3-hover-opacity w3-hover-blue"
                 onclick="location.href='<c:url value="/message/send.do"/>'">
                <div class="w3-left"><i class="fa fa-envelope-o w3-xxxlarge w3-text-white" aria-hidden="true"></i></div>
                <div class="w3-right">
                    <h3 class="w3-text-white">${sendCnt}</h3>
                </div>
                <div class="w3-clear"></div>
                <h4 class="w3-text-white">보낸 쪽지함</h4>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-teal w3-padding-16 w3-hover-opacity w3-hover-teal"
                 onclick="location.href='<c:url value="/message/important.do"/>'">
                <div class="w3-left"><i class="fa fa-star-o w3-xxxlarge w3-text-white" aria-hidden="true"></i></div>
                <div class="w3-right">
                    <h3 class="w3-text-white">${recImpCnt}</h3>
                </div>
                <div class="w3-clear"></div>
                <h4 class="w3-text-white">중요 쪽지함</h4>
            </div>
        </div>

        <div class="w3-quarter">
            <div class="w3-container w3-grey w3-padding-16 w3-hover-opacity w3-hover-grey"
                 onclick="location.href='<c:url value="/message/recycleBin.do.do"/>'">
                <div class="w3-left"><i class="fa fa-trash-o w3-xxxlarge w3-text-white" aria-hidden="true"></i></div>
                <div class="w3-right">
                    <h3 class="w3-text-white">${recycleCnt}</h3>
                </div>
                <div class="w3-clear"></div>
                <h4 class="w3-text-white">휴지통</h4>
            </div>
        </div>
    </div>

    <div class="w3-container w3-margin">
        <div class="w3-half w3-padding">
            <h5><b>받은 쪽지함</b><a href="<c:url value='/message/receive.do'/> " class="w3-right w3-small w3-padding">>></a></h5>
            <table class="w3-table-all w3-hoverable">
                <thead>
                <tr class="w3-red">
                    <th style="width: 20%; min-width: 95px;" class="w3-center w3-text-white">보낸 사람</th>
                    <th style="width: 60%" class="w3-center w3-text-white">제목</th>
                    <th style="width: 20%; min-width: 128px" class="w3-center w3-text-white">날짜</th>
                </tr>
                </thead>
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
            </table>
        </div>
        <div class="w3-half w3-padding">
            <h5><b>보낸 쪽지함</b><a href="<c:url value='/message/send.do'/>" class="w3-right w3-small w3-padding">>></a></h5>
            <table class="w3-table-all w3-hoverable">
                <thead>
                <tr class="w3-blue">
                    <th style="width: 20%; min-width: 95px;" class="w3-center w3-text-white">받는 사람</th>
                    <th style="width: 60%" class="w3-center w3-text-white">제목</th>
                    <th style="width: 20%; min-width: 128px" class="w3-center w3-text-white">날짜</th>
                </tr>
                </thead>
                <c:if test="${empty sendMsgList}">
                    <tr>
                        <td colspan="3">보낸 쪽지가 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach items="${sendMsgList}" var="msgVO">
                    <tr class="hoverable" id="msg-${msgVO.recNo}">
                        <td style="width: 20%">
                            <c:if test="${fn:length(msgVO.empName)>5 }">
                                ${fn:substring(msgVO.empName,0,5) }...
                            </c:if>
                            <c:if test="${fn:length(msgVO.empName)<=5 }">
                                ${msgVO.empName}
                            </c:if>
                        </td>
                        <td style="width: 65%">
                            <div onclick="window.open('<c:url
                                    value="/message/sendDetail.do?msgNo=${msgVO.msgNo}"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no');">
                                <a href="#">${msgVO.msgTitle}</a>
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
            </table>
        </div>
    </div>
    <!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
    $(function () {
//        $('header nav ul li:nth-child(1) a').addClass('active');
    });
</script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>