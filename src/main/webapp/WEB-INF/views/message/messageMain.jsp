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
        <button class="message-button w3-btn"
                onclick="window.open('<c:url
                        value="/message/messageWrite.do"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no')">
            쪽지 작성
        </button>
    </div>
    <ul>
        <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
        <li><a href="<c:url value='/message/messageReceive.do'/> "><i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;<span>받은 쪽지함</span></a>
        </li>
        <li><a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;<span>보낸 쪽지함</span></a></li>
        <li><a href="#"><i class="fa fa-star-o " aria-hidden="true"></i>&nbsp;<span>중요 쪽지함</span></a></li>
        <li><a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;<span>휴지통</span></a></li>
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
    <div class="w3-row-padding w3-margin-bottom w3-center" style="width: 80%; margin-left: 10%">
        <div class="w3-quarter">
            <div class="w3-container w3-red w3-padding-16">
                <div class="w3-left"><i class="fa fa-envelope-o w3-xxxlarge w3-text-white" aria-hidden="true"></i></div>
                <div class="w3-right">
                    <h3 class="w3-text-white">52</h3>
                </div>
                <div class="w3-clear"></div>
                <h4 class="w3-text-white">받은 쪽지함</h4>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-blue w3-padding-16">
                <div class="w3-left"><i class="fa fa-envelope-o w3-xxxlarge w3-text-white" aria-hidden="true"></i></div>
                <div class="w3-right">
                    <h3 class="w3-text-white">52</h3>
                </div>
                <div class="w3-clear"></div>
                <h4 class="w3-text-white">보낸 쪽지함</h4>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-teal w3-padding-16">
                <div class="w3-left"><i class="fa fa-star-o w3-xxxlarge w3-text-white" aria-hidden="true"></i></div>
                <div class="w3-right">
                    <h3 class="w3-text-white">52</h3>
                </div>
                <div class="w3-clear"></div>
                <h4 class="w3-text-white">중요 쪽지함</h4>
            </div>
        </div>

        <div class="w3-quarter">
            <div class="w3-container w3-grey w3-padding-16">
                <div class="w3-left"><i class="fa fa-trash-o w3-xxxlarge w3-text-white" aria-hidden="true"></i></div>
                <div class="w3-right">
                    <h3 class="w3-text-white">52</h3>
                </div>
                <div class="w3-clear"></div>
                <h4 class="w3-text-white">휴지통</h4>
            </div>
        </div>
    </div>

    <div class="w3-container w3-margin">
        <div class="w3-half w3-padding">
            <h5><b>받은 쪽지함</b><a href="#" class="w3-right w3-small w3-padding">>></a></h5>
            <table class="w3-table-all w3-hoverable">
                <thead>
                <tr class="w3-red">
                    <th style="width: 20%; min-width: 95px;" class="w3-center w3-text-white">보낸 사람</th>
                    <th style="width: 60%" class="w3-center w3-text-white">제목</th>
                    <th style="width: 20%; min-width: 128px" class="w3-center w3-text-white">날짜</th>
                </tr>
                </thead>
                <tr>
                    <td>Smith</td>
                    <td>title1</td>
                    <td class="w3-right-align">2017-12-26</td>
                </tr>
                <tr>
                    <td>Smith</td>
                    <td>title1</td>
                    <td class="w3-right-align">2017-12-26</td>
                </tr>
                <tr>
                    <td>Smith</td>
                    <td>title1</td>
                    <td class="w3-right-align">2017-12-26</td>
                </tr>
            </table>
        </div>
        <div class="w3-half w3-padding">
            <h5><b>보낸 쪽지함</b><a href="#" class="w3-right w3-small w3-padding">>></a></h5>
            <table class="w3-table-all w3-hoverable">
                <thead>
                <tr class="w3-blue">
                    <th style="width: 20%; min-width: 95px;" class="w3-center w3-text-white">받는 사람</th>
                    <th style="width: 60%" class="w3-center w3-text-white">제목</th>
                    <th style="width: 20%; min-width: 128px" class="w3-center w3-text-white">날짜</th>
                </tr>
                </thead>
                <tr>
                    <td>Smith</td>
                    <td>title1</td>
                    <td class="w3-right-align">2017-12-26</td>
                </tr>
                <tr>
                    <td>Smith</td>
                    <td>title1</td>
                    <td class="w3-right-align">2017-12-26</td>
                </tr>
                <tr>
                    <td>Smith</td>
                    <td>title1</td>
                    <td class="w3-right-align">2017-12-26</td>
                </tr>
            </table>
        </div>
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