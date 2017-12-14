<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        /*왼쪽 SideNavigation*/
        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 10;
            top: 84px;
            right: 0;
            overflow-x: hidden;
            padding-top: 60px;
        }

        /*Header*/
        .messenger-header {
            position: fixed;
            left: 0;
            top: 0;
            width: calc(100% - 400px);
            background: whitesmoke;
            z-index: 5;
            margin-left: 400px
        }

        /*Main*/
        .messenger-container {
            margin: 0 auto;
            max-width: 800px;
            padding: 84px 20px 100px;
        }

        .message-wrap {
            border: 2px solid #dedede;
            background-color: #f1f1f1;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
        }

        .darker {
            border-color: #ccc;
            background-color: #ddd;
        }

        .message-wrap::after {
            content: "";
            clear: both;
            display: table;
        }

        .message-wrap img {
            float: left;
            max-width: 60px;
            width: 100%;
            margin-right: 20px;
            border-radius: 50%;
        }

        .message-wrap img.right {
            float: right;
            margin-left: 20px;
            margin-right: 0;
        }

        .time-right {
            float: right;
            color: #aaa;
        }

        .time-left {
            float: left;
            color: #999;
        }

        /* 메시지 입력창 */
        .messenger-enter-container {
            position: fixed;
            bottom: 20px;
            width: calc(100% - 400px);
        }

        .messenger-enter-bar {
            height: 52px;
            background-color: #ffffff;
            border-radius: 20px;
            margin: 0 auto;
            width: 60%;
        }

        .messenger-enter {
            display: flex;
            flex-wrap: nowrap;
            width: 100%;
            height: 100%;
            padding: 12px;
            vertical-align: middle;
        }

        .messenger-textarea {
            position: relative;
            outline: none;
            border: none;
            resize: none
            background: inherit;
            color: inherit;
            width: 100%;
            height: 30px;
            font-size: inherit;
            font-family: inherit;
            line-height: inherit;
            text-align: inherit;
            left: 0;
        }

        .messenger-enter button {
            width: 30px;
            height: 30px;
            border-radius: 15px;
        }

        @media (max-width: 993px) {
            .messenger-header {
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                background: whitesmoke;
                z-index: 10;
                margin-left: 0;
            }

            .messenger-enter-container {
                position: fixed;
                bottom: 20px;
                width: 100%;
            }
        }


    </style>
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
    <script>
        // Initialize Firebase
        var config = {
            apiKey: "AIzaSyCXw6LWciG3AzM_1r6apm8K_KUN-WM9ORA",
            authDomain: "sisproject-932e1.firebaseapp.com",
            databaseURL: "https://sisproject-932e1.firebaseio.com",
            projectId: "sisproject-932e1",
            storageBucket: "sisproject-932e1.appspot.com",
            messagingSenderId: "410246611802"
        };
        firebase.initializeApp(config);

        function writeUserData(userId, name, imageUrl) {
            firebase.database().ref('users/' + userId).set({
                userName: name,
                imageUrl: imageUrl,
            });
        }

        function writeChats(otherId, title, lastMessage) {
            userId = 1;
            firebase.database().ref('chats/' + userId + '/' + otherId).set({
                title: "타이틀",
                lastMessage: "마지막 메시지",
                timestamp: "2017-12-14 15:41:30"
            });

            writeMessage("사용자1", "사용자2", "2017-12-14 15:41:30")
        }

        function writeMessage(userName) {
            userid = 1;
            otherId = 2;
            message = $("#chatMsg").val();
            firebase.database().ref('message/' + userId + '/' + otherId).push({
                name: userName,
                message: message,
                timestamp: "2017-12-14 15:41:30"
            });
        }


        $(document).ready(function () {
            var commentsRef = firebase.database().ref('message/' + "1" + '/' + "2");
            commentsRef.on('child_added', function (data) {
                console.log(data.val().message);
                $('#messengerContainer').append(
                    "<div class='message-wrap darker'>" +
                    "<p>" + data.val().message + "</p>" +
                    "<span class='time-left'>11:01</span>" +
                    "</div>"
                )
            });
        });


    </script>
</head>
<body>

<!-- 왼쪽 SideMenu-->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top w3-border-right" style="z-index:3;width:400px"
     id="mySidebar">
    <div class="w3-container w3-display-container w3-padding-16">
        <h3 class="w3-wide"><b>LOGO</b></h3>
    </div>
    <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
        <a href="#" class="w3-bar-item w3-button">대화 명1</a>
        <a href="#" class="w3-bar-item w3-button">대화 명2</a>
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
<div class="w3-main" id="messenger-main" style="margin-left:400px">
    <!-- 채팅창 -->
    <div class="messenger-container" id="messengerContainer">

        <%--TODO 채팅 내용 Firebase Database 이용해 가져오기--%>
        <div class="message-wrap">
            <img src="<c:url value='/resources/images/airplain.png'/>" alt="Avatar" style="width:100%;">
            <p>Hello. How are you today?</p>
            <span class="time-right">11:00</span>
        </div>

        <div class="message-wrap darker">
            <img src="<c:url value='/resources/images/airplain.png'/>" alt="Avatar" class="right" style="width:100%;">
            <p>Hey! I'm fine. Thanks for asking!</p>
            <span class="time-left">11:01</span>
        </div>
    </div>
    <%-- 채팅 입력창--%>
    <div class="messenger-enter-container" id="enter-container">
        <div class="messenger-enter-bar w3-card">
            <div class="messenger-enter">
                <textarea class="messenger-textarea" rows="1" id="chatMsg"></textarea>
                <button onclick="writeChats('사용자1')"><i class="fa fa-paper-plane"
                                                                        aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
</div>
</body>
</html>