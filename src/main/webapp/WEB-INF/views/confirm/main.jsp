<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_main.css'/>" rel="stylesheet" type="text/css">

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
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;전자 결재&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
				<div class="cf_infobox">
					<a href="<c:url value='/confirm/tempsave.do'/>">
						<ul>
							<li>${tempsaveCnt } / ${tempsaveCntAll }</li>
							<li>임시 저장함</li>
						</ul>	
					</a>
					<a href="<c:url value='/confirm/await.do'/>">
						<ul>
							<li>${awaitCnt } / ${awaitCntAll }</li>
							<li>결재 대기함</li>
						</ul>	
					</a>
					<a href="<c:url value='/confirm/complete.do'/>">
						<ul>
							<li>${completeCnt } / ${completeCntAll }</li>
							<li>결재 완료함</li>
						</ul>	
					</a>
					<a href="<c:url value='/confirm/return.do'/>">
						<ul>
							<li>${returnCnt } / ${returnCntAll }</li>
							<li>결재 반려함</li>
						</ul>
					</a>
				</div>
				<div class="clr"></div>
				<div id="await" class="cfmain_table">
					<h3><i class="fa fa-hdd-o"></i> 결재 대기함</h3>
					<table>
						<thead>
							<tr>
								<th>제목</th>
								<th>기안자</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty awaitList }">
								<tr>
									<td colspan="3">문서가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty awaitList }">
								<c:forEach var="awaitVo" items="${awaitList }">
									<tr>
										<td><a href="<c:url value='/confirm/detail.do?cfNo=${awaitVo.cfNo }'/>">${awaitVo.cfTitle }</a></td>
										<td>${awaitVo.empName }</td>
										<td><fmt:formatDate value="${awaitVo.cfRegdate }" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>			
				</div>
				<div id="complete" class="cfmain_table">
					<h3><i class="fa fa-file-text"></i> 결재 완료함</h3>
					<table>
						<thead>
							<tr>
								<th>제목</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty completeList }">
								<tr>
									<td colspan="2" align="center">문서가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty completeList }">
								<c:forEach var="compleVo" items="${completeList }">
									<tr>
										<td><a href="<c:url value='/confirm/detail.do?cfNo=${compleVo.cfNo }'/>">${compleVo.cfTitle }</a></td>
										<td><fmt:formatDate value="${compleVo.cfRegdate }" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->
<%@ include file="../inc/bottom.jsp" %>