<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <%-- Bootstrap tokenfield --%>
    <%--<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>">--%>
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/bootstrap-tokenfield.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/tokenfield-typeahead.css'/>">
    <script src="<c:url value='/resources/js/bootstrap/bootstrap-tokenfield.js'/>"></script>

    <link rel="stylesheet" href="<c:url value='/resources/css/pagecss/messenger_main.css'/>">

    <%-- messenger JS--%>
    <script type="text/javascript">
        var initFlag = true;

        var userId = "";
        var userName = "";
        var userImg = "";
        var chatKey = "";
        var userKey = "";

        $(document).ready(function () {
            userKey = $('#userKey').val();
            userId = $('#sessionId').val();
            userName = $('#sessionName').val();
            userImg = $('#sessionImg').val();

            firebaseSetUser();
            if (initFlag) {
                loadKeyListByUserId(userId);
                loadOrganization(userKey);
                initFlag = false;
            }

        });

        function firebaseSetUser() {
            $.ajax({
                type: "post",
                url: "<c:url value='/messenger/messengerUser.do'/>",
                success: function (data) {
                    var empNo, empName, empImg, posName;
                    for (var i = 0; i < data.length; i++) {
                        empNo = data[i].empNo;
                        empName = data[i].empName;
                        empImg = data[i].empImg;
                        posName = data[i].posName;

                        var usersRef = firebase.database().ref('users/' + empNo);
                        usersRef.update({
                            emp_name: empName,
                            emp_position: posName,
                            emp_img: empImg
                        });
                    }
                }
            });
        }

        function loadOrganization(userKey) {
            if (userKey != "0") {
                var sendEmpNo = ${sendEmpNo};
                var recEmpNo = ${recEmpNo};

                console.log(sendEmpNo +"," +recEmpNo);
                if(sendEmpNo != 0 || recEmpNo != 0) {
                    chatStart();
                }

                setTimeout(function () {
                    changeContent(userKey);
                },3000);

            } else {
                $('#messenger-main-container').html("").load('messengerStart.do');
            }
        }

        function chatStart() {
            var empIdArr = [];
            var sendEmpNo = 0;
            var recEmpNo = 0;
            sendEmpNo = ${sendEmpNo} + "";
            recEmpNo = ${recEmpNo} + "";

            if(sendEmpNo == 0 || recEmpNo == 0) {
                empIdArr = $('#choiceEmpId').val().split(",");
                empIdArr.push(userId);
                empIdArr.sort();
            } else {
                empIdArr.push(sendEmpNo);
                empIdArr.push(recEmpNo);
                empIdArr.sort();
            }

            console.log(empIdArr);


            /* Users 설정 - 선택된 사용자에게 채팅방 할당 */
            var chat = "chat";
            for (var i = 0; i < empIdArr.length; i++) {
                chat += empIdArr[i].substring(4);
            }

            for (var i = 0; i < empIdArr.length; i++) {
                var usersRef = firebase.database().ref('users/' + empIdArr[i] + '/' + "chatlist" + "/" + chat);
                usersRef.set("true");
            }

            var empNameArr;
            empNameArr = [];

            for (var i = 0; i < empIdArr.length; i++) {
                var userRef = firebase.database().ref('users/' + empIdArr[i]);
                userRef.once('value', function (snapshot) {
                    empNameArr.push(snapshot.val().emp_name);
                }).then(function () {
                    /* Chats 설정 - 만들어진 채팅방 초기 설정*/
                    var date = new Date();
                    var timestamp = date.getTime();
                    var chatsRef = firebase.database().ref('chats/' + chat);
                    chatsRef.update({
                        title: empNameArr.toString(),
                        timestamp: timestamp
                    }).then(function () {
                        $('#userKey').val(chat);
                        $('#frmMessenger').submit();
                    });
                });
            }

            /* Members 설정 - 해당 채팅방에 사용자 정보 */
            for (var i = 0; i < empIdArr.length; i++) {
                var membersRef = firebase.database().ref('members/' + chat + '/' + empIdArr[i]);
                membersRef.set({
                    count: 0,
                    state: "true"
                });
            }

            /*loadChats(keyList);
            changeContent(chat);*/
        }

        function changeContent(chatKey) {
            loadMemberListByChatKey(chatKey);
            var chatsRef = firebase.database().ref('chats/' + chatKey);
            chatsRef.once('value', function (snapshot) {
                var title = snapshot.val().title;
                var titleArr = title;
                if (title.indexOf(",") > 0) {
                    titleArr = title.split(",");
                }

                var memberCnt = titleArr.length
                var titleStr = titleArr.toString();
                $('#memberTitle').val(titleStr);

                if(titleStr.length > 20) {
                    titleStr = titleStr.substring(0, 20) + "..."
                }
                titleStr += "(" + memberCnt + ")";

                $('#chatTitle').html(titleStr);
            });

            $('#messenger-main-container').html("").load('messengerChat.do', {chatKey: chatKey});
            $('#sidebar-button').show().attr('name', 'hide-nav');

            $('#chatsList').find('a').attr("class", "w3-button w3-block w3-white w3-left-align");
            $('#' + chatKey).attr("class", "w3-button w3-block w3-white w3-left-align w3-light-grey");
        }

        function findUser() {
            var input, filter, userProfile, ul, li;
            input = document.getElementById("userSearch");
            filter = input.value.toUpperCase();
            userProfile = document.getElementById("userProfile");
            ul = userProfile.getElementsByTagName("ul");

            for (var i = 0; i < ul.length; i++) {
                li = ul[i].getElementsByTagName("li");
                for (var j = 0; j < li.length; j++) {
                    if (li[j]) {
                        if (li[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                            li[j].style.display = "";
                        } else {
                            li[j].style.display = "none";
                        }
                    }
                }
            }
        }
    </script>

    <%-- firebase init --%>
    <script src="https://www.gstatic.com/firebasejs/4.8.0/firebase.js"></script>
    <script src="<c:url value="/resources/js/pagejs/firebase_init.js"/>"></script>

    <%-- firebase 채팅목록 처리 script--%>
    <script>
        /* keyList 배열에 사용자의 채팅방 리스트를 담는 함수*/
        var keyList = [];
        function loadKeyListByUserId(userId) {
            $('#chatsList').html("");
            var usersRef = firebase.database().ref('users/' + userId + "/chatlist");
            /*usersRef.once('value', function (snapshot) {
                snapshot.forEach(function (childSnapshot) {
                    var childKey = childSnapshot.key;
                    keyList.push(childKey);
                    appendMessages(childKey);
                });
            }).then(function () { //불러오기 끝난후 실행
                loadChats(keyList);
            });*/


            usersRef.on('child_added', function(data) {
                var addKey = [];
                addKey.push(data.key);
                setTimeout(function () {
                    loadChats(addKey);
                    appendMessages(data.key);
                },1000);

                /*처음 실행시 안읽은 메시지 표시*/
                setTimeout(function () {
                    var membersRef = firebase.database().ref('members/' + addKey + "/" + userId);
                    membersRef.once('value', function (snapshot) {
                        var parentKey = snapshot.ref.parent.key;
                        if (snapshot.val().count == 0) {
                            $('#' + parentKey + 'Count').html('');
                        } else {
                            $('#' + parentKey + 'Count').html(snapshot.val().count);
                        }
                    });

                    /* 채팅이 추가될때마다 안읽은 메시지 표시 */
                    membersRef.on('child_changed', function (snapshot) {
                        var parentKey = snapshot.ref.parent.parent.key;
                        if (snapshot.val() == 0) {
                            $('#' + parentKey + 'Count').html('');
                        } else {
                            $('#' + parentKey + 'Count').html(snapshot.val());
                        }
                    });
                },2000)
            });
        }

        var memberList = [];
        function loadMemberListByChatKey(chatKey) {
            memberList = [];
            var membersRef = firebase.database().ref('members/' + chatKey);
            membersRef.once('value', function (snapshot) {
                snapshot.forEach(function (childSnapshot) {
                    memberList.push(childSnapshot.key);
                });
            }).then(function () {
                for(var i = 0; i < memberList.length; i++) {
                    var usersRef = firebase.database().ref('users/' + memberList[i]);
                    usersRef.once('value', function (snapshot) {
                        console.log
                        var empNo = snapshot.key;
                        var empImg = snapshot.val().emp_img;
                        var empName = snapshot.val().emp_name;
                        var empPosition = snapshot.val().emp_position;

                        var onclickStr = 'onclick="changeNameCard(\'' + empNo + '\')"';
                        var userImg = "<c:url value='/emp_images/"+empImg+"'/>";
                        if(empImg == null) {
                            userImg = "<c:url value='/emp_images/defaultImg.png'/>";
                        }
                        $('#memberList').append(
                            '<li class="w3-bar w3-button w3-left-align" '+ onclickStr +'>' +
                            '<img src="' + userImg + '" class="w3-circle" style="width:50px; height: 50px; margin-right: 50px">' +
                            '<span class="w3-large">' + empName + " " + empPosition +
                            '</span>'+
                            '<span>(' + empNo + ')</span>' +
                            '</li>'
                        );
                    })

                }
            });
        }

        function resetUnreadCount() {
            var name, count;
            var membersRef = firebase.database().ref('members/' + chatKey + "/" + userId);
            membersRef.once('value', function (snapshot) {
                count = snapshot.val().count;
            }).then(function () {
                membersRef.set({
                    count: 0,
                    state: "true"
                })
            });
        }


        function formatDate(curDate) {
            var today, resultDate;
            today = new Date();
            resultDate = new Date(curDate);
            timegap = (today - resultDate) / (60 * 60 * 1000);

            var curYear = resultDate.getFullYear();
            var curMonth = (resultDate.getMonth() + 1);
            var curDay = resultDate.getDate();
            var curHours = resultDate.getHours();
            var curMin = resultDate.getMinutes();
            if (curMin < 10) {
                curMin = "0" + curMin;
            }

            if (timegap <= 24) {
                resultDate = curHours + ":" + curMin
            }
            else {
                resultDate = curYear + '-' + curMonth + '-' + curDay;
            }
            return resultDate;
        }

        /* 가져온 채팅방 리스트를 왼쪽 사이드네비에 뿌려주는 함수 */
        function loadChats(reckeyList) {
            for (var i = 0; i < reckeyList.length; i++) {
                var chatsRef = firebase.database().ref('chats/' + reckeyList[i]);
                chatsRef.once('value', function (snapshot) {
                    var title = snapshot.val().title;
                    var lastMessage = snapshot.val().lastMessage;
                    if (snapshot.val().lastMessage == undefined) {
                        lastMessage = "";
                    }

                    var timestamp = snapshot.val().timestamp;

                    var resultDate = formatDate(timestamp);

                    var titleArr = title;
                    if (title.indexOf(",") > 0) {
                        titleArr = title.split(",");
                    }

                    var memberCnt = titleArr.length
                    titleArr.splice(titleArr.indexOf('${sessionScope.empVo.empName}'), 1);

                    var titleStr = "";
                    for(var i  = 0; i < titleArr.length; i++) {
                        if(i == titleArr.length - 1) {
                            titleStr += titleArr[i];
                        } else {
                            titleStr += titleArr[i] + ",";
                        }
                    }

                    if(titleStr.length > 10) {
                        titleStr = titleStr.substring(0, 10) + "..." + "(" + memberCnt + ")";
                    }


                    var onclickStr = 'onclick="changeContent(\'' + snapshot.key + '\')"';
                    var userImg = "<c:url value='/emp_images/defaultImg.png'/>";
                    $('#chatsList').append(
                        '<a class="w3-button w3-block w3-white w3-left-align" id="' + snapshot.key + '" style="padding: 5px"' + onclickStr + '>' +
                        '<img src="' + userImg + '" class="w3-bar-item w3-circle" style="width:85px; float: left;">' +
                        '<div class="w3-bar-item">' +
                        '<div class="w3-large w3-left">' + titleStr + '</div>' +
                        '<div class="w3-right w3-small">' + resultDate + '</div>' +
                        '<br>' +
                        '<div class="w3-left w3-small">' + lastMessage + '</div>' +
                        '<div>' +
                        '<div class="w3-badge w3-red w3-right w3-small" id="' + snapshot.key + 'Count"></div>' +
                        '</div>' +
                        '</div>' +
                        '</a>'
                    );
                })
            }
        }

        <%-- firebase 채팅처리 script--%>
        function loadMessages(chatKey) {
            var messeagesRef = firebase.database().ref('messages/' + chatKey);
            messeagesRef.once('value', function (snapshot) {
                snapshot.forEach(function (data) {
                    showMessage(data)
                });
            }).then(function () {
                $('#messenger-main').scrollTop(10000);
            });
        }

        function showMessage(data) {
            var timestamp = data.val().timestamp;
            var resultDate = formatDate(timestamp);

            //TODO : userImg DB에서 가져온 사용자 이미지로 변경

            var img;
            if (data.val().img == "") {
                img = "<c:url value='/emp_images/defaultImg.png'/>";
            } else {
                img = "<c:url value='/emp_images/" + data.val().img +"'/>";
            }
            var message = data.val().message;
            var name = data.val().name;

            if (userName == data.val().name) {
                $('#messengerContainer').append(
                    '<div class="message-wrap darker">' +
                    '<p>' + message + '</p>' +
                    '<span class="time-left w3-small">' + resultDate + '</span>'
                )
            } else {
                $('#messengerContainer').append(
                    '<div class="message-wrap">' +
                    '<img src="' + img + '" alt="Avatar" style="width:100%;">' +
                    '<div><b>' + name + '</b></div>' +
                    '<p>' + message + '</p>' +
                    '<span class="time-right w3-small">' + resultDate + '</span>' +
                    '</div>'
                );
            }

            //채팅 입력시 스크롤 맨 아래로
            $('#messenger-main').scrollTop(9999);
        }

        function appendMessages(chatKey) {
            /* key에 해당하는 채팅방의 메시지를 가져와 화면에 뿌려줌*/
            var messeagesRef = firebase.database().ref('messages/' + chatKey);
            //Messages Child가 추가될때 마다 실행
            messeagesRef.on('child_added', function (data) {
                showMessage(data);
            });
        }


        /* 마지막 채팅 변경 함수 */
        function changeLastChats() {
            var date = new Date();
            var timestamp = date.getTime();
            var lastMessage = $('#chatMsg').val();
            var userImg = "<c:url value='/emp_images/defaultImg.png'/>";
            var title = $('#memberTitle').val();
            var chatsRef = firebase.database().ref('chats/' + chatKey);
            chatsRef.update({
                lastMessage: lastMessage,
                timestamp: timestamp
            });

            chatsRef.on('value', function (snapshot) {
                console.log(snapshot.val());


                var titleArr = snapshot.val().title;
                if (title.indexOf(",") > 0) {
                    titleArr = title.split(",");
                }

                var memberCnt = titleArr.length
                titleArr.splice(titleArr.indexOf('${sessionScope.empVo.empName}'), 1);

                var titleStr = "";
                for(var i  = 0; i < titleArr.length; i++) {
                    if(i == titleArr.length - 1) {
                        titleStr += titleArr[i];
                    } else {
                        titleStr += titleArr[i] + ",";
                    }
                }

                if(titleStr.length > 10) {
                    titleStr = titleStr.substring(0, 10) + "..." + "(" + memberCnt + ")";
                }

                var resultDate = formatDate(timestamp);
                $('#' + chatKey).html(
                    '<img src="' + userImg + '" class="w3-bar-item w3-circle" style="width:85px; float: left;">' +
                    '<div class="w3-bar-item">' +
                    '<div class="w3-large w3-left">' + titleStr + '</div>' +
                    '<div class="w3-right w3-small">' + resultDate + '</div>' +
                    '<br>' +
                    '<div class="w3-left w3-small">' + lastMessage + '</div>' +
                    '<div>' +
                    '<div class="w3-badge w3-red w3-right w3-small" id="' + chatKey + 'Count"></div>' +
                    '</div>' +
                    '</div>'
                )
            });
        }


        /* firebase DB에 채팅 메시지를 push */
        function writeMessage() {
            var date = new Date();
            var timestamp = date.getTime();

            message = $("#chatMsg").val();
            firebase.database().ref('messages/' + chatKey).push({
                name: userName,
                message: message,
                timestamp: timestamp,
                img: userImg
            });

            changeLastChats();
            updateUnreadCount(memberList);
            resetUnreadCount();
        }

        function updateUnreadCount(memberList) {
            var membersRef = firebase.database().ref('members/' + chatKey);
            membersRef.once('value', function (snapshot) {
                var i = 0;
                snapshot.forEach(function (data) {
                    if (memberList[i] != userId) {
                        firebase.database().ref('members/' + chatKey + "/" + memberList[i]).update({
                            count: data.val().count + 1
                        });
                    }
                    i++;
                })
            });
        }
    </script>


    <%-- 화면 크기조절 script --%>
    <script>
        $(document).ready(function () {
            $('#sidebar-button').hide(); //우측 버튼 숨김
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
        <h3 class="w3-wide">
            <b>
                <a href="<c:url value='/messenger/messenger.do'/>">
                    <img src="<c:url value='/resources/images/logo.png'/> " width="300px"/>
                </a>
            </b>
        </h3>
    </div>
    <div class="w3-large w3-text-grey" style="font-weight:bold">
        <button id="startChatButton" class="w3-button w3-indigo w3-hover-black" onclick="loadOrganization('0')">대화 추가
        </button>
        <ul class="w3-hoverable" id="chatsList">
            <%--로그인한 user의 채팅방 목록을 여기다 뿌려줌--%>
        </ul>
    </div>
</nav>ss

<form id="frmMessenger" name="frmMessenger" method="post" action="<c:url value='/messenger/messenger.do'/>">
    <input type="text" value="${userKey}" id="userKey" name="userKey">
</form>

<!-- Header -->
<div class="messenger-header w3-card">
    <header class="w3-container w3-xlarge">
        <input type="hidden" value="${sessionScope.empVo.empNo}" id="sessionId">
        <input type="hidden" value="${sessionScope.empVo.empName}" id="sessionName">
        <input type="hidden" value="${sessionScope.empVo.empImg}" id="sessionImg">
        <p class="w3-left w3-bar-item w3-padding-24" id="chatTitle"></p>
        <input type="hidden" id="memberTitle" value="">
        <p class="w3-right">
            <a href="#" class="w3-bar-item w3-button w3-padding-24 w3-right" name="hide-nav" id="sidebar-button">
                <i class="fa fa-bars"></i>
            </a>
        </p>
    </header>
</div>

<!-- Main -->
<div id="messenger-main-container">
    <%--선택한 채팅방의 채팅 내용을 여기다 뿌려줌--%>
</div>
</body>
</html>