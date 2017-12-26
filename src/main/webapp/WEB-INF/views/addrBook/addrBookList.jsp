<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="addrBookTop.jsp"%>
<!-- Bootstrap -->
<script src="<c:url value='/resources/jquery/jquery-3.2.1.min.js'/>"></script>
<link href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>" rel="stylesheet">
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#divDeleteMulti').click(function(){
			var len=$('td input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 정보를 체크하세요');
				return;
			}
			$('#frmList').prop('action','<c:url value="/addrBook/goToTrash.do"/>');
			$('#frmList').submit();
		});
		
		$('#addrSearch').click(function(){
			$('#frmList').submit();		
		});
	    
	});	
	
	function pageFunc(curPage){
		document.frmList.currentPage.value=curPage;
		frmList.submit();
	}
</script>
    <!-- 3. 내용 -->
    <article id="bodysection">
	    <form name="frmList" id="frmList" method="post" action="<c:url value='/addrBook/addrBookList.do'/>">
	        <div id="divBodysection">
		        <div class="divAddrHeader">
			        <a href="#"><div id="divDeleteMulti"><i class="fa fa-trash"></i><span> 삭제</span></div></a>
			        <a href="#"><div><i class="fa fa-envelope-o"></i><span> 메일 보내기</span></div></a>
			        <a href="#"><div><i class="fa fa-file-excel-o"></i><span> 주소록 내보내기</span></div></a>
			        <input type="hidden" id="currentPage" name="currentPage" value="1">
			        <input type="hidden" id="countPerPage" name="countPerPage" value="10">
			        <input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
			        <div><input type="text" placeholder="연락처 검색" id="searchKeyword" name="searchKeyword" value="">
			        	<a href="#"><i id="addrSearch" class="fa fa-search"></i></a></div>
			        <div id="selectMenu">
			        	<select>
					        <option value="10">10개씩 보기</option>
					        <option value="30">30개씩 보기</option>
					        <option value="50">50개씩 보기</option>
				        </select>
			        </div>
			    </div>
		        <div class="divAddrBody">
		        	<table>
		        		<colgroup>
		        			<col width="5%">
		        			<col width="15%">
		        			<col width="15%">
		        			<col width="25%">
		        			<col width="20%">
		        			<col width="20%">
		        		</colgroup>
		        		<tr>
		        			<th><input type="checkbox" id="checkAll"></th>
		        			<th><a href="#">이름</a></th>
		        			<th>전화번호</th>
		        			<th>이메일</th>
		        			<th>회사</th>
		        			<th>그룹</th>
		        		</tr>
		        		<c:forEach var="addrBookVo" items="${addrList }" varStatus="status">
			        		<tr>
			        			<td><input type="checkbox" name="addrItems[${status.index }].addrNo" value="${addrBookVo.addrNo}"></td>
			        			<td><a href="#">${addrBookVo.addrName }</a></td>
			        			<td>${addrBookVo.addrTel }</td>
			        			<td><a href="#">${addrBookVo.addrEmail}</a></td>
			        			<td>${addrBookVo.addrComp}</td>
			        			<c:forEach var="addrGroupVo" items="${groupList }">
			        				<c:if test="${addrBookVo.addrGroupNo==addrGroupVo.groupNo }">
			        					<td>${addrGroupVo.groupName}</td>
			        				</c:if>
			        			</c:forEach>
			        		</tr>
		        		</c:forEach>
		        	</table>
		        </div>
		        
		        <!-- 페이징처리 -->
		    	<div id="paging">
		        	<%-- <jsp:include page="paging.jsp"></jsp:include> --%>
		        	<nav aria-label="..." style="text-align: center;">
						<ul class="pagination">
							<!-- 이전 블럭으로 이동 ◀ -->
							<c:if test="${pagingInfo.firstPage>1 }">
								<li><a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">«</a></li>	
							</c:if>	
						
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
								<c:if test="${i==pagingInfo.currentPage}">
									<li><a href="#" class="active">${i }</a></li>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage}">
									<li><a href="#" onclick="pageFunc(${i })" class="active">${i }</a></li>
						 		</c:if>				
							</c:forEach>
						
							<!-- 다음 블럭으로 이동 ▶ -->
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
								<li><a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">»</a></li>
							</c:if>
						</ul>
					</nav>
		        </div>
		        <!-- 페이징 처리 끝 -->
		        
	        </div>        
	    </form>
    </article>
    <!-- 3. 내용 끝 -->

    <%@include file="addrBookBottom.jsp" %>        
   