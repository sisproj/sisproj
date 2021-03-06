<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/w3/w3.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/bootstrap-tokenfield.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap/tokenfield-typeahead.css'/>">
    <script src="<c:url value='/resources/js/bootstrap/bootstrap-tokenfield.js'/>"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tokenField').tokenfield().on('tokenfield:removedtoken', function (e) {
                var replaceEmpId;
                var checkedTotal = $('input[name=empCheck]:checked').length;
                $('input[name=empCheck]:checked').each(function (index) {
                    if ($(this).val() == e.attrs.value) {
                        $(this).prop("checked", false);
                        var empId = $(this).val().substring($(this).val().indexOf("(") + 1, $(this).val().indexOf(")"));
                        if (index < 1 && checkedTotal == 1) {
                            replaceEmpId = $('#choiceEmpId').val().replace(empId, "");
                        } else if (index < 1 && checkedTotal > 1) {
                            replaceEmpId = $('#choiceEmpId').val().replace(empId + ",", "");
                        } else {
                            replaceEmpId = $('#choiceEmpId').val().replace("," + empId, "");
                        }
                        $('#choiceEmpId').val(replaceEmpId);
                    }
                })
            });

            $('input[name=empCheck]').click(function () {
                var choiceResult = "";
                var choiceEmpId = "";

                var checkedTotal = $('input[name=empCheck]:checked').length;
                $('input[name=empCheck]:checked').each(function (index) {
                    if (index === checkedTotal - 1) {
                        choiceResult += $(this).val();
                        choiceEmpId += $(this).val().substring($(this).val().indexOf("(") + 1, $(this).val().indexOf(")"));
                    } else {
                        choiceResult += $(this).val() + ",";
                        choiceEmpId += $(this).val().substring($(this).val().indexOf("(") + 1, $(this).val().indexOf(")")) + ",";
                    }

                });

                if (choiceResult === "") {
                    $('#tokenField').tokenfield('setTokens', ' ');
                    $('#chatStartButton').attr("disabled", true);
                } else {
                    $('#tokenField').tokenfield('setTokens', choiceResult);
                    $('#chatStartButton').attr("disabled", false);
                }
                $('#choiceEmpId').val(choiceEmpId);

                $(".tokenfield").scrollTop(10000);
            });

            $('.tokenfield').click(function () {
                openRightMenu();
            })

            $('#writeContainer').click(function (e) {
                if (!$(e.target).is($('.tokenfield')) && !$(e.target).is($('#openRightButton'))) {
                    closeRightMenu();
                } else {
                    return false;
                }
            });

            $('#submitButton').click(function () {
                var form = $('#writefrm');
                $.ajax({
                    type: "post",
                    url: form.attr('action'),
                    data: form.serialize(),
                    success: function () {
                        window.close();
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            })
        });

        function openRightMenu() {
            document.getElementById("rightMenu").style.display = "block";
        }

        function closeRightMenu() {
            document.getElementById("rightMenu").style.display = "none";
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
            width: 80%;
            float: left;
            overflow-y: auto;
            max-height: 34px;
        }

        .tokenfield .token {
            margin: 5px;
        }

        .tokenfield .token-input {
            display: none;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="w3-container" id="writeContainer">
    <form id="writefrm" name="writefrm" action="<c:url value='/message/write.do'/>" method="POST">
        <div class="w3-row w3-section" style="height: 34px">
            <div class="w3-rest">
                <div class="w3-bar">
                    <div class="w3-col message-label">받는 사람</div>
                    <div class="w3-rest">
                        <div class="w3-bar">
                            <input type="hidden" id="sendempNo" name="sendempNo" value="${sessionScope.empVo.empNo}">
                            <input type="hidden" id="choiceEmpId" name="choiceEmpId" value="${employeeVO.empNo}">
                            <%--<input class="w3-bar-item w3-border w3-left message-input" style="width: 80%" type="text">--%>
                            <input type="text" id="tokenField" value="${employeeVO.empName}(${employeeVO.empNo})"
                                   readonly="readonly">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="w3-row w3-section" style="height: 34px">
            <div class="w3-col message-label">제목</div>
            <div class="w3-rest">
                <div class="w3-bar">
                    <input class="w3-bar-item w3-border w3-left message-input"
                           name="msgTitle" id="msgTitle"
                           style="width: 100%" type="text">
                </div>
            </div>
        </div>
        <div class="w3-row w3-section" style="height: 60%">
            <textarea class="message-text" name="msgContent" id="msgContent" style="resize: none;"></textarea>
        </div>
        <div class="w3-row w3-section" style="height: 35px">
            <%--<input type="button" class="w3-button w3-blue w3-left w3-small" id="submitButton" value="보내기">--%>
            <button type="button" class="w3-button w3-blue w3-left w3-small" id="submitButton">보내기</button>
        </div>
    </form>
</div>
</body>
</html>