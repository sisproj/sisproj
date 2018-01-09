<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    $(function () {
        $('#asidebtn ul li:nth-child(1)').click(function () {
        });
        messengerCheck();
        setInterval(function () {
            messageCheck();
        }, 10000);
    });
    function messageCheck() {
        $.ajax({
            url: "<c:url value='/message/unReadCount.do'/>",
            contentType: "application/json; charset=UTF-8",
            type: "get",
            success: function (res) {
                if (res > 0) {
                    res += '  <img src=\"<c:url value='/resources/images/new_icon.png'/>\">';
                }
                $("#unreadMsg").html(res);
            },
            error: function (xhr, status, error) {
                alert("에러 : " + status + "=>" + error);
            }
        });
    }
    function messengerCheck() {
        var membersRef = firebase.database().ref('members/');
        membersRef.on('value', function (snapshot) {
            $('#unreadMessenger').html(0);
            var count = 0;
            snapshot.forEach(function (childSnapshot) {
                childSnapshot.forEach(function (data) {
                    if (data.key == "${sessionScope.empVo.empNo}") {
                        count += parseInt(data.val().count);
                    }
                });
                $('#unreadMessenger').html(count);
            });
            if (count > 0) {
                $('#unreadMessenger').append('  <img src=\"<c:url value='/resources/images/new_icon.png'/>\">');
            }
        });
    }
</script>
<div id="photo">
    <c:if test="${empty sessionScope.empVo.empImg }">
        <img src="${pageContext.request.contextPath }/emp_images/defaultImg.png" alt="${sessionScope.empVo.empName }">
    </c:if>
    <c:if test="${!empty sessionScope.empVo.empImg }">
        <img src="${pageContext.request.contextPath }/emp_images/${sessionScope.empVo.empImg}"
             alt="${sessionScope.empVo.empName }">
    </c:if>
</div>
<div id="info">
    <ul>
        <!-- 관리자 로그인과 사원 로그인 보이는것 체인지 -->
        <c:if test="${!empty sessionScope.empVo.empNo }">
            <c:if test="${sessionScope.empVo.empLev eq ('관리자') }">
                <li><i class="fa fa-id-card"></i>&nbsp;<span
                        class="name bold">관리자 ${sessionScope.empVo.empName }님</span></li>
                <li><i class="fa fa-cog"></i>&nbsp;<span><a
                        href="<c:url value='/employee/adm/adminEmployeeList.do'/>">관리자페이지</a></span></li>
            </c:if>
            <c:if test="${sessionScope.empVo.empLev eq ('사원') || sessionScope.empVo.empLev eq ('팀장')}">
                <li><i class="fa fa-id-card"></i>&nbsp;<span class="name bold">${sessionScope.empVo.empName }</span>
                </li>
                <li><i class="fa fa-cog"></i>&nbsp;<span><a
                        href="<c:url value='/employee/employeeDetail.do?empNo=${sessionScope.empVo.empNo }'/>">마이페이지</a></span>
                </li>
            </c:if>
        </c:if>
        <li><i class="fa fa-envelope"></i>&nbsp;<span><a href="<c:url value='/message/message.do'/>">쪽지</a></span>&nbsp;<span
                class="red" id="unreadMsg">${msgUnreadCnt}</span></li>
        <li><i class="fa fa-comments"></i>&nbsp;<span>
				<a href="#" onclick="window.open('<c:url
                        value="/messenger/messenger.do"/>', 'messengerWindow', 'width=1100,height=640,toolbar=no,scrollbars=yes')">대화</a>
			</span>&nbsp;<span id="unreadMessenger"
                               class="red">0</span></li>
        <li><i class="fa fa-pencil-square-o"></i>&nbsp;<span><a
                href="<c:url value='/confirm/await.do'/>">결재대기</a></span>&nbsp;<span
                class="red">${awaitCnt }</span></li>
    </ul>
</div>
<div id="asidebtn">
    <ul>
        <c:if test="${resultIn==1}">
            <li><a href="<c:url value='/commue/commueIn.do' />">출근</a></li>
        </c:if>
        <c:if test="${resultIn==2 && resultOut==3}">
            <li><a href="<c:url value='/commue/commueOut.do' />">퇴근</a></li>
        </c:if>
        <c:if test="${resultIn==2 && resultOut==4 }">
            <li><a href="#">HOME</a></li>
        </c:if>
        <li><a href="#" onclick="window.open('<c:url
                value="/messenger/messenger.do"/>', 'messengerWindow', 'width=1100,height=640,toolbar=no,scrollbars=yes')">메신저</a>
        </li>
        <li><a href="<c:url value='/login/logout.do'/>">로그 아웃</a></li>
    </ul>
</div>