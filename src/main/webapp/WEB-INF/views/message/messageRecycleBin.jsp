<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
<link rel="stylesheet" href="<c:url value='/resources/css/w3/w3.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/pagecss/message.css'/>">
<style>
    .message-button {
        margin: 30px;
        width: 70%;
        height: 50px;
        background-color: #036;
        color: white;
    }

    .readMessage {
        font-weight: normal;
    }

    .unReadMessage {
        font-weight: bold;
    }
    .hoverable:hover {
        background-color: #DCDDE3;
    }


</style>
<nav>
    <div style="width: 298px; text-align: center">
        <button class="message-button w3-btn" onclick="window.open('<c:url
                value="/message/write.do"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no')">
            쪽지 작성
        </button>
    </div>
    <ul>
        <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
        <li>
            <a href="<c:url value='/message/receive.do'/> ">
                <i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;<span>받은 쪽지함</span>
            </a>
        </li>
        <li>
            <a href="<c:url value='/message/send.do'/> ">
                <i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;<span>보낸 쪽지함</span>
            </a>
        </li>
        <li>
            <a href="<c:url value='/message/important.do'/> ">
                <i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;<span>중요 쪽지함</span>
            </a>
        </li>
        <li class="active">
            <a href="<c:url value='/message/recycleBin.do'/> ">
                <i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;<span>휴지통</span>
            </a>
        </li>
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
        <h5>
            <b class="w3-bar-item">받은 쪽지함</b>
        </h5>
        <table class="w3-table w3-bordered" style="width: 90%; margin-left: 5%">
            <thead>
            <tr class=" w3-border-bottom">
                <th style="max-width: 68px">
                    <div class="w3-button w3-light-grey">
                        <input type="checkbox" id="checkAllMessage">
                    </div>
                </th>
                <th class="w3-text-white">
                    <button class="w3-button w3-small w3-light-grey" onclick="undoMsg()">
                        <i class="fa fa-undo" aria-hidden="true"></i>
                    </button>
                    <button class="w3-button w3-small w3-light-grey" onclick="realDeleteMsg()">
                        <b><i class="fa fa-trash" aria-hidden="true"></i></b>
                    </button>
                </th>
                <th colspan="2">
                    <div class="w3-right">
                        <form name="frmSearch" method="post" action="<c:url value='/message/recycleBin.do'/>"
                              id="frmSearch">
                            <input class="w3-bar-item w3-border w3-left"
                                   style="width: 82%; height: 28px; padding: 10px;"
                                   type="text" placeholder="Search..." value="${param.searchKeyword }"
                                   name="searchKeyword">
                            <button type="submit" class="w3-bar-item w3-button w3-blue w3-small"
                                    style="width: 18%; height: 28px" form="frmSearch">
                                <i class="fa fa-search w3-text-white"></i>
                            </button>
                        </form>
                    </div>
                </th>
            </tr>
            </thead>
            <c:if test="${empty msgList}">
                <tr>
                    <td colspan="3">휴지통에 쪽지가 없습니다.</td>
                </tr>

            </c:if>
            <c:forEach items="${msgList}" var="msgVO">
                <c:if test="${msgVO.msgReadflag eq 'Y'}">
                    <tr class="w3-light-gray hoverable readMessage" id="msg-${msgVO.recNo}">
                </c:if>
                <c:if test="${msgVO.msgReadflag eq 'N'}">
                    <tr class="hoverable unReadMessage" id="msg-${msgVO.recNo}">
                </c:if>
                <td style="width: 5%; max-width: 68px" class="w3-center"><input type="checkbox" name="chk" value="${msgVO.recNo}">
                </td>
                <td style="width: 20%">${msgVO.empName}</td>
                <td style="width: 65%">
                    <div onclick="window.open('<c:url
                            value="/message/detail.do?recNo=${msgVO.recNo}"/>', 'messageWindow', 'width=540,height=500,left=300,top=300,toolbar=no,scrollbars=no,resizable=no');">
                        <c:if test="${msgVO.msgImpflag eq 'Y'}">
                            <span class="w3-border w3-round w3-tiny w3-light-gray">중요 쪽지</span>
                        </c:if>
                        <a href="#" onclick="messageDetailOpen('msg-${msgVO.recNo}')">${msgVO.msgTitle}</a>
                    </div>

                </td>
                <td class="w3-center" style="width: 10%; max-width: 125px; min-width: 125px">
                    <c:set var="today"><fmt:formatDate value="${now}" type="date"/></c:set>
                    <c:set var="msgRegDate"><fmt:formatDate value="${msgVO.msgRegdate}" type="date"/></c:set>
                    <c:if test="${today eq msgRegDate}">
                        <fmt:formatDate value="${msgVO.msgRegdate}" pattern="HH:mm"/>
                    </c:if>
                    <c:if test="${today ne msgRegDate}">
                        ${msgRegDate}
                    </c:if>
                </td>
                </tr>
            </c:forEach>
        </table>

        <%--페이징 처리--%>
        <form name="frmPage" method="post" action="<c:url value='/message/recycleBin.do'/>">
            <input type="hidden" name="searchKeyword"
                   value="${param.searchKeyword }">
            <input type="hidden" name="currentPage">
        </form>

		<div id="pagingbtn">
			<!-- 이전 블럭으로 이동 ◀ -->
			<c:if test="${pagingInfo.firstPage>1 }">
				<a id="prevbtn" href="#" onclick="pageFunc(${pageInfo.firstPage-1})"><i class="fa fa-chevron-left"></i></a>	
			</c:if>
		
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
				<c:if test="${i==pagingInfo.currentPage}">
					<span class="thispage">${i }</span>	
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage}">
					<a href="#" onclick="pageFunc(${i })">${i }</a>		
				</c:if>				
			</c:forEach>
		
			<!-- 다음 블럭으로 이동 ▶ -->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				<a id=nextbtn href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"><i class="fa fa-chevron-right"></i></a>
			</c:if>
		</div>
        <!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
    function pageFunc(curPage) {
        document.frmPage.currentPage.value = curPage;
        frmPage.submit();
    }

    function messageDetailOpen(data) {
        $('#' + data).attr("class", "w3-light-gray readMessage");
    }

    function undoMsg() {
        var recNoStr = "";
        var total = $("input[name=chk]:checked").length;
        $("input[name=chk]:checked").each(function (index) {
            if (index === total - 1) {
                recNoStr += $(this).val();
            } else {
                recNoStr += $(this).val() + ","
            }
        });

        $.ajax({
            type: "post",
            url: "<c:url value='/message/delMsgUndo.do'/>",
            data: {"recNoStr": recNoStr},
            success: function (response) {
                if (response == "OK") {
                    location.reload();
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function realDeleteMsg() {
        var recNoStr = "";
        var total = $("input[name=chk]:checked").length;
        $("input[name=chk]:checked").each(function (index) {
            if (index === total - 1) {
                recNoStr += $(this).val();
            } else {
                recNoStr += $(this).val() + ","
            }
        });

        var choice = confirm("삭제한 쪽지는 복구할 수 없습니다.\n정말 삭제하시겠습니까?");
        if (choice) {
            $.ajax({
                type: "post",
                url: "<c:url value='/message/deleteMsg.do'/>",
                data: {"recNoStr": recNoStr},
                success: function (response) {
                    if (response == "OK") {
                        location.reload();
                    }
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }
    }

    $(function () {
//        $('header nav ul li:nth-child(1) a').addClass('active');
        $('#checkAllMessage').click(function () {
            if ($("#checkAllMessage").prop("checked")) {
                $("input[name=chk]").prop("checked", true);
            } else {
                $("input[name=chk]").prop("checked", false);
            }
        });
    });
</script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>