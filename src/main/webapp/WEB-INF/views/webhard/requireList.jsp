<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
    <link rel="stylesheet" href="<c:url value='/resources/css/pagecss/webhard_list.css'/>">
        <!-- 0. include부분 -->
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="<c:url value='/webhard/main.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>웹하드</span></a></li>
                <li class="active"><a href="<c:url value='/webhard/requireList.do'/>"><i class="fa fa-list-alt"></i>&nbsp;<span>요청 게시판</span></a></li>
                <li><a href="<c:url value='/webhard/write.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>요청 글 쓰기</span></a></li>
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-list-alt"></i>&nbsp;요청 게시판&nbsp;<a href="#"><i class="fa fa-bookmark"></i></a></h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
		<form name="frmPaging" method="post" action="<c:url value='/webhard/requireList.do'/>">
			<!-- 페이징 처리용 -->
			<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
			<input type="hidden" name="currentPage">
		</form>
        <!-- 3. 내용 -->
        <div id="wrap">
			<div id="search" class="bold">
				검색어 : <input type="text" name="searchKey" id="searchKey" placeholder="제목, 작성자, 내용" value="${param.searchKeyword }">
				<input type="button" value="검색">
			</div>
			<div class=divDelbtn><a class="deleteBtn" href="#">삭제</a></div>
			<form id="tempList" name="tempList" method="post" action="<c:url value='/confirm/tempDocsDel.do'/>">
				<table id="awaittb">
					<thead>
						<tr>
							<th>
								<c:if test="${sessionScope.empVo.empLev == '관리자' }">
									<input type="checkbox" id="allSelect">
								</c:if>
							</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty webBoardList }">
							<tr><td colspan="4" rowspan="2">문서가 없습니다</td></tr>
						</c:if>
						<c:if test="${!empty webBoardList }">
							<c:forEach var="webBoard" items="${webBoardList }" varStatus="status">
								<tr>
									<c:if test="${sessionScope.empVo.empLev == '관리자' }">
										<td><input type="checkbox" class="delchkbox" name="docuItems[${status.index }].cfNo" value="${webBoard.webNo }"></td>
									</c:if>
									<c:if test="${sessionScope.empVo.empLev != '관리자' }">
										<td>${webBoard.webNo }</td>
									</c:if>
									<td><a href="<c:url value='/webhard/detail.do?webNo=${webBoard.webNo }'/>">
										${webBoard.webTitle }
										<c:if test="${webBoard.commCnt > 0 }">
											[${webBoard.commCnt }]
										</c:if> 
										<%-- <img alt="New" src="<c:url value='/resources/images/icon_new.gif'/>"> --%>
									</a></td>
									<td>${webBoard.empName }</td>
									<td><fmt:formatDate value="${webBoard.webRegdate }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</form>
			<div class=divDelbtn>
				<a class="deleteBtn" href="#">삭제</a>			
			</div>
			<c:if test="${!empty webBoardList}">
				<div id="pagingbtn">
					<c:if test="${pageInfo.currentPage!=1 }">
						<a id="firstbtn" href="#" onclick="movePage(1)"><i class="fa fa-arrow-left"></i></a>
					</c:if>
					<c:if test="${pageInfo.firstPage>1 }">
						<a id="prevbtn" href="#" onclick="movePage(${pageInfo.firstPage-1})"><i class="fa fa-chevron-left"></i></a>
					</c:if>
					
					<c:forEach var="i" begin="${pageInfo.firstPage }" end="${pageInfo.lastPage }">
						<c:if test="${i==pageInfo.currentPage }">
							<span class="thispage">${i }</span>					
						</c:if>
						<c:if test="${i!=pageInfo.currentPage }">
							<a href="#" onclick="movePage(${i })">${i }</a>				
						</c:if>
					</c:forEach>
					
					<c:if test="${pageInfo.lastPage < pageInfo.totalPage }">
						<a id=nextbtn href="#" onclick="movePage(${pageInfo.lastPage+1})"><i class="fa fa-chevron-right"></i></a>
					</c:if>
					<c:if test="${pageInfo.currentPage!=pageInfo.totalPage  }">
						<a id=lastbtn href="#" onclick="movePage(${pageInfo.totalPage })"><i class="fa fa-arrow-right"></i></a>
					</c:if>
				</div>
			</c:if>
		</div>
        <!-- 3. 내용 끝 -->
    </article>
    <!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(7) a').addClass('active');
        });
    </script>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>
<script>
	function movePage(currentP){
		document.frmPaging.currentPage.value=currentP;
		document.frmPaging.submit();
	}
	$(function(){
		$('#search input[type=button]').click(function(){
			var sk = $('#search #searchKey').val()
			$('form[name=frmPaging] input[name=searchKeyword]').val(sk);
			movePage(1);
		});	
	});
</script>