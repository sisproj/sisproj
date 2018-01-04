<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/bootstrap-tokenfield.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/tokenfield-typeahead.css'/>">
    <script src="<c:url value='/resources/js/bootstrap/bootstrap-tokenfield.js'/>"></script>
    <style>
        .message-label {
            width: 100px;
            height: 34px;
            padding: 4px;
        }

        .message-input {
            height: 34px;
        }

        .message-text {
            width: 100%;
            height: 100%;
        }

        .tokenfield {
            width: 100%;
            float: left;
            /*border: 1px solid #ccc !important;*/
            overflow-y: auto;
            max-height: 34px;
        }

        .tokenfield .token {
            margin: 5px;
        }

        .tokenfield .token-input {
            display: none;
        }

        .close {
            display: none !important;
        }
    </style>
</head>
<body>
<div class="w3-container" id="writeContainer">
    <form id="detailfrm" name="detailfrm" action="messageReply.do" method="POST">
        <div class="w3-row w3-section" style="height: 34px">
            <div class="w3-col message-label"><b>보낸 사람</b></div>
            <div class="w3-rest">
                <div class="w3-bar">
                    <%--<input class="w3-bar-item w3-border w3-left message-input" style="width: 80%" type="text">--%>
                    <input type="text" id="tokenField" value="${messageVO.empName}(${messageVO.sendempNo})"
                           readonly="readonly">
                </div>
            </div>
        </div>
        <div class="w3-row w3-section" style="height: 34px">
            <div class="w3-col message-label"><b>제목</b></div>
            <div class="w3-rest">
                <div class="w3-bar">
                    <div class="w3-border-0 w3-left" style="width: 100%; padding: 4px">
                        ${messageVO.msgTitle}
                    </div>
                </div>
            </div>
        </div>
        <div class="w3-row w3-section" style="height: 60%">
            <textarea class="message-text" name="msgContent" id="msgContent" style="resize: none; padding:8px;"
                      readonly="readonly">${messageVO.msgContent}</textarea>
        </div>
        <div class="w3-row w3-section" style="height: 35px">
            <div class="w3-right">
                <button type="button" class="w3-button w3-blue w3-small" id="replyButton"
                        onclick="window.open('<c:url value="/message/reply.do?sendempNo=${messageVO.sendempNo}"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no')">
                    답장
                </button>
                &nbsp;
                <button type="button" class="w3-button w3-blue w3-small" onclick="window.close()">닫기</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#tokenField').tokenfield();
        if ("${sessionScope.empVo.empNo}" != "${messageVO.empNo}") {
            alert("잘못된 경로입니다.");
            window.close();
        }
    })
</script>
</body>
</html>