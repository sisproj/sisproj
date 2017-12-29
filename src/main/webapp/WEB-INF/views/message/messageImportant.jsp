<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    .message-button {
        margin: 30px;
        width: 70%;
        height: 50px;
        background-color: #036;
        color: white;
    }
</style>
<nav>
    <div style="width: 298px; text-align: center">
        <button class="message-button w3-btn" onclick="window.open('<c:url
                value="/message/messageWrite.do"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no')">
            쪽지 작성
        </button>
    </div>
    <ul>
        <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
        <li class="active"><a href="#"><i class="fa fa-floppy-o"></i>&nbsp;<span>받은 쪽지함</span></a></li>
        <li><a href="#"><i class="fa fa-hdd-o"></i>&nbsp;<span>보낸 쪽지함</span></a></li>
    </ul>
    <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
    <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
</nav>
</aside>
<!-- 왼쪽 사이드 메뉴 끝 -->
<article id="headsection">
    <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
    <h1>
        <i class="fa fa-book" aria-hidden="true"></i>
        &nbsp;쪽지함&nbsp;
        <a href="#">
            <i class="fa fa-bookmark bookmark" aria-hidden="true"></i>
        </a>
    </h1>
    <!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
    <!-- 3. 내용 -->
    <div class="w3-container w3-margin">
        <h5><b>받은 쪽지함</b><a href="#" class="w3-right w3-small w3-padding">>></a></h5>
        <table class="w3-table-all w3-hoverable">
            <thead>
            <tr class="w3-light-grey">
                <th><input type="checkbox" title="selectAllMessages"></th>
                <th style="width: 20%">보낸 사람</th>
                <th style="width: 60%">제목</th>
                <th style="width: 25%">날짜</th>
            </tr>
            </thead>
            <tr>
                <td><input type="checkbox"></td>
                <td>Smith</td>
                <td>title1</td>
                <td>2017-12-26</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>Smith</td>
                <td>title1</td>
                <td>2017-12-26</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>Smith</td>
                <td>title1</td>
                <td>2017-12-26</td>
            </tr>
        </table>
    </div>
    <!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
    $(function () {
//        $('header nav ul li:nth-child(1) a').addClass('active');
    });
</script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>