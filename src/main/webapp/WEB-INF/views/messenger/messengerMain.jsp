<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/pagecss/messenger_main.css'/>">

    <%-- messenger JS--%>
    <script type="text/javascript">
        var chatKey = null;

        function changeContent(key) {
            $('#messenger-main-container').html("").load('messengerChat.do', {key: key});
            $('#sidebar-button').show().attr('name', 'hide-nav');
        }
    </script>

    <%-- firebase init --%>
    <script src="https://www.gstatic.com/firebasejs/4.8.0/firebase.js"></script>
    <script src="<c:url value="/resources/js/pagejs/messenger_firebase_init.js"/>"></script>

    <%-- firebase 채팅목록 처리 script--%>
    <script>
        $(document).ready(function () {
            $('#sidebar-button').hide(); //우측 버튼 숨김

            /* TODO 세션에서 로그인한 사용자 ID를 가져와서 userId에 넣어야 함*/
            var userId = "user1";
            loadKeyListByUserId(userId);

            /* keyList 배열에 사용자의 채팅방 리스트를 담는 함수*/
            var keyList = [];

            function loadKeyListByUserId(userId) {
                var usersRef = firebase.database().ref('users/' + userId);
                usersRef.once('value', function (snapshot) {
                    snapshot.forEach(function (childSnapshot) {
                        var childKey = childSnapshot.key;
                        keyList.push(childKey);
                        appendMessages(childKey);
                    });
                }).then(function () { //불러오기 끝난후 실행
                    loadChats(keyList);
                });
            }


            /* 가져온 채팅방 리스트를 왼쪽 사이드네비에 뿌려주는 함수 */
            function loadChats(keyList) {
                for (var i = 0; i < keyList.length; i++) {
                    var chatsRef = firebase.database().ref('chats/' + keyList[i]);
                    chatsRef.once('value', function (snapshot) {
                        var title = snapshot.val().title;
                        var lastMessage = snapshot.val().lastMessage;

                        var onclickStr = 'onclick="changeContent(\'' + snapshot.key + '\')"';
                        $('#chatsList').append(
                            '<a href="#" class="w3-bar-item w3-button" id="' + snapshot.key + '" ' + onclickStr + '>' +
                            title + '<br>' +
                            lastMessage +
                            '</a>'
                        )
                    });
                }
            }
        });
    </script>

    <%-- firebase 채팅처리 script--%>
    <script>
        /* TODO userId 세션에서 가져와야함*/
        var userId = "user1";

        function loadMessages(key) {
            var messeagesRef = firebase.database().ref('messages/' + key);
            messeagesRef.once('value', function (snapshot) {
                snapshot.forEach(function (childSnapshot) {
                    var childKey = childSnapshot.key;
                    var timestamp = childSnapshot.val().timestamp;

                    var date = new Date(timestamp);
                    var hour = date.getHours();
                    var min = date.getMinutes();

                    if (userId === childSnapshot.val().name) {
                        $('#messengerContainer').append(
                            '<div class="message-wrap darker">' +
                            '<img src="<c:url value='/resources/images/avatar.png'/>" alt="Avatar" class="right" style="width:100%;">' +
                            '<p>' + childSnapshot.val().message + '</p>' +
                            '<span class="time-right">' + hour + ':' + min + '</span>' +
                            '</div>'
                        );
                    } else {
                        $('#messengerContainer').append(
                            '<div class="message-wrap">' +
                            '<img src="<c:url value='/resources/images/avatar.png'/>" alt="Avatar" style="width:100%;">' +
                            '<p>' + childSnapshot.val().message + '</p>' +
                            '<span class="time-right">' + hour + ':' + min + '</span>' +
                            '</div>'
                        );
                    }
                });

                //채팅 입력시 스크롤 맨 아래로
                $('#messenger-main').scrollTop($(this).height());
            });
        }

        function appendMessages(key) {
            /* key에 해당하는 채팅방의 메시지를 가져와 화면에 뿌려줌*/
            var messeagesRef = firebase.database().ref('messages/' + key);
            //Messages Child가 추가될때 마다 실행
            messeagesRef.on('child_added', function (data) {
                var timestamp = data.val().timestamp;

                var date = new Date(timestamp);
                var hour = date.getHours();
                var min = date.getMinutes();

                if (userId === data.val().name) {
                    $('#messengerContainer').append(
                        '<div class="message-wrap darker">' +
                        '<img src="<c:url value='/resources/images/airplain.png'/>" alt="Avatar" class="right" style="width:100%;">' +
                        '<p>' + data.val().message + '</p>' +
                        '<span class="time-right">' + hour + ':' + min + '</span>' +
                        '</div>'
                    );
                } else {
                    $('#messengerContainer').append(
                        '<div class="message-wrap">' +
                        '<img src="<c:url value='/resources/images/airplain.png'/>" alt="Avatar" style="width:100%;">' +
                        '<p>' + data.val().message + '</p>' +
                        '<span class="time-right">11:00</span>' +
                        '</div>'
                    );
                }
                if (chatKey != null) {
                    writeChats(userId);
                }
            });
        }


        /* 마지막 채팅 변경 함수 */
        function writeChats(userId) {
            var date = new Date();
            var timestamp = date.getTime();
            firebase.database().ref('chats/' + chatKey).set({
                title: "user2",
                lastMessage: $('#chatMsg').val(),
                timestamp: timestamp
            });

            $('#' + chatKey).html(
                'user2' + '<br>' +
                $('#chatMsg').val() + '<br>' +
                timestamp
            )
        }


        /* firebase DB에 채팅 메시지를 push */
        function writeMessage(userId) {
            var date = new Date();
            var timestamp = date.getTime();

            message = $("#chatMsg").val();
            firebase.database().ref('messages/' + chatKey).push({
                name: userId,
                message: message,
                timestamp: timestamp
            });
        }
    </script>


    <%-- 화면 크기조절 script --%>
    <script>
        $(document).ready(function () {
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
</head>
<body>

<!-- 왼쪽 SideMenu-->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top w3-border-right" style="z-index:3;width:400px">
    <div class="w3-container w3-display-container w3-padding-16">
        <h3 class="w3-wide"><b><a href="<c:url value='/messenger/messenger.do'/>">LOGO</a></b></h3>
    </div>
    <div class="w3-padding-64 w3-large w3-text-grey" id="chatsList" style="font-weight:bold">
        <button id="startChatButton" class="w3-button w3-blue w3-hover-black">채팅 시작</button>
        <ul>
            <li class="w3-bar">
                <img src="<c:url value='/resources/images/avatar.png'/>" class="w3-bar-item w3-circle"
                     style="width:85px">
                <div class="w3-bar-item">
                    <span class="w3-large">Mike</span><br>
                    <span>Web Designer</span>
                </div>
            </li>
        </ul>
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

<!-- Main -->
<div id="messenger-main-container"></div>
</body>
</html>