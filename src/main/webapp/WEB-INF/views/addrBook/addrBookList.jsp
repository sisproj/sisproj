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
		$('#divWriteSection').hide();
		
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

		$('#email2').change(function(){
			if($('#email2').val()=='etc'){
				$('#email3').css('visibility','visible');
				$('#email3').focus();
				$('#email3').val('');
			}
		});
		
		/* 연락처 입력 */
		$('#btSubmit').click(function(){
			if($('#addrName').val()==''){
				alert("이름을 입력하세요");
				$('#addrName').focus();
				return false;
			}
			var hp="";
			if($('#hp2').val()=='' || $('#hp3').val()==''){
				alert("핸드폰 번호를  입력하세요");
				$('#hp2').focus();
				return false;
			}else{
				hp=$('#hp1 option:checked').val()+"-"+$('#hp2').val()+"-"+$('#hp3').val();
			}
			$('#addrTel').val(hp);
			alert(hp);
			
			var email1 = $('#email1').val();
			var email2 = $('#email2 option:selected').val();
			var email3 = $('#email3').val();
			var email="";
			
			if($('#email2').val()=="etc"){
				if($('#email1').val()!="" && $('#email3').val()!=""){
					email=email1+"@"+email3;
				}
			}else if($('#email1').val()!="" && $('#email2').val()!=""){
				email=email1+"@"+email2;
			}
			$('#addrEmail').val(email);
			alert("email1:"+email1);
			alert("email2:"+email2);
			alert("email3:"+email3);
			alert("email:"+email);
			
			$('#frmWrite').submit();
			
		});
			
		
			
		
		
	});	
	
	function pageFunc(curPage){
		document.frmList.currentPage.value=curPage;
		frmList.submit();
	}
</script>
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
				<input type="hidden" name="groupName" id="groupName" value="${addrGroupVo.groupName }">
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
					<select name="groupNo" id="groupNo">
						<c:if test="${!empty groupList }">
							<c:forEach var="addrGroupVo" items="${groupList }" >
								<option value="${addrGroupVo.groupNo }">${addrGroupVo.groupName }</option>
							</c:forEach>
						</c:if>
						<!-- 	<option value=""></option>
				    	<option value="2">가족</option>
				    	<option value="3">친구</option>
				    	<option value="4">거래처</option>
				    	<option value="5">동아리</option> -->
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
    
    
    
	    <form name="frmList" id="frmList" method="post" action="<c:url value='/addrBook/addrBookList.do'/>">
	        <div id="divBodysection">
		        <div class="divAddrHeader">
			        <a href="#"><div id="divDeleteMulti"><i class="fa fa-trash"></i><span> 삭제</span></div></a>
			        <a href="#"><div><i class="fa fa-envelope-o"></i><span> 메일 보내기</span></div></a>
			        <a href="#"><div><i class="fa fa-file-excel-o"></i><span> 주소록 내보내기</span></div></a>
			        <input type="hidden" id="currentPage" name="currentPage" value="1">
			        <input type="hidden" id="countPerPage" name="countPerPage" value="10">
			        <div>
			        	<input type="text" placeholder="연락처 검색" id="searchKeyword" name="searchKeyword" value='${param.searchKeyword}'>
			        	<a href="#"><i id="addrSearch" class="fa fa-search"></i></a>
		        	</div>
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
			        				<c:if test="${addrBookVo.groupNo==addrGroupVo.groupNo }">
			        					<td>${addrGroupVo.groupName}</td>
			        				</c:if>
			        			</c:forEach>
			        		</tr>
		        		</c:forEach>
		        	</table>
		        </div>
		        
		        <!-- 페이징처리 -->
		    	<div id="paging">
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
   