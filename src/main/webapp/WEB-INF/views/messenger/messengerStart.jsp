<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>
<!-- Main -->
<script src="<c:url value='/resources/js/bootstrap/bootstrap-tokenfield.js'/>"></script>
<style>
    .tokenfield .token-input {
        display: none;
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
        $('#chatTitle').html("대화 하기");

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

        $('#chatStartButton').attr("disabled", true);
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
        });
    });
</script>

<div class="w3-main" style="margin-left:400px">
    <!-- 채팅창 -->
    <div class="messenger-start-container">
        <div id="searchBar">
            <input type="hidden" id="choiceEmpId" value="">
            <input type="text" id="tokenField" value="">
            <input type="text" class="w3-left" id="userSearch" placeholder="Search for names.."
                   title="Type in a name" onkeyup="findUser()">
            <button type="button" class="w3-button w3-indigo start-button" id="chatStartButton" onclick="chatStart()">대화 시작</button>
        </div>

        <div id="userProfile">
            <c:forEach var="deptVo" items="${deptList}">
                <h5 class="w3-light-grey">${deptVo.deptName }</h5>
                <ul class="w3-ul">
                    <c:forEach var="empVo" items="${empList }">
                        <c:if test="${empVo.deptNo == deptVo.deptNo and empVo.empNo != sessionScope.empVo.empNo}">
                            <label for="check-${empVo.empNo}">
                                <li class="w3-bar w3-button">
                                    <input class="bar-item w3-button w3-white w3-small w3-right w3-margin w3-check"
                                           type="checkbox"
                                           value="${empVo.empName}(${empVo.empNo})"
                                           name="empCheck"
                                           id="check-${empVo.empNo}">
                                    <c:if test="${!empty empVo.empImg}">
                                        <img src="<c:url value='/emp_images/${empVo.empImg}'/>"
                                             class="w3-bar-item w3-circle w3-hide-small"
                                             style="width:85px">
                                    </c:if>
                                    <c:if test="${empty empVo.empImg}">
                                        <img src="<c:url value='/emp_images/defaultImg.png'/>"
                                             class="w3-bar-item w3-circle w3-hide-small"
                                             style="width:85px">
                                    </c:if>
                                    <div class="w3-bar-item">
                                        <span class="w3-large">${empVo.empName } ${empVo.posName }</span><br>
                                        <span>(${empVo.empNo })</span>
                                    </div>
                                </li>
                            </label>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:forEach>
        </div>
    </div>
</div>
