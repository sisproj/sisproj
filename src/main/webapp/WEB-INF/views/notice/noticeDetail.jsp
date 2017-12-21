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
			<div class="container" style="max-width: 1045px;">
				<div class="row">
					<table class="table table-striped"
						style="text-align: center; border-collapse: collapse; border: 1px solid #c5bdbd;">
						<thead>
							<tr>
								<th colspan="3"	style="background-color: #eeeeee; text-align: conter;">공지사항 상세보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 20%;">글 제목</td>
								<td colspan="2">${vo.notiTitle}</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2">${vo.empNo}</td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="2" style="max-height: 400px; height: 380px; text-align: left;">${vo.notiContent}</td>
							</tr>
						</tbody>
					</table>
					<a href="noticeList.do" class="btn btn-primary">목록</a>
					<a href="noticeUpdate.do?notiNo=${param.notiNo}" class="btn btn-primary">수정</a>
					<a href="deleteAction.jsp?bbsID=" class="btn btn-primary">삭제</a>
					<a href="noticeWrite.do" class="btn btn-primary pull-right">글쓰기</a>
				</div>
			</div>
				<!-- 3. 내용 끝 -->
</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript">
			$(function(){
				$('header nav ul li:nth-child(8) a').addClass('active');
			});
		</script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@include file="../inc/bottom.jsp" %>