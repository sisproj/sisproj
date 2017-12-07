<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Message</title>
    <!-- font icon, FA -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mainStyle.css"/>">

    <!-- jquery-ui css -->
    <link rel="stylesheet" href="<c:url value="/resources/jquery-ui/jquery-ui.min.css"/>">

    <!-- jquery -->
    <script src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/jquery/jquery.easing.1.3.js"/>"></script>
    <!-- jquery-ui -->
    <script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/>"></script>

    <script>
        $(function () {
            <c:if test="${!empty msg}">
            $("#dialog-confirm").dialog({
                resizable: false,
                height: "auto",
                width: 400,
                modal: true,
                buttons: {
                    //확인 부분 (버튼 글씨도 변경 가능)
                    "확인": function () {
                        location.href = "<c:url value='${url}'/>";
                    }
                }
            });
            </c:if>
        });
    </script>
</head>
<body>
<div id="dialog-confirm" title="message">
    <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>
        ${msg}</p>
</div>
</body>
</html>