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

    $(document).ready(function () {
        $('#divEmp').hide();
    });

    function changeNameCard(clickEmpNo) {

        var empNo = "empNo=" + clickEmpNo;
        $.ajax({
            url:"<c:url value='/organization/empInfo.do'/>",
            data:empNo,
            dataType:"json",
            type:"get",
            success:function(res){
                $('#divEmp').show();
                var dept=res.deptName+"팀 "+res.posName;
                var info=res.empName+" ("+res.empNo+")";
                var userImg = "<c:url value='/emp_images/"+res.empImg+"'/>";
                if(res.empImg == null){
                    userImg = "<c:url value='/emp_images/defaultImg.png'/>";
                }

                $('#cardImg').attr("src", userImg);
                $('#cardEmp').html(dept);
                $('#cardName').html(info);
                $('#cardTel i').html(" "+res.empTel);
                $('#cardEmail i').html(" "+res.empEmail);

                var writeUrl = "<c:url value='/message/reply.do?sendempNo='/>" + res.empNo;
                var openUrl = "window.open('"+ writeUrl +"', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no')";
                $('#msgWrite').attr("onclick", openUrl);
                $('#messengerOpen').attr("onclick", "messengerOpen(" + ${sessionScope.empVo.empNo} +","+  empNo + ")");
            },
            error:function(xhr, status, error){
                alert("에러 : "+status+"=>"+error);
            }
        });
    }

    function messengerOpen(sendEmpNo, recEmpNo) {
        var empNoArr = [];
        empNoArr.push(sendEmpNo);
        empNoArr.push(recEmpNo);
        empNoArr.sort();

        var chatKey = "chat";
        for(var i = 0; i < empNoArr.length; i++) {
            var empNo = empNoArr[i] + "";
            empNo = empNo.substring(4, 8);
            chatKey += empNo;
        }

        $('#userKey').val(chatKey);
        window.open("", 'messengerWindow', 'width=1100,height=640,toolbar=no,scrollbars=yes');

        $('#frmMessenger').submit();
    }

    function hideCard() {
        $('#divEmp').hide();
    }
</script>
<style>
    .emp-info {
        position: fixed;
        bottom: 0;
        width: 368px;
        padding: 16px;
        box-shadow: 2px 2px 3px grey;
    }

    .emp-item div{
        margin: 3px;
    }


</style>

<!-- 오른쪽 SideMenu -->
<div id="messengerSideNav" class="sidenav w3-white">
    <div id="divEmp" class="w3-margin w3-leftbar w3-border-blue w3-pale-blue emp-info">
        <div class="w3-bar">
            <div class="w3-right-align"><a href="#" onclick="hideCard();">X</a></div>
            <div class="w3-bar-item">
                <%--<img src="<c:url value='/emp_images/${empVo.empImg}'/>"--%>
                <img src="<c:url value='/emp_images/defaultImg.png'/>"
                     id="cardImg"
                     style="width:80px; height: 80px;">
            </div>
            <div class="w3-bar-item emp-item">
                <div id="cardEmp">부서/직급</div>
                <div id="cardName">이름</div>
                <div id="cardTel"><i class="fa fa-phone"></i></div>
                <div id="cardEmail"><a href="#" title="이메일 보내기"><i class="fa fa-envelope-o"></i></a></div>
            </div>
        </div>
        <hr style="background-color: blue; height: 1px">
        <div class="w3-center"><a id="msgWrite" href="#" title="쪽지보내기"><i class="fa fa-paper-plane"></i> 쪽지 보내기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a id="messengerOpen" href="#" title="대화하기"><i class="fa fa-comments-o"></i> 1:1 대화하기</a></div>
        <form id="frmMessenger" name="frmMessenger" method="post" action="<c:url value='/messenger/messenger.do'/>"
              target="messengerWindow">
            <input type="hidden" value="${userKey}" id="userKey" name="userKey">
        </form>
    </div>

    <div class="w3-white w3-margin">
        <div class="w3-light-grey">
            <ul class="w3-ul" id="memberList">
                <h4 class="w3-blue w3-padding" style="padding-left: 5px; text-shadow:1px 1px 0 #444">채팅 참여자 목록</h4>
                <%--<li class="w3-bar w3-button">
                    <img src="<c:url value='/emp_images/${empVo.empImg}'/>"
                         class="w3-circle"
                         style="width:50px; height: 50px; margin-right: 50px">
                    <span class="w3-large">${empVo.empName } ${empVo.posName }</span>
                    <span>(${empVo.empNo })</span>
                </li>--%>
            </ul>
        </div>
    </div>
</div>

<!-- Main -->
<div class="w3-main" id="messenger-main" style="margin-left:400px">
    <!-- 채팅창 -->
    <div class="messenger-container" id="messengerContainer">
    </div>
    <!-- 채팅 입력창-->
    <div class="messenger-enter-container" id="enter-container">
        <div class="messenger-enter-bar w3-card">
            <div class="messenger-enter">
                <textarea class="messenger-textarea" rows="1" id="chatMsg"></textarea>
                <button onclick="writeMessage()"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
</div>
