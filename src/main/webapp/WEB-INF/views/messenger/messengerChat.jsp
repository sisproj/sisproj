<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="<c:url value='/resources/css/pagecss/messenger_main.css'/>">
<script>
    var key = "${key}";
    $(document).ready(function () {
        loadMessages(key);
    });

    function loadMessages(key) {
        var messeagesRef = firebase.database().ref('messages/' + key);
        messeagesRef.on('child_added', function(data) {
            $('#messengerContainer').append(
                '<div class="message-wrap">' +
                '<img src="<c:url value='/resources/images/airplain.png'/>" alt="Avatar" style="width:100%;">' +
                '<p>' + data.val().message + '</p>' +
                '<span class="time-right">11:00</span>' +
                '</div>'
            );
        })
    }

    function writeChats(userId) {

        var date = new Date();
        firebase.database().ref('chats/' + key).set({
            title: "user2",
            lastMessage: $('#chatMsg').val(),
            timestamp: date
        });

        writeMessage(userId);
    }

    function writeMessage(userId) {
        var date = new Date();
        console.log("test@@@@@@");
        message = $("#chatMsg").val();
        firebase.database().ref('messages/' + key).push({
            name: userId,
            message: message,
            timestamp: date
        });
    }
</script>
<!-- 오른쪽 SideMenu -->
<div id="messengerSideNav" class="sidenav w3-white w3-card">
    <%--TODO 클릭한 회원 정보 카드--%>
</div>

<!-- Main -->
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
    <%-- 채팅 입력창--%>
    <div class="messenger-enter-container" id="enter-container">
        <div class="messenger-enter-bar w3-card">
            <div class="messenger-enter">
                <textarea class="messenger-textarea" rows="1" id="chatMsg">${key}</textarea>
                <button onclick="writeChats('user1')"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
</div>
