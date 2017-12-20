<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../common/common.jsp" %>
<!-- Main -->
<div class="w3-main" style="margin-left:400px">
    <!-- 채팅창 -->
    <div class="messenger-start-container">
        <div id="searchBar">
            <input type="text" class="w3-left" id="userSearch" placeholder="Search for names.."
                   title="Type in a name" id="nameTokenField">

            <input type="text" class="form-control" id="tokenfield" value="red,green,blue" />
            <button class="w3-button w3-indigo start-button" onclick="chatStart()">시작하기</button>
        </div>

        <c:forEach var="deptVo" items="${deptList}">
            <h5 class="w3-light-grey">${deptVo.deptName }</h5>
            <ul class="w3-ul">
                <c:forEach var="empVo" items="${empList }">
                    <c:if test="${empVo.deptNo == deptVo.deptNo }">
                        <label for="check-${empVo.empNo}">
                            <li class="w3-bar w3-button">
                                <input class="bar-item w3-button w3-white w3-small w3-right w3-margin w3-check"
                                       type="checkbox"
                                       id="check-${empVo.empNo}">
                                <img src="<c:url value='/resources/images/avatar.png'/>"
                                     class="w3-bar-item w3-circle w3-hide-small"
                                     style="width:85px">
                                <div class="w3-bar-item">
                                    <span class="w3-large">${empVo.empName } ${empVo.empPosition }</span><br>
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
