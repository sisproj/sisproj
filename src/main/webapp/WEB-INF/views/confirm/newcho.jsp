<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_cho.css'/>" rel="stylesheet" type="text/css">


<!-- 0. include부분 -->
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li class="active"><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
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
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;전자 결재 - 새 결재 진행&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>
		<article id="bodysection">
			<!-- 3. 내용 -->
			
			<div id="cf_choice">
				<h2>양식 선택</h2>
				<div id="doc_type">
					<h3>문서종류</h3>
					<c:forEach var="typeList" items="${docTypeList }">
						<a href="#" class='${typeList.typeNo }'><p><i class="fa fa-folder"></i> ${typeList.typeType }</p></a>
					</c:forEach>
				</div>
				<div id="doc_form">
					<div class="dh">
						<span class="sh1">양식 이름</span>
						<span class="sh2">설명</span>
					</div>			
					<c:forEach var="formList" items="${docFormList }">
						<div class="dd">
							<a href="#" id="${formList.formNo }" class="${formList.typeNo }"><!-- 양식번호 아이디로 받기, 종류번호는 클래스로 받기 -->
								<span class="sd1">${formList.formName }</span>
								<span class="sd2">${formList.formEx}</span>
							</a>
						</div>
					</c:forEach>
				</div>
				
				<div class="clr"></div>
				<div id="writebtn">
					<form name="choicebtn" id="choicebtn" method="post" action="<c:url value='/confirm/write.do'/>">
						<input type="hidden" id="form_no" name="formNo" value="">
						<input type="submit" value="작성">
					</form>
				</div>	
			</div>
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->
<%@ include file="../inc/bottom.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm_newcho.js'/>"></script>