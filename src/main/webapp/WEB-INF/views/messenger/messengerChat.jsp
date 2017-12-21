<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>

<script>
    var chatKey = "${chatKey}";
    loadMessages(chatKey);
    resetUnreadCount();
    // 채팅 TextArea 엔터키 입력시

    $('#chatMsg').keypress(function (e) {
        var code = e.keyCode;
        if (code === 13) {
            writeMessage('user1');
            $(this).val("");
            return false;
        }
    });
</script>

<!-- 오른쪽 SideMenu -->
<div id="messengerSideNav" class="sidenav">
    <%--TODO 클릭한 회원 정보 카드--%>
    <div class="w3-white w3-margin">
        <div class="w3-light-grey">
            <div class="w3-bar" id="memberList" style="overflow-x: hidden; overflow-y: scroll; height: 105px">
                <%--채팅방 Member 프로필 이미지 출력--%>
            </div>
        </div>
        <div class="w3-container w3-center">
            <img src="<c:url value='/resources/images/avatar.png'/>" alt="Avatar" style="width:50%">
            <h5>John Doe</h5>

            <div class="w3-section">
                <button class="w3-button w3-green">Accept</button>
                <button class="w3-button w3-red">Decline</button>
            </div>
        </div>

    </div>
</div>

<!-- Main -->
<input type="hidden" id="chatKey" name="chatKey" value="${key}">
<div class="w3-main" id="messenger-main" style="margin-left:400px">
    <!-- 채팅창 -->
    <div class="messenger-container" id="messengerContainer">
    </div>
    <!-- 채팅 입력창-->
    <div class="messenger-enter-container" id="enter-container">
        <div class="messenger-enter-bar w3-card">
            <div class="messenger-enter">
                <textarea class="messenger-textarea" rows="1" id="chatMsg">${chatKey}</textarea>
                <button onclick="writeMessage()"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
</div>
