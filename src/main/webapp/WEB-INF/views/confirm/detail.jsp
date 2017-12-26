<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_detail.css'/>" rel="stylesheet" type="text/css">
<!-- 0. include부분 -->
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
					<li><a href="<c:url value='/confirm/tempsave.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
					<li><a href="<c:url value='/confirm/await.do'/>"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
					<li><a href="<c:url value='/confirm/complete.do'/>"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
					<li><a href="<c:url value='/confirm/return.do'/>"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
					<li><a href="<c:url value='/confirm/postbox.do'/>"><i class="fa fa-archive"></i>&nbsp;<span>참조 수신함</span></a></li>
					<li><a href="<c:url value='/confirm/setting.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
					<li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
				</ul>	
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;문서제목(양식이름)&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
				<div id="linebtn">
					<!-- (내문서이거나 || 결재대기) 이면서&& 내 결재 차례인 경우 -->
					<c:if test="${(docVo.empNo == MyEmpNo || docVo.cfStatus == '결재대기') && MyEmpNo==docVo.cfConfirmer }">
						<input type="button" id="cf_ok" value="결재승인">&nbsp;&nbsp;
					</c:if>
					<!-- 내문서가 아니면서&& 결재대기 이면서&& 내 결재 차례인 경우 -->
					<c:if test="${docVo.empNo != MyEmpNo && docVo.cfStatus == '결재대기' && MyEmpNo==docVo.cfConfirmer }">
						<input type="button" id="cf_not" value="결재반려">&nbsp;&nbsp;
					</c:if>
					<!-- 임시저장인경우 -->
					<c:if test="${docVo.cfStatus == '임시저장' }">
						<input type="button" id="cf_edit" value="수정">&nbsp;&nbsp;
						<input type="button" id="cf_del" value="삭제">&nbsp;&nbsp;
					</c:if>
					<!-- 결재반려인 경우 -->
					<c:if test="${docVo.cfStatus == '결재반려' }">
						<input type="button" id="cf_del" value="삭제">&nbsp;&nbsp;
					</c:if>
					<!--엑셀파일로 다운로드는 결재완료인경우만-->
					<c:if test="${docVo.cfStatus == '결재완료' }">
						<a class="button" href="#">엑셀로 다운</a>
					</c:if>
				</div>
			<!-- writeform -->	
				<div name="writeFrm" id="writeFrm">
				<!-- 서식 -->
					<div id="doc_type">
						<div id="dt_head">
							<input type="text" name="doctype" value="${docVo.formName }">
						</div>
						<span></span>
						<p id="userinfo">
							기안자 : <input type="text" name="username" value="${writerEmpVo.empName }(${writerEmpVo.deptName })" readonly><br>
							현재 문서 상태 : <strong>${docVo.cfStatus }</strong>
						</p>
						<div id="doc_info">
							<div>
								<label for ="docno" class="sd1">문서 번호</label>
								<input type="text" name="docno" id="docno" value="${docVo.cfNo }" readonly>
							</div>
							<div>
								<label for="docreg" class="sd1">기안 일자</label>
								<input type="text" name="docreg" id="docreg" 
									value='<fmt:formatDate value="${docVo.cfRegdate }" pattern="yyyy-MM-dd"/>' readonly>
							</div>
							<div>
								<label for="doclife" class="sd1">보존 년한</label>	
								<input type="text" name="doclife" id="doclife" value="${docVo.formLife }" readonly>
							</div>
							<div>
								<label for="docsecu" class="sd1">보안수준</label>	
								<input type="text" name="docsecu" id="docsecu" value="${docVo.formSecu }" readonly>
							</div>
						</div>
						<div id="confirmer">
							<c:forEach var="clVo" items="${clVoList }">
								<div>
									<span>
										<c:if test="${clVo.lineStat == CL_COMPLETE}">
											<img src="<c:url value='/user_sign/${sVo.signName }'/>" alt="결재"> <!-- 결재자 사인 경로 넣기 -->
										</c:if>
										<c:if test="${clVo.lineStat == CL_RETURN}">
											<img src="<c:url value='/user_sign/return_img.jpg'/>" alt="반려">											
										</c:if>
										<c:if test="${clVo.lineStat == CL_AWAIT }">
											
										</c:if>
									</span>
									<span>${clVo.empName } ${clVo.posName }
									<c:if test="${clVo.lineStat == '승인'}">
										<br><fmt:formatDate value="${clVo.lineRegdate }" pattern="yy-MM-dd"/>
									</c:if></span>
								</div>
							</c:forEach>
						</div>
						<div class="clr"></div>
						<div id="cf_info">
							<div class="dr">
								<label for="linkdoc" class="sd1">연계문서</label>	
								<input type="text" name="linkdoc" id="linkdoc" value="
								<c:if test="${!empty linkdoc }">
									(${linkDoc.cfNo }) ${linkDoc.cfTitle }
								</c:if>
								" readonly>
							</div>
							<div class="dr">
								<label for="doctitle" class="sd1">제목</label>	
								<input type="text" name="doctitle" id="doctitle" value="${docVo.cfTitle }" readonly>
							</div>			
							<!-- 내용부분 -->
							<div id="contents">
								${docVo.cfContent }
							</div>
							<!-- 내용부분 끝 -->				
						</div>
					</div>
					<!-- 미드 끝 -->
					<!-- 파일첨부 -->
					<div id="insFile">
						<h3><i class="fa fa-floppy-o"></i> 첨부된 파일</h3>
						<div id="files">
							<c:forEach var="cfVo" items="${fileList }" varStatus="status">
								<span><a href="<c:url value='/attachfile/${cfVo.fileName }'/>">${status.index+1 }. ${cfVo.fileOriName }</a> 
								/ (${(cfVo.fileSize/1024) + (((cfVo.fileSize/1024) % 1 > 0.5)?(1 - ((cfVo.fileSize/1024) % 1)) % 1:-((cfVo.fileSize/1024) % 1))}KB)</span>
								<c:if test="${status.index != fn:length(fileList) }">
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<!-- 의견 -->
					<c:if test="${docVo.cfStatus != '임시저장' }">
						<div id="cf_comment">
							<h3><i class="fa fa-commenting-o"></i> 의견 (${fn:length(commVoList) })</h3>
							<!-- 상단등록창 -->
							<form name="comm_wr" id="comm_wr" method="post" action="<c:url value='/confirm/writeComm.do'/>">
								<input type="hidden" name="cfNo" value="${docVo.cfNo }">
								<input type="hidden" name="memNo" value="${MyEmpNo }">
								<textarea name="commContent" id="con" placeholder="줄바꿈이 되지 않습니다."></textarea>
								<input type="submit" class="bold" value="등록">
							</form>
							<!-- 상단등록창 끝 -->
							<!-- 의견리스트 -->
							<!-- 반복 -->
							<c:forEach var="commVo" items="${commVoList }" varStatus="status">
								<div class="selcomm" id="${commVo.commNo }">
									<div class="comm_info">
										<span class="comm_reg bold">${commVo.empName }</span> 
										<span class="comm_reg"><fmt:formatDate value="${commVo.commRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
										<span id="comm-${status.index }">
											<c:if test="${commVo.memNo == MyEmpNo}">
												<a class="comm_delete bold" href="<c:url value='/confirm/deleteComm.do?commNo=${commVo.commNo }&cfNo=${docVo.cfNo }'/>">삭제</a>&nbsp;&nbsp;&nbsp;
												<a class="comm_edit bold" id="btn_e-${status.index }" href="#comm-${status.index }">수정</a>&nbsp;&nbsp;&nbsp;<!-- 1부분 아이디 반복문 i로 돌리기 -->
											</c:if>
										</span>
									</div>
									<div class="comm_content" id="comm_con-${status.index }"><!-- 1부분 아이디 반복문 i로 돌리기 -->
										<div class="comm_con">${commVo.commContent }</div>
										<!-- 수정용 -->
										<form name="comm_ed" class="comm_ed" method="post" action="<c:url value='/confirm/editComm.do'/>">
											<textarea name="commContent" placeholder="줄바꿈이 되지 않습니다."></textarea>
											<input type="hidden" name="commNo" value="${commVo.commNo }">
											<input type="hidden" name="cfNo" value="${docVo.cfNo }">
											<input type="submit" class="bold" value="댓글 수정">
										</form>
										<!-- 수정용 끝 -->
									</div>
									<div class="clr"></div>
								</div>	
							</c:forEach>
							<!-- 반복 끝 -->
							<!-- 의견리스트 끝 -->
						</div>
					</c:if>
				</div>
				<!-- 하단 끝 -->
			<!-- writeform 끝-->	
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@ include file="../inc/bottom.jsp" %>
<script type="text/javascript">
	$(function(){
		$('input#cf_edit').click(function(){
			$(location).attr('href',"<c:url value='/confirm/edit.do?cfNo=${docVo.cfNo }'/>");
		});

		$('input#cf_del').click(function(){
			if(confirm('정말 문서를 삭제 하시겠습니까?')){
				$(location).attr('href',"<c:url value='/confirm/delete.do?cfNo=${docVo.cfNo }'/>");
			}
		});
		
		$('.comm_delete').click(function(){
			if(!confirm('정말 의견을 삭제 하시겠습니까?')){
				return false;
			}
		});
		
		$('a.comm_edit').click(function(){
			var getId = $(this).attr('id');
			var start = getId.indexOf('-');
			var num = getId.substring(start+1);
			var btn = '#comm-'+num;
			var con = '#comm_con-'+num+' .comm_con';
			var frm = '#comm_con-'+num+' .comm_ed';
			$(con).hide();
			$(btn).hide();
			$(frm).show();
		});
		$('.comm_ed, #comm_wr').submit(function(){
			
		});
	});
</script>