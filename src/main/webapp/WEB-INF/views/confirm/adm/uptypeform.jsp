<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_uptypeform.css'/>" rel="stylesheet" type="text/css">
<!-- 0. include부분 -->
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
					<li><a href="<c:url value='/confirm/tempsave.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
					<li><a href="<c:url value='/confirm/await.do'/>"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
					<li><a href="<c:url value='/confirm/complete.do'/>"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
					<li><a href="<c:url value='/confirm/return.do'/>"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
					<li><a href="<c:url value='/confirm/setting.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
					<li class="active"><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
				</ul>
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;결재 양식 수정&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
			<!-- writeform -->	
				<!-- 상단 -->
				<form name="docFrm" id="docFrm" method="post" action="#">
					<div id="link_cho">
						<div id="divtitle">
							<span class="sd1">양식이름</span>
							<input type="text" id="formName" name="formName" value='${vo.formName }'>
						</div>
						<div id="link_doc">
							<span class="sd1">문서종류</span>
							<input type="text" id="typeType" name="typeType" value='${vo.typeType } // 이 부분은 수정할 수 없습니다.' readonly>
						</div>
						<div id="link_doc">
							<span class="sd1">보안수준</span>
							<input type="text" id="formSecu" name="formSecu" value='${vo.formSecu }'>
						</div>
						<div id="link_doc">
							<span class="sd1">보존년한</span>
							<input type="text" id="formLife" name="formLife" value='${vo.formLife }'>
						</div>
						<div id="link_doc">
							<span class="sd1">설명</span>
							<input type="text" id="formEx" name="formEx" value='${vo.formEx }'>
						</div>
						<div id="submitbtn">
							<input type="submit" id="submit" value="수정">
							<a id="delbtn" class="button" href="<c:url value='/confirm/adm/formDel.do?formNo=${vo.formNo }&typeNo=${vo.typeNo }'/>">삭제</a>
						</div>
						<input type="hidden" name="formNo" value="${vo.formNo }">
					</div>	
				</form>
				<!-- 상단 끝 -->
				<!-- 미드 -->
					<div id="doc_type">
						<div id="dt_head">
							<input type="text" name="doctype" value="시행기안문">
						</div>
						<div id="doc_info">
							<div>
								<label for ="docno" class="sd1">문서 번호</label>
								<input type="text" name="docno" id="docno" readonly>
							</div>
							<div>
								<label for="docreg" class="sd1">기안 일자</label>
								<input type="text" name="docreg" id="docreg" readonly>
							</div>
							<div>
								<label for="doclife" class="sd1">보존 년한</label>	
								<input type="text" name="doclife" id="doclife" value="${vo.formLife }" readonly>
							</div>
							<div>
								<label for="docsecu" class="sd1">보안수준</label>	
								<input type="text" name="docsecu" id="docsecu" value="${vo.formSecu }" readonly>
							</div>
						</div>
						<div id="confirmer">
						
						</div>
						<div class="clr"></div>			
						</div>
					</div>
					<!-- 미드 끝 -->
				<!-- 하단 끝 -->
			<!-- writeform 끝-->	
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->
<%@ include file="../../inc/bottom.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm_typeform.js'/>"></script>