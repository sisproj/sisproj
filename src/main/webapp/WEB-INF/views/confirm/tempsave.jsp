<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_tempsave.css'/>" rel="stylesheet" type="text/css">
<!-- 0. include부분 -->
		<nav>
			<ul>
				<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
				<li><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
				<li class="active"><a href="<c:url value='/confirm/tempsave.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
				<li><a href="<c:url value='/confirm/await.do'/>"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
				<li><a href="<c:url value='/confirm/complete.do'/>"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
				<li><a href="<c:url value='/confirm/return.do'/>"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
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
		<h1><i class="fa fa-book"></i>&nbsp;전자 결재 - 임시 저장함&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
		<!-- 2. 페이지 이름 지정 끝 -->
	</article>	
	<article id="bodysection">
		<!-- 3. 내용 -->
		<div id="wrap">
			<div id="search" class="bold">
				검색어 : <input type="text" name="searchKey" id="searchKey" placeholder="문서번호, 제목, 내용">
				<input type="button" value="검색">
			</div>
			<table id="awaittb">
				<thead>
					<tr>
						<th></th>
						<th>문서번호</th>
						<th>제목</th>
						<th>양식이름</th>
						<th>기안일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td><a href="#">시행기안문</a></td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="select" value=""></td>
						<td>20171211102030001</td>
						<td>시행기안문</td>
						<td>기안서</td>
						<td>20171211</td>
					</tr>
				</tbody>
			</table>
			<div id="pagingbtn">
				<div>
				<a href="#"><span><i class="fa fa-arrow-left"></i></span></a>
				<a href="#"><span><i class="fa fa-chevron-left"></i></span></a>
				<a href="#"><span>1</span></a>
				<a href="#"><span>2</span></a>
				<a href="#"><span>3</span></a>
				<a href="#"><span>4</span></a>
				<a href="#"><span>5</span></a>
				<a href="#"><span>6</span></a>
				<a href="#"><span>7</span></a>
				<a href="#"><span>8</span></a>
				<a href="#"><span>9</span></a>
				<a href="#"><span>10</span></a>
				<a href="#"><span><i class="fa fa-chevron-right"></i></span></a>
				<a href="#"><span><i class="fa fa-arrow-right"></i></span></a>
				</div>
			</div>
		</div>
		<!-- 3. 내용 끝 -->
	</article>
	<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
	<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@ include file="../inc/bottom.jsp" %>