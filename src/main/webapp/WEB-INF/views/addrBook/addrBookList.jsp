<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="addrBookTop.jsp"%>
<script type="text/javascript">
	$(function(){		
		if($('#groupNo').val()==''){
			$('#groupNo').val('0');
		}
		$('#divDeleteMulti').click(function(){
			var len=$('td input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제할 정보를 체크하세요');
				return;
			}
			$('#frmList').prop('action','<c:url value="/addrBook/goToTrash.do"/>');
			$('#frmList').submit();
		});
		
		$('select[name=groupName]').change(function(){
			var len=$('td input[type=checkbox]:checked').length;
			if(len==0){
				alert('그룹이동 시킬 정보를 체크하세요');
				return;
			}
			var groupNo=$(this).val();
			$('#groupNo').val(groupNo);
			$('#frmList').prop('action','<c:url value="/addrBook/moveGroup.do"/>');
			$('#frmList').submit();
		});
		
		$('#addrSearch').click(function(){
			 $('#frmList').submit();		
		});

		$('#email2').change(function(){
			if($('#email2').val()=='etc'){
				$('#email3').css('visibility','visible');
				$('#email3').focus();
				$('#email3').val('');
			}
		});	
		
		/* countPerPage 변경하기 */
		$('#recordCountPerPage').change(function(){
			$('#frmList').submit();			
		});
		
	});	
	
	function pageFunc(curPage){
		document.frmList.currentPage.value=curPage;
		frmList.submit();
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
    
   <!-- 연락처 insert 영역 시작 -->
    <div id="divWriteSection">
		<div class="divWriteHeader">
			<h3>연락처 추가</h3>
		</div>
		<div class="divWriteBody">
			<form action="<c:url value='/addrBook/addrBookWrite.do'/>" method="post" id="frmWrite">
				<input type="hidden" name="addrTel" id="addrTel"> 
				<input type="hidden" name="addrEmail" id="addrEmail">
				<div>
					<label for="addrName">이름</label> 
					<input type="text" name="addrName" id="addrName" style="ime-mode: active">
				</div>
				<div>
					<label for="hp1">핸드폰</label> 
					<select name="hp1" id="hp1" title="휴대폰 앞자리">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					 - <input type="text" name="hp2" id="hp2" maxlength="4"	title="휴대폰 가운데자리" size="10">
					  - <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리" size="10">
				</div>
				<div>
					<label for="email1">이메일 주소</label> 
					<input type="text" name="email1" id="email1" title="이메일주소 앞자리">
					 @ <select name="email2" id="email2" title="이메일주소 뒷자리">
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="etc">직접입력</option>
						</select> 
					<input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리" style="visibility:hidden;">
				</div>
				<div>
					<label for="addrComp">회사</label> 
					<input type="text" name="addrComp"	id="addrComp" title="회사명">
				</div>
				<div>
					<label for="groupNo">그룹</label> 
					<select name="groupNo">
						<c:if test="${!empty groupList }">
							<c:forEach var="addrGroupVo" items="${groupList }" >
								<option value="${addrGroupVo.groupNo }">${addrGroupVo.groupName }</option>
							</c:forEach>
						</c:if>
					</select>
				</div>
				<hr>
				<div class="center">
					<a href="#"><span id="btSubmit"><i class="fa fa-check"></i> 등록</span></a>
					<a href="#"><span id="btCancel"><i class="fa fa-times"></i> 취소</span></a>
				</div>
			</form>
		</div>
	</div>
    <!-- 연락처 insert 영역 끝 -->
    
    <!-- 연락처 update 영역 시작 -->
    <div id="divUpdateSection">
		<div class="divUpdateHeader">
			<h3>연락처 수정</h3>
		</div>
		<div class="divUpdateBody">
			<form action="<c:url value='/addrBook/addrBookUpdate.do'/>" method="post" id="frmUpdate">
				<input type="hidden" name="addrTel" id="addrTelUpdate"> 
				<input type="hidden" name="addrEmail" id="addrEmailUpdate">
				<input type="hidden" name="addrNo" id="addrNoUpdate">
				<div>
					<label for="addrNameUpdate">이름</label> 
					<input type="text" name="addrName" id="addrNameUpdate" style="ime-mode: active">
				</div>
				<div>
					<label for="hp1">핸드폰</label> 
					<select name="hp1" id="hp1Update" title="휴대폰 앞자리">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					 - <input type="text" name="hp2" id="hp2Update" maxlength="4"	title="휴대폰 가운데자리" size="10">
					  - <input type="text" name="hp3" id="hp3Update" maxlength="4" title="휴대폰 뒷자리" size="10">
				</div>
				<div>
					<label for="email1">이메일 주소</label> 
					<input type="text" name="email1" id="email1Update" title="이메일주소 앞자리">
					 @ <select name="email2" id="email2Update" title="이메일주소 뒷자리">
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="etc">직접입력</option>
						</select> 
					<input type="text" name="email3" id="email3Update" title="직접입력인 경우 이메일주소 뒷자리" style="visibility:hidden;">
				</div>
				<div>
					<label for="addrComp">회사</label> 
					<input type="text" name="addrComp"	id="addrCompUpdate" title="회사명">
				</div>
				<div>
					<label for="groupNo">그룹</label> 
					<select name="groupNo" id="groupNoUpdate">
						<c:if test="${!empty groupList }">
							<c:forEach var="addrGroupVo" items="${groupList }" >
								<option value="${addrGroupVo.groupNo }">${addrGroupVo.groupName }</option>
							</c:forEach>
						</c:if>
						
					</select>
				</div>
				<hr>
				<div class="center">
					<a href="#"><span id="btEdit"><i class="fa fa-check"></i> 수정</span></a>
					<a href="#"><span id="btCancelU"><i class="fa fa-times"></i> 취소</span></a>
				</div>
			</form>
		</div>
	</div>
    <!-- 연락처 upadte 영역 끝 -->
    
    <!-- 그룹 추가 영역 -->
    <div id="divInsertGroup">
    	<div class="divInsertGroupHeader">
			<h3>그룹 추가 / 삭제</h3>
		</div>
		<div class="divInsertGroupList">
			<table>
				<colgroup>
					<col style="width: 70%">
					<col style="width: 30%">
				</colgroup>
				<tbody>
					
				</tbody>
	
			</table>
		</div>
    	<div class="divInsertNewGroup">
    	<hr><br>
    		<form id="frmNewGroup" name="frmNewGroup" action="<c:url value='/addrBook/newGroup.do'/>" method="post">
	    		<input type="text" name="groupName" id="groupName" placeholder="  그룹명 입력">
	    		<a href="#"><span id="btNewGroup"><i class="fa fa-check"></i> 그룹생성</span></a>
	    		<a href="#"><span id="btExit"><i class="fa fa-times"></i> 닫기</span></a>
    		</form>
    	</div>
    </div>
    
    <!-- 그룹 추가 영역 끝 -->     
    
    
	    <form name="frmList" id="frmList" method="post" action="<c:url value='/addrBook/addrBookList.do'/>">
	        <div id="divBodysection">
		        <div class="divAddrHeader">
			        <a href="#"><div id="divDeleteMulti"><i class="fa fa-trash"></i><span> 삭제</span></div></a>
			        <div id="selectGroup">
				        <span><i class="fa fa-share"></i> 그룹이동 </span>
			        	<select name="groupName">
			        		<c:forEach var="vo" items="${groupList }">
						        <option value="${vo.groupNo }"<c:if test="${param.groupNo==vo.groupNo }">selected</c:if>>${vo.groupName}</option>			        		
			        		</c:forEach>					        
				        </select>
			        </div>
			        
			        <!-- <a href="#"><div><i class="fa fa-envelope-o"></i><span> 메일 보내기</span></div></a> -->
			        <!-- <a href="#"><div><i class="fa fa-file-excel-o"></i><span> 주소록 내보내기</span></div></a> -->
			        
			        <input type="hidden" id="currentPage" name="currentPage" value="1">
			        <input type="hidden" id="groupNo" name="groupNo" value="${param.groupNo }">
			        <div>
			        	<input type="text" placeholder="이름 검색" id="searchKeyword" name="searchKeyword" value='${param.searchKeyword}'>
			        	<a href="#"><i id="addrSearch" class="fa fa-search"></i></a>
		        	</div>
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
	        			<th>이름</th>
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
		        			<td id="${addrBookVo.addrNo }"><a href="#">${addrBookVo.addrName }</a></td>
		        			<td>${addrBookVo.addrTel }</td>
		        			<td><a href="#">${addrBookVo.addrEmail}</a></td>
		        			<td>${addrBookVo.addrComp}</td>		        			
		        			<td>${addrBookVo.groupName}</td>		        			
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
   