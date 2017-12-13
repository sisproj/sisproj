<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_setting.css'/>" rel="stylesheet" type="text/css">
<!-- 0. include부분 -->
			<nav>
			<ul>
				<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
				<li><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
				<li><a href="<c:url value='/confirm/tempsave.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
				<li><a href="<c:url value='/confirm/await.do'/>"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
				<li><a href="<c:url value='/confirm/complete.do'/>"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
				<li><a href="<c:url value='/confirm/return.do'/>"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
				<li class="active"><a href="<c:url value='/confirm/setting.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
				<li><a href="<c:url value='/confirm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
			</ul>	
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-cog"></i>&nbsp;결재 환경 설정&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
			<div id="cf_settings">
				<ul>
					<li><a href="#tabs-1">결재서명등록</a></li>
					<li><a href="#tabs-2">결재라인등록</a></li>
				</ul>
				<div id="tabs-1">
					<h3>결재서명등록</h3>
					<div id="sign_img">
						<p>현재등록된 이미지</p>
						<img src="<c:url value='/resources/user_sign/app_sign.gif'/>" alt="사인"><br>
						<span id="signfname">app_sign.gif</span><br><br>
						<form name="updateSign" id="updateSign" method="post" action="#" enctype="multipart/form-data">
							<input type="hidden" name="oldfilename" value="">
							<input type="file" name="upfile" id="upfile" value="" accept="image/*">
							<input type="button" id="udSign" value="등록">
						</form>
					</div>
				</div>
				<div id="tabs-2">
					<h3>결재라인등록</h3>
					<div id="savelinebtn"><input type="button" value="신규등록" onclick="location.href='#'"></div>
					<div id="save_line">
						<div id="cf_line">
							<h3>결재라인</h3>
							<div><i class="fa fa-folder-open"></i> 기안용</div>
							<div><i class="fa fa-folder"></i> 지출결의서용</div>
						</div>
						<div id="line_detail">
							<form name="detail" id="detail" method="post" action="#">
								<h3>[기안용]상세정보</h3>
								<table>
									<thead>
										<tr>
											<th>순서</th>
											<th>부서</th>
											<th>직급</th>
											<th>이름</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>인사</td>
											<td>사원</td>
											<td>홍홍홍</td>
										</tr>
										<tr>
											<td>2</td>
											<td>인사</td>
											<td>팀장</td>
											<td>김팀장</td>
										</tr>
										<tr>
											<td>3</td>
											<td>총무</td>
											<td>차장</td>
											<td>주차장</td>
										</tr>
										<tr>
											<td>4</td>
											<td></td>
											<td>대표이사</td>
											<td>오대표</td>
										</tr>
									</tbody>
								</table>
								<div id="detailbtn">	
									<input type="submit" value="수정">&nbsp;
									<input type="button" value="삭제" onclick="location.href='#'">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript">
			$(function(){
				$('header nav ul li:nth-child(6) a').addClass('active');
			});
		</script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@ include file="../inc/bottom.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm_setting.js'/>"></script>