<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/resources/css/pagecss/confirm_cho.css'/>" rel="stylesheet" type="text/css">
<c:import url="/inc/top.do"></c:import>

<!-- 0. include부분 -->
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li class="active"><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
					<li><a href="<c:url value='/confirm/save.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
					<li><a href="<c:url value='/confirm/await.do'/>"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
					<li><a href="<c:url value='/confirm/complete.do'/>"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
					<li><a href="<c:url value='/confirm/return.do'/>"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
					<li><a href="<c:url value='/confirm/setting.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
					<li><a href="<c:url value='/confirm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
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
					<a href="#"><p><i class="fa fa-folder-open"></i>업무</p></a>
					<a href="#"><p><i class="fa fa-folder"></i> 근태</p></a>
				</div>
				<div id="doc_form">
					<div class="dh">
						<span class="sh1">양식 이름</span>
						<span class="sh2">설명</span>
					</div>
					<div class="dd">
						<a href="#">
							<span class="sd1">기안서</span>
							<span class="sd2">시행기안문</span>
						</a>
					</div>
					<div class="dd">
						<a href="#">
							<span class="sd1">기안서</span>
							<span class="sd2">시행기안문</span>
						</a>
					</div>
				</div>
				<input type="hidden" id="form_name">
				<div class="clr"></div>
				<div id="writebtn"><input type="button" value="작성" onclick="location.href='<c:url value="/confirm/write.do"/>'"></div>	
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
<c:import url="/inc/bottom.do"></c:import>