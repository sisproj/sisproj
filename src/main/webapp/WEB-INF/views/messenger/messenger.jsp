<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>
<script>
    function openRightMenu() {
        document.getElementById("rightMenu").style.display = "block";
    }

    function closeRightMenu() {
        document.getElementById("rightMenu").style.display = "none";
    }
</script>
<style>
    .messenger-container {
        display: block;
        width: 100%;
        height: 100%;
        position: relative;
        overflow: scroll;
        overflow-x: visible;
    }

    .other-msg {

    }

    .messenger-enter-bar {
        position: fixed;
        width: 80%;
        bottom: 0;
        padding: 50px;
    }

    .messenger-enter {
        display: flex;
        flex-wrap: nowrap;
        height: 50px;
        background: whitesmoke;
    }

    .message-area {
        position: relative;
        outline: none;
        border: none;
        resize: none;
        background: inherit;
        color: inherit;
        width: 100%;
        height: 100%;
        font-size: inherit;
        font-family: inherit;
        line-height: inherit;
        text-align: inherit;
    }

    .message-enter button {
        width: 50px;
    }

    .top {
        position: fixed;
        top: 0;
    }


</style>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>

    <!-- W3 CSS -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- font icon, FA -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mainStyle.css"/>">
    <!-- jquery-ui css -->
    <link rel="stylesheet" href="<c:url value="/resources/jquery-ui/jquery-ui.min.css"/>">

    <!-- jquery -->
    <script src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/jquery/jquery.easing.1.3.js"/>"></script>
    <!-- jquery-ui -->
    <script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/>"></script>
    <!-- mainjs -->
    <script src="<c:url value="/resources/js/mainjs.js"/>"></script>
</head>
<body>

<div class="w3-sidebar w3-white w3-card w3-light-grey w3-bar-block" style="width:20%">
    <h3 class="w3-bar-item">Menu</h3>
    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp;채팅 시작</a>
    <a href="#" class="w3-bar-item w3-button">Link 2</a>
    <a href="#" class="w3-bar-item w3-button">Link 3</a>
</div>
<div style="margin-left:20%">
    <div class="w3-top" style="width: 100%; position: relative;">
        <div class="w3-bar w3-white w3-padding w3-card">
            <div class="avatar-img"><i><i class="fa fa-user" aria-hidden="true"></i></i></div>
            <span>대화 상대 이름</span>
            <button class="w3-button w3-teal w3-xlarge w3-right" onclick="openRightMenu()">&#9776;</button>
        </div>
        <div class="w3-sidebar w3-bar-block w3-animate-right" style="display:none; right:0; margin-top:1px; width:400px"
             id="rightMenu">
            <button onclick="closeRightMenu()" class="w3-bar-item w3-button w3-large">Close &times;</button>
            <a href="#" class="w3-bar-item w3-button">Link 1</a>
            <a href="#" class="w3-bar-item w3-button">Link 2</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
        </div>
    </div>
    <!-- 3. 내용 -->
    <div class="messenger-container">
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>
        v<div class="other-msg">
        <div>상대방 프로필</div>
        채팅내용 1<br>
        <span>날짜</span>
    </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div><div class="other-msg">
        <div>상대방 프로필</div>
        채팅내용 1<br>
        <span>날짜</span>
    </div>
        <div class="my-msg">
            <span>채팅내용 2</span>
        </div>

    </div>

    <%-- 채팅 입력창--%>
    <div class="messenger-enter-bar">
        <div class="messenger-enter">
            <textarea class="message-area" rows="1"></textarea>
            <button><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
        </div>
    </div>
</div>
<!-- 3. 내용 끝 -->
</body>
</html>