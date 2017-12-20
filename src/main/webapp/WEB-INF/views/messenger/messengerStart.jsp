<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>

<!-- Main -->
<div class="w3-main" style="margin-left:400px">
    <!-- 채팅창 -->
    <div class="messenger-start-container">
        <div id="searchBar">
            <input type="text" class="w3-left" id="userSearch" onkeyup="myFunction()" placeholder="Search for names.."
                   title="Type in a name">
            <button class="w3-button w3-indigo start-button">시작하기</button>
        </div>

        <ul class="w3-ul">
            <li class="w3-bar w3-button">
                <input class="bar-item w3-button w3-white w3-small w3-right w3-margin w3-check" type="checkbox">
                <img src="<c:url value='/resources/images/avatar.png'/>" class="w3-bar-item w3-circle w3-hide-small"
                     style="width:85px">
                <div class="w3-bar-item">
                    <span class="w3-large">Mike</span><br>
                    <span>Web Designer</span>
                </div>
            </li>

            <li class="w3-bar w3-button">
                <input class="bar-item w3-button w3-white w3-small w3-right w3-margin w3-check" type="checkbox">
                <img src="<c:url value='/resources/images/avatar.png'/>" class="w3-bar-item w3-circle w3-hide-small"
                     style="width:85px">
                <div class="w3-bar-item">
                    <span class="w3-large">Mike</span><br>
                    <span>Web Designer</span>
                </div>
            </li>

            <li class="w3-bar w3-button">
                <input class="bar-item w3-button w3-white w3-small w3-right w3-margin w3-check" type="checkbox" checked="checked">
                <img src="<c:url value='/resources/images/avatar.png'/>" class="w3-bar-item w3-circle w3-hide-small"
                     style="width:85px">
                <div class="w3-bar-item">
                    <span class="w3-large">Mike</span><br>
                    <span>Web Designer</span>
                </div>
            </li>
        </ul>
    </div>
</div>
