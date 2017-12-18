<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_write.css'/>" rel="stylesheet" type="text/css">
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li class="active"><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
					<li><a href="<c:url value='/confirm/tempsave.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
					<li><a href="<c:url value='/confirm/await.do'/>"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
					<li><a href="<c:url value='/confirm/complete.do'/>"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
					<li><a href="<c:url value='/confirm/return.do'/>"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
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
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;전자 결재 - 새 결재 진행&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
				<div id="linebtn">
					<input type="button" value="결재라인 지정">	
				</div>
			<!-- writeform -->	
				<!-- 상단 -->
				<div id="link_cho">
					<div id="divtitle">
						<span class="sd1">제목</span>
						<input type="text" id="doc_title">
					</div>
					<div id="link_doc">
						<span class="sd1">연계문서선택</span>
						<select id="link_doc" class="sd2">
							<!-- if(내 문서들 출력) -->
							<option value="0">선택하세요</option>
							<option value="(20171010102031001) 사내 인트라넷 시스템 도입의 건">사내 인트라넷 시스템 도입의 건</option>
							<option value="(20171010102033022) 사내 인트라넷 시스템 도입에 대한 지출">사내 인트라넷 시스템 도입에 대한 지출</option>
						</select>
					</div>
				</div>	
				<!-- 상단 끝 -->
				<form name="writeFrm" id="writeFrm" method="post" action="<c:url value='/confirm/writeOk.do'/>" enctype="multipart/form-data">
				<!-- 미드 -->
					<div id="doc_type">
						<div id="dt_head">
							<input type="text" name="formName" value="${vo.formName }" readonly>
						</div>
						<p id="userinfo">
							기안자 : <input type="text" name="username" value="사용자(부서이름)" readonly>
							<input type="hidden" name="empNo" value="회원번호">
						</p>
						<div id="doc_info">
							<div>
								<label for ="docno" class="sd1">문서 번호</label> <!-- 날짜+부서번호+양식번호+문서시퀀스 -->
								<input type="text" name="cfNo" id="docno" value="${today }301333${seq}" readonly>
							</div>
							<div>
								<label for="docreg" class="sd1">기안 일자</label>
								<input type="text" name="docreg" id="docreg" value="${today }" readonly>
							</div>
							<div>
								<label for="doclife" class="sd1">보존 년한</label>	
								<input type="text" name="formLife" id="doclife" value="${vo.formLife }" readonly>
							</div>
							<div>
								<label for="docsecu" class="sd1">보안수준</label>	
								<input type="text" name="formSecu" id="docsecu" value="${vo.formSecu }" readonly>
							</div>
						</div>
						<div id="confirmer">
							<div id="confirmer1">
								<span></span>
								<span>결재자1</span>
							</div>
							<div id="confirmer2">
								<span></span>
								<span>결재자2</span>
							</div>
							<div id="confirmer3">
								<span></span>
								<span>결재자3</span>
							</div>
							<div id="confirmer4">
								<span></span>
								<span>결재자4</span>
							</div>
							<div id="confirmer5">
								<span></span>
								<span>결재자5</span>
							</div>
							<div id="confirmer6">
								<span></span>
								<span>결재자6</span>
							</div>
							<div id="confirmer7">
								<span></span>
								<span>결재자7</span>
							</div>
							<div id="confirmer8">
								<span></span>
								<span>결재자8</span>
							</div>
						</div>
						<div class="clr"></div>
						<div id="cf_info">
							<div class="dr">
								<label for="linkdoc" class="sd1">연계문서</label>	
								<input type="text" name="linkdoc" id="linkdoc" value="" readonly>
								<input type="hidden" name="linkCfNo">
							</div>
							<div class="dr">
								<label for="doctitle" class="sd1">제목</label>	
								<input type="text" name="cfTitle" id="doctitle" value="" readonly>
							</div>			
							<!-- 에디터부분 -->
							<div id="smarteditor">
								<textarea name="cfContent" id="ir1" rows="20" style="width: 100%;"></textarea>
							</div>
							<!-- 에디터부분 끝 -->				
						</div>
					</div>
					<!-- 미드 끝 -->
					<!-- 하단 -->
					<div id="insFile">
						<h3><i class="fa fa-floppy-o"></i> 파일 첨부</h3>
						<label for="fileQty">파일 개수를 선택하세요.</label>
						<select name="fileQty" id="fileQty">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
						<div id="files"></div>
					</div>
					<!-- 바로 결재하는지 임시저장하는지 저장타입넘겨주는 input -->
					<input type="text" name="savetype" id="savetype">
					<div id="submitbtn">
						<input type="button" id="submit" onclick="submitContents()" value="결재">&nbsp;&nbsp;
						<input type="button" id="save" onclick="submitContents()" value="임시저장">	
					</div>
				</form>
				<div id="choice_cfer">
					<c:import url='/confirm/line.do'/>
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
<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm_write.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#linebtn input[type=button]').click(function(){
			$('#choice_cfer').toggle();
		})
	});
</script>