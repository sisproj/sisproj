<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../inc/admTop.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_typeform.css'/>" rel="stylesheet" type="text/css">
<!-- 0. include부분 -->
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
	                <li><a href="<c:url value='/employee/employeeRegister.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>사원 등록</span></a></li>
	                <li><a href="<c:url value='/employee/employeeList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>사원 리스트 </span></a></li>         
	                <li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>결재양식관리 </span></a></li>                          
	                <li><a href="<c:url value='/commue/commueDateList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>일별 근태현황 </span></a></li>                          
	                <li><a href="<c:url value='/commue/commueMonthList.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>월별 근태현황 </span></a></li>                          
	                <li><a href="<c:url value='/notice/noticeWrite.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>공지사항 등록 </span></a></li>                          
	                <li><a href="<c:url value='/news/newsWrite.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스등록 </span></a></li>                          
	                <li><a href="<c:url value='/news/newsRegdit.do'/>"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;<span>SIS 뉴스관리 </span></a></li>  
				</ul>	
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;결재 양식&nbsp;</h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>
		<article id="bodysection">
			<!-- 3. 내용 -->
			<div id="cf_choice">
				<h2>양식 선택</h2>
				<div id="writebtn"><input type="button" value="신규등록" onclick="location.href='<c:url value="/confirm/adm/instypeform.do"/>'"></div>
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
							<a href="<c:url value='/confirm/adm/uptypeform.do?formNo=${formList.formNo }'/>" id="${formList.formNo }" class="${formList.typeNo }"><!-- 양식번호 아이디로 받기, 종류번호는 클래스로 받기 -->
								<span class="sd1">${formList.formName }</span>
								<span class="sd2">${formList.formEx}</span>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->
<%@ include file="../../inc/bottom.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm_typeform.js'/>"></script>