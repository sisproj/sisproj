<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="addrBookTop.jsp"%>
<<script type="text/javascript">
	$('#divDeleteMulti').click(function(){
		var len=$('td input[type=checkbox]:checked').length;
		if(len==0){
			alert('삭제할 정보를 체크하세요');
			return;
		}
		$('#frmList').prop('action','<c:url value="/addrBook/goToTrash.do"/>');
		$('#frmList').submit();
	});
</script>
    <!-- 3. 내용 -->
    <article id="bodysection">
	    <form name="frmList" id="frmList" method="post" action="<c:url value='/addrBook/addrBookList.do'/>">
	        <div id="divBodysection">
		        <div class="divAddrHeader">
			        <a href="#"><div id="divDeleteMulti"><i class="fa fa-trash"></i><span> 삭제</span></div></a>
			        <a href="#"><div><i class="fa fa-envelope-o"></i><span> 메일 보내기</span></div></a>
			        <a href="#"><div><i class="fa fa-file-excel-o"></i><span> 주소록 내보내기</span></div></a>
			        <div><input type="text" placeholder="연락처 검색"><a href="#"><i id="addrSearch" class="fa fa-search"></i></a></div>
			        <div id="selectMenu">
			        	<select>
					        <option>10개씩 보기</option>
					        <option>30개씩 보기</option>
					        <option>50개씩 보기</option>
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
		        <div class="divPaging">
		        	<jsp:include page="paging.jsp"></jsp:include>
		        </div>
	        </div>
        </form>
    </article>
    <!-- 3. 내용 끝 -->

    <%@include file="addrBookBottom.jsp" %>        
   