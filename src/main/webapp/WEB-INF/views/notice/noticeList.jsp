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
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #eeeeee">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">번호</th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								<th style="background-color: #eeeeee; text-align: center;">조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>									
								<td>안녕하세요.</td>									
								<td>홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
							<tr>
								<td>2</td>									
								<td>2안녕하세요.</td>									
								<td>2홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
							<tr>
								<td>3</td>									
								<td>3안녕하세요.</td>									
								<td>3홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
							<tr>
								<td>4</td>									
								<td>3안녕하세요.</td>									
								<td>3홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
							<tr>
								<td>5</td>									
								<td>3안녕하세요.</td>									
								<td>3홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
							<tr>
								<td>6</td>									
								<td>3안녕하세요.</td>									
								<td>3홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
							<tr>
								<td>7</td>									
								<td>3안녕하세요.</td>									
								<td>3홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
							<tr>
								<td>8</td>									
								<td>3안녕하세요.</td>									
								<td>3홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
							<tr>
								<td>9</td>									
								<td>3안녕하세요.</td>									
								<td>3홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
							<tr>
								<td>10</td>									
								<td>3안녕하세요.</td>									
								<td>3홍길동</td>									
								<td>2015-05-05</td>								
								<td>0</td>								
							</tr>
						</tbody>
					</table>
					<a href="#" class="btn btn-success btn-arrow-left">이전</a>
					<a href="#" class="btn btn-success btn-arrow-left">다음</a>
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