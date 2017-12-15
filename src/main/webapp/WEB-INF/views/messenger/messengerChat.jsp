<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>

<script>
    var chatKey = "${key}";
    loadMessages(chatKey);
</script>

<!-- 오른쪽 SideMenu -->
<div id="messengerSideNav" class="sidenav w3-white w3-card">
    <%--TODO 클릭한 회원 정보 카드--%>
    <h1>테스트1</h1>
    <h2>테스트21</h2>
    <h3>테스트3</h3>
    <h4>테스트4</h4>
</div>

<!-- Main -->
<input type="hidden" id="chatKey" name="chatKey" value="${key}">
<div class="w3-main" id="messenger-main" style="margin-left:400px">
    <!-- 채팅창 -->
    <div class="messenger-container" id="messengerContainer">
        <%--TODO 채팅 내용 Firebase Database 이용해 가져오기--%>
        <%--<div class="message-wrap">
            <img src="<c:url value='/resources/images/airplain.png'/>" alt="Avatar" style="width:100%;">
            <p>Hello. How are you today?</p>
            <span class="time-right">11:00</span>
        </div>

        <div class="message-wrap darker">
            <img src="<c:url value='/resources/images/airplain.png'/>" alt="Avatar" class="right" style="width:100%;">
            <p>Hey! I'm fine. Thanks for asking!</p>
            <span class="time-left">11:01</span>
        </div>--%>
    </div>
    <!-- 채팅 입력창-->
    <div class="messenger-enter-container" id="enter-container">
        <div class="messenger-enter-bar w3-card">
            <div class="messenger-enter">
                <textarea class="messenger-textarea" rows="1" id="chatMsg">${key}</textarea>
                <button onclick="writeMessage('user1')"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
</div>
