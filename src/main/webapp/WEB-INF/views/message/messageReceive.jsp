<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:useBean id="now" class="java.util.Date" />
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
        <button class="message-button w3-btn" onclick="window.open('<c:url
                value="/message/messageWrite.do"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no')">
            쪽지 작성
        </button>
    </div>
    <ul>
        <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
        <li class="active"><a href="<c:url value='/message/messageReceive.do'/> "><i class="fa fa-envelope-o"
                                                                                     aria-hidden="true"></i>&nbsp;<span>받은 쪽지함</span></a>
        </li>
        <li><a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;<span>보낸 쪽지함</span></a></li>
        <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;<span>중요 쪽지함</span></a></li>
        <li><a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;<span>휴지통</span></a></li>
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
    <div class="w3-container w3-margin">
        <h5>
            <b class="w3-bar-item">받은 쪽지함</b>
        </h5>
        <table class="w3-table-all w3-hoverable w3-border-0" style="width: 90%; margin-left: 5%">
            <thead>
            <tr class=" w3-border-bottom">
                <th>
                    <div class="w3-button w3-light-grey">
                        <input type="checkbox" title="selectAllMessages">
                    </div>
                </th>
                <th class="w3-text-white">
                    <button class="w3-button w3-small w3-light-grey"><i class="fa fa-star-o " aria-hidden="true"></i>
                    </button>
                    <button class="w3-button w3-small w3-light-grey"><i class="fa fa-trash-o " aria-hidden="true"></i>
                    </button>
                </th>
                <th colspan="2">
                    <div class="w3-right">
                        <input class="w3-bar-item w3-border w3-left" style="width: 82%; height: 28px; padding: 10px;" type="text" placeholder="Search...">
                        <button type="button" class="w3-bar-item w3-button w3-blue w3-small"
                                style="width: 18%; height: 28px">
                            <i class="fa fa-search w3-text-white"></i>
                        </button>
                    </div>
                </th>
            </tr>
            </thead>
            <c:forEach items="${msgList}" var="msgVO">
            <tr>
                <td style="width: 5%" class="w3-center"><input type="checkbox"></td>
                <td style="width: 20%">${msgVO.empName}</td>
                <td style="width: 55%">${msgVO.msgTitle}</td>
                <td class="w3-right-align" style="width: 20%;">
                    <c:set var="today"><fmt:formatDate value="${now}" type="date"/></c:set>
                    <c:set var="msgRegDate"><fmt:formatDate value="${msgVO.msgRegdate}" type="date"/></c:set>
                    <c:if test="${today eq msgRegDate}">
                        <fmt:formatDate value="${msgVO.msgRegdate}" pattern="HH:mm"/>
                    </c:if>
                    <c:if test="${today ne msgRegDate}">
                        ${msgRegDate}
                    </c:if>
                </td>
            </tr
            </c:forEach>>
        </table>
        <div class="w3-bar w3-margin w3-center">
            <a href="#" class="w3-button">&laquo;</a>
            <a href="#" class="w3-button">1</a>
            <a href="#" class="w3-button">2</a>
            <a href="#" class="w3-button">3</a>
            <a href="#" class="w3-button">4</a>
            <a href="#" class="w3-button">&raquo;</a>
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