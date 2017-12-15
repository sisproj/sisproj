<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/pagecss/messenger_main.css'/>">
    <script type="text/javascript">
        $(function () {
            $('#sidebar-button').click(function () {
                var status = $(this).attr('name');

                if (status === 'hide-nav') {
                    $('#messengerSideNav').animate({
                        width: '400px'
                    }, 500);

                    $('#messenger-main').animate({
                        marginRight: '400px'
                    }, 500);

                    $('#enter-container').animate({
                        width: '-=400px'
                    }, 500);

                    $(this).attr('name', 'show-nav');
                } else if (status === 'show-nav') {
                    $('#messengerSideNav').animate({
                        width: '0'
                    }, 500);

                    $('#messenger-main').animate({
                        marginRight: '0'
                    }, 500);

                    $('#enter-container').animate({
                        width: '+=400px'
                    }, 500);

                    $(this).attr('name', 'hide-nav');
                }
            });
        });
    </script>

    <%-- firebase init --%>
    <script src="https://www.gstatic.com/firebasejs/4.8.0/firebase.js"></script>
    <script src="<c:url value="/resources/js/pagejs/messenger_firebase_init.js"/>"></script>
    <script src="<c:url value="/resources/js/pagejs/messenger_main.js"/>"></script>
    <script>
        $(document).ready(function () {
            /* TODO 세션에서 로그인한 사용자 ID를 가져와서 userId에 넣어야 함*/
            var userId = "user1";
            loadKeyListByUserId(userId);

            var keyList = [];

            function loadKeyListByUserId(userId) {
                var usersRef = firebase.database().ref('users/' + userId);
                usersRef.once('value', function (snapshot) {
                    snapshot.forEach(function (childSnapshot) {
                        var childKey = childSnapshot.key;
                        keyList.push(childKey);
                    });
                }).then(function () {
                    loadChats(keyList);
                });
            }

            function loadChats(keyList) {
                for (var i = 0; i < keyList.length; i++) {
                    var chatsRef = firebase.database().ref('chats/' + keyList[i]);
                    chatsRef.once('value', function (snapshot) {
                        var title = snapshot.val().title;
                        var lastMessage = snapshot.val().lastMessage;

                        var onclickStr = 'onclick="changeContent(\'' + snapshot.key + '\')"';
                        $('#chatsList').append(
                            '<a href="#" class="w3-bar-item w3-button"' + onclickStr + '>' +
                            title + '<br>' +
                            lastMessage +
                            '</a>'
                        )
                    });
                }
            }
        });
    </script>
</head>
<body>

<!-- 왼쪽 SideMenu-->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top w3-border-right" style="z-index:3;width:400px">
    <div class="w3-container w3-display-container w3-padding-16">
        <h3 class="w3-wide"><b>LOGO</b></h3>
    </div>
    <div class="w3-padding-64 w3-large w3-text-grey" id="chatsList" style="font-weight:bold">
        <a href="#" class="w3-bar-item w3-button">대화 명1</a>
        <a class="w3-button w3-block w3-white w3-left-align active" id="myBtn">대화 명3</a>
    </div>
</nav>

<!-- Header -->
<div class="messenger-header w3-card">
    <header class="w3-container w3-xlarge">
        <p class="w3-left w3-bar-item w3-padding-24 w3-wide">대화 명</p>
        <p class="w3-right">
            <a href="#" class="w3-bar-item w3-button w3-padding-24 w3-right" name="hide-nav" id="sidebar-button">
                <i class="fa fa-bars"></i>
            </a>
        </p>
    </header>
</div>
<!-- 오른쪽 SideMenu -->
<div id="messengerSideNav" class="sidenav w3-white w3-card">
    <%--TODO 클릭한 회원 정보 카드--%>
</div>

<!-- Main -->
<div id="messenger-main-container"></div>
</body>
</html>