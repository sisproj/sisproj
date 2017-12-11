<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<style>
    .messenger-top {
        background-color: #333;
        height: 50px;
        width: 100%;
        vertical-align: middle;
        position: relative;
    }

    .messenger-top span {
        margin-top: 50px;
    }

    .messenger-top button {
        margin-top: 10px;
        margin-right: 10px;
        text-align: center;
        float: right;
    }

    .messenger-top button i {
        font-size: 25px;
        float: right;
    }

    .messenger-container {
        background-color: #3C0;
        float: left;
        height: 75%;
        width: 80%;
        position: relative;
        overflow: scroll;
        overflow-x: hidden;
    }

    .message-enter {
        background-color: #C0F;
        height: 50px;
        width: 100%;
        position: relative;
        text-align: center;
        vertical-align: middle;
        clear: both;
        float: left;
    }

    .messenger-nav {
        background-color: #09C;
        float: right;
        height: 75%;
        width: 20%;
        position: relative;
    }

    .other-msg {
        margin-left: 50px;
    }

    .my-msg {
        margin-right: 50px;
        text-align: right;
    }

    #msg {
        width: 70%;
    }

    .msg-start-btn {
        width: 248px;
        height: 50px;
        margin: 30px;
    }

</style>
<!-- 0. include부분 -->
<nav>
    <ul>
        <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
        <input type="button" class="msg-start-btn" value="대화 시작"/>
        <li><a href="#">&nbsp;<span>대화상대 이름1</span></a></li>
        <li><a href="#">&nbsp;<span>대화상대 이름2</span></a></li>
    </ul>
    <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
    <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
</nav>
</aside>
<!-- 왼쪽 사이드 메뉴 끝 -->
<article id="headsection">
    <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
    <h1><i class="fa fa-book" aria-hidden="true">
    </i>&nbsp;메신저&nbsp;<a href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
    </h1>
    <!-- 2. 페이지 이름 지정 끝 -->

</article>
<article id="bodysection">
    <!-- 3. 내용 -->
    <%-- TOP - 대화 그룹명 or 대화상대 이름--%>
    <div class="messenger-top">
        <span>대화상대 이름 테스트</span>
        <button><i class="fa fa-bars" aria-hidden="true"></i></button>
    </div>
    <%-- 채팅창 --%>
    <div class="messenger-container">
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>

        <div class="my-msg">
            채팅내용 2<br>
            <span>날짜</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            채팅내용 2<br>
            <span>날짜</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>

        <div class="my-msg">
            채팅내용 2<br>
            <span>날짜</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>
        <div class="my-msg">
            채팅내용 2<br>
            <span>날짜</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1<br>
            <span>날짜</span>
        </div>

        <div class="my-msg">
            채팅내용 2
            <span>날짜</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1
            <span>날짜</span>
        </div>
        <div class="other-msg">
            <div>상대방 프로필</div>
            채팅내용 1
            <span>날짜</span>
        </div>
        <div class="my-msg">
            채팅내용 2
            <span>날짜</span>
        </div>
    </div>


    <%--채팅 사이드메뉴--%>
    <div class="messenger-nav">


    </div>

    <%-- 채팅 입력창--%>
    <div class="message-enter">
        <input type="text" id="msg" name="msg"/>
        <input type="button" id="sendBtn" name="sendBtn" value="전송"/>
    </div>


    <!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
    $(function () {
        $('header nav ul li:nth-child(3) a').addClass('active');
    });
</script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>