<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../inc/admTop.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_instypeform.css'/>" rel="stylesheet" type="text/css">
		<!-- 0. include부분 -->
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;신규 결재 양식 등록&nbsp;</h1>
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
							<input type="text" id="formName" name="formName">
						</div>
						<div id="link_doc">
							<span class="sd1">문서종류</span>
							<input type="text" id="typeType" name="typeType" placeholder="지금 등록되는 문서 종류는 수정이 불가합니다.">
						</div>
						<div id="link_doc">
							<span class="sd1">보안수준</span>
							<input type="text" id="formSecu" name="formSecu">
						</div>
						<div id="link_doc">
							<span class="sd1">보존년한</span>
							<input type="text" id="formLife" name="formLife">
						</div>
						<div id="link_doc">
							<span class="sd1">설명</span>
							<input type="text" id="formEx" name="formEx">
						</div>
						<div id="submitbtn">
							<input type="submit" id="submit" value="등록">
						</div>
					</div>	
				</form>
				<!-- 상단 끝 -->
				<!-- 미드 -->
					<div id="doc_type">
						<div id="dt_head">
							<input type="text" name="doctype" value="" readonly>
						</div>
						<div id="doc_info">
							<div>
								<label for ="docno" class="sd1">문서 번호</label>
								<input type="text" name="docno" id="docno" value="" readonly>
							</div>
							<div>
								<label for="docreg" class="sd1">기안 일자</label>
								<input type="text" name="docreg" id="docreg" value="" readonly>
							</div>
							<div>
								<label for="doclife" class="sd1">보존 년한</label>	
								<input type="text" name="doclife" id="doclife" value="" readonly>
							</div>
							<div>
								<label for="docsecu" class="sd1">보안수준</label>	
								<input type="text" name="docsecu" id="docsecu" value="" readonly>
							</div>
						</div>
						<div id="confirmer">
						
						</div>
						<div class="clr"></div>	
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