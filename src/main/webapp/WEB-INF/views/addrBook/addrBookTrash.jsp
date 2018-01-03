<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="addrBookTop.jsp"%>
<!-- Bootstrap -->
<script src="<c:url value='/resources/jquery/jquery-3.2.1.min.js'/>"></script>
<link href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>" rel="stylesheet">
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>
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
		
		/* countPerPage 변경하기 */
		$('#recordCountPerPage').change(function(){
			/* if($('#groupNo').val()==''){
				$('#groupNo').val('0');
			} */
			$('#frmTrash').submit();			
		});
	});
	
	function pageFunc(curPage){
		document.frmTrash.currentPage.value=curPage;
		frmTrash.submit();
	}
</script>
<style>
	#addrTable{
		width:100%;
		margin: 0 auto;
		padding : 10px;
		box-sizing:border-box;
		border:0;
		border-collapse: collapse;	
		margin-top: 10px;	
		margin-bottom: 10px;
	}
	#addrTable tr{
		transition:all 300ms linear;
	}
	#addrTable tbody tr:hover{
		background-color: #e1e1e1;
	}
	#addrTable th{
		box-sizing:border-box;
		padding: 5px;
		height: 30px;
		color: #036;
		font-size: 1.17em;
		border:0;
		border-top: 2px solid #e1e1e1;
		border-bottom: 2px solid #e1e1e1;
	}
	#addrTable td {
		box-sizing:border-box;
		padding: 5px;
		border:0;
		text-align: center;
		border-bottom: 2px solid #e1e1e1;
	}
	/*하단 페이징 버튼*/
	#pagingbtn{
		width: 100%;
		max-width:1100px;
		margin: 0 auto;
		height: 40px;
		width: auto;
		box-sizing:border-box;
		padding-bottom: 10px;
		text-align:center;
	}
	#pagingbtn span, #pagingbtn a{
		display: inline-block;
		width: 24px;
		line-height: 24px;
		border-radius:12px;
		background-color: #369;
		color: fff;
		text-align: center;
		font-weight: bold;
		margin-left: 5px;
		box-shadow:2px 2px 3px #333;
		font-size: 0.8em;
	}
	#pagingbtn a:hover,
	#pagingbtn span.thispage{
		background-color:#09f;
		box-shadow:2px 2px 3px transparent;	
	}
	#pagingbtn span:first-child{
		margin-left: 0;	
	}
	#pagingbtn a i {
		line-height: 24px;
		color: fff;
		text-align: center;
		font-size: 0.8em;
	}
	#pagingbtn #firstbtn,
	#pagingbtn #lastbtn{
		background-color: #333;
	}
	#pagingbtn #prevbtn,
	#pagingbtn #nextbtn{
		background-color: #306;
	}
</style>
        <!-- 3. 내용 -->
    <article id="bodysection">
    <form name="frmTrash" id="frmTrash" action='<c:url value="/addrBook/addrBookTrash.do"/>' method="post">
        <input type="hidden" id="currentPage" name="currentPage" value="1">
        <div id="divBodysection">
	        <div class="divAddrHeader">
		        <a href="#"><div id="divClear"><i class="fa fa-trash"></i><span> 휴지통 비우기</span></div></a>		        
		        <a href="#"><div id="divRestore"><i class="fa fa-share-square-o"></i><span> 주소록으로 되돌리기</span></div></a>		        
		        <div id="selectMenu">
		        	<select id="recordCountPerPage" name="recordCountPerPage">
				        <option value="10"<c:if test="${param.recordCountPerPage==10 }">selected</c:if>>10개씩 보기</option>
				        <option value="30"<c:if test="${param.recordCountPerPage==30 }">selected</c:if>>30개씩 보기</option>
				        <option value="50"<c:if test="${param.recordCountPerPage==50 }">selected</c:if>>50개씩 보기</option>
			        </select>
		        </div>
		    </div>
        	<table id="addrTable">
        		<colgroup>
        			<col width="5%">
        			<col width="15%">
        			<col width="15%">
        			<col width="25%">
        			<col width="20%">
        			<col width="20%">
        		</colgroup>
        		<thead>
        		<tr>
        			<th><input type="checkbox" id="checkAll"></th>
        			<th><a href="#">이름</a></th>
        			<th>전화번호</th>
        			<th>이메일</th>
        			<th>회사</th>
        			<th>그룹</th>
        		</tr>
        		</thead>
        		<tbody>
        		<c:forEach var="addrBookVo" items="${addrList }" varStatus="status">
	        		<tr>
	        			<td><input type="checkbox" name="addrItems[${status.index }].addrNo" value="${addrBookVo.addrNo}"></td>
	        			<td><a href="#">${addrBookVo.addrName }</a></td>
	        			<td>${addrBookVo.addrTel }</td>
	        			<td><a href="#">${addrBookVo.addrEmail}</a></td>
	        			<td>${addrBookVo.addrComp }</td>
	        			<c:forEach var="addrGroupVo" items="${groupList }">
	        				<c:if test="${addrBookVo.groupNo==addrGroupVo.groupNo }">
	        					<td>${addrGroupVo.groupName}</td>
	        				</c:if>
	        			</c:forEach>
	        		</tr>
        		</c:forEach>
        		</tbody>
        	</table>
	        
	       <!-- 페이징처리 -->
	    	<div id="pagingbtn">
				<ul>
					<!-- 이전 블럭으로 이동 ◀ -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a id="prevbtn" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"><i class="fa fa-chevron-left"></i></a>		
					</c:if>	
				
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
						<c:if test="${i==pagingInfo.currentPage}">
							<span class="thispage">${i }</span>	
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage}">
							<a href="#" onclick="pageFunc(${i })" class="active">${i }</a>
				 		</c:if>				
					</c:forEach>
				
					<!-- 다음 블럭으로 이동 ▶ -->
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
						<a id=nextbtn href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"><i class="fa fa-chevron-right"></i></a>
					</c:if>
				</ul>
	        </div>
	        <!-- 페이징 처리 끝 -->
	        
        </div>
        </form>
    </article>
    <!-- 3. 내용 끝 -->
    
<%@include file="addrBookBottom.jsp" %>    
    	
    	
    	
    	
    	
    	
    	
    	
