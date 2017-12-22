<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="addrBookTop.jsp"%>
<script type="text/javascript">
$(function(){
	$('#divRestore').click(function(){
		var len=$('td input[type=checkbox]:checked').length;
		if(len==0){
			alert('복원할 정보를 체크하세요');
			return;
		}
		$('#frmTrash').prop('action','<c:url value="/addrBook/restore.do"/>');
		$('#frmTrash').submit();
	});
	$('#divClear').click(function(){
		if(confirm('영구 삭제 하시겠습니까?')){
			$('#frmTrash').prop('action','<c:url value="/addrBook/addrBookClear.do"/>');
			$('#frmTrash').submit();
		}
	});
});
</script>
        <!-- 3. 내용 -->
    <article id="bodysection">
    <form name="frmTrash" id="frmTrash" action='<c:url value="/addrBook/addrBookTrash.do"/>' method="post">
        <div id="divBodysection">
	        <div class="divAddrHeader">
		        <a href="#"><div id="divClear"><i class="fa fa-trash"></i><span> 휴지통 비우기</span></div></a>		        
		        <a href="#"><div id="divRestore"><i class="fa fa-share-square-o"></i><span> 주소록으로 되돌리기</span></div></a>		        
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
		        			<td>${addrBookVo.addrComp }</td>
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
    	
    	
    	
    	
    	
    	
    	
    	
