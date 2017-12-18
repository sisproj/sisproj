<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>
<!-- 0. include부분 -->
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li><a href="newcho.html"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
					<li><a href="save.html"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
					<li><a href="await.html"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
					<li><a href="complete.html"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
					<li><a href="return.html"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
					<li><a href="setting.html"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
					<li><a href="typeform.html"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
				</ul>	
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;공지 사항&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
	<div class="container">
		<div class="divForm">
			<form name="frmEdit" method="post" action="edit_ok.jsp"
				onsubmit="return send(this)">
				<!-- 수정 처리시 필요한 no를 hidden 필드에 넣는다 -->
				<input type="hidden" name="no" value="">

				<fieldset>
					<legend>글수정</legend>
					<div class="firstDiv">
						<label for="title">제목</label> <input type="text" id="title"
							name="title" value="" />
					</div>
					<div>
						<label for="name">작성자</label> <input type="text" id="name"
							name="name" value="" />
					</div>
					<div>
						<label for="pwd">비밀번호</label> <input type="password" id="pwd"
							name="pwd" />
					</div>
					<div>
						<label for="email">이메일</label> <input type="text" id="email"
							name="email" value="" />
					</div>
					<div>
						<label for="content">내용</label>
						<textarea id="content" name="content" rows="12" cols="40"></textarea>
					</div>
					<div class="center">
						<input type="submit" value="수정" /> <input type="Button"
							value="글목록" onclick="location.href	='list.jsp'" />
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript">
			$(function() {
				$('header nav ul li:nth-child(8) a').addClass('active');
			});
		</script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@include file="../inc/bottom.jsp" %>