<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page session="false" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>

    <!-- font icon, FA -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/loginStyle.css"/>">
    <!-- jquery-ui css -->
    <link rel="stylesheet" href="<c:url value="/resources/jquery-ui/jquery-ui.min.css"/>">

    <!-- jquery -->
    <script src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/jquery/jquery.easing.1.3.js"/>"></script>
    <!-- jquery-ui -->
    <script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/>"></script>

    <!-- loginjs -->
    <script src="<c:url value="/resources/js/login.js"/>"></script>
</head>
<body>
<img id="plain" src="<c:url value="/resources/images/airplain.png"/>" alt="비행기">
<div id="logo">
    <img src="<c:url value="/resources/images/logo_w.png"/>" alt="로고이미지">
</div>
<div id="login">
    <form action="index.html" method="post" name="loginfrm" id="loginfrm">
        <div id="forminfo">로그인</div>
        <div class="forminp">
            <label for="userid">아이디</label><input type="text" name="userid" id="userid">
        </div>
        <div class="forminp">
            <label for="pwd">비밀번호</label><input type="password" name="pwd" id="pwd">
        </div>
        <div id="saveid"><input type="checkbox" name="saveinfo" id="saveinfo"> <label for="saveinfo">아이디 저장</label>
        </div>
        <div id="errormsg"></div>
        <div class="forminp"><input type="submit" id="loginbtn" value="로그인"></div>
    </form>
</div>
</body>
</html>