<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>
<!-- 0. include부분 -->
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li class="active"><a href="<c:url value='/notice/noticeList.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>공지사항 홈</span></a></li>
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
								<td colspan="2">${vo.empName}</td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2">${vo.notiRegdate}</td>
							</tr>
							<tr>
								<td>조회수</td>
								<td colspan="2">${vo.notiReadcnt}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="2" style="max-height: 400px; height: 330px; text-align: left;">${vo.notiContent}
								<br>
								<img src="<c:url value='/pds_upload_noti/${vo.notiFilename}'/>" alt="${vo.notiOfilename}">
								</td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td><a href
="<c:url value='/notice/download.do?notiNo=${vo.notiNo}&fileName=${vo.notiFilename}'/>">
								${fileInfo }</a>
								${downInfo }</td>
							</tr>
						</tbody>
					</table>
						<a href="noticeList.do" class="btn btn-primary">목록</a>
					<c:if test="${sessionScope.empVo.empLev=='관리자'}">
						<a href="noticeUpdate.do?notiNo=${param.notiNo}" class="btn btn-primary">수정</a>
						<a href="#" class="btn btn-primary" onclick="del(${param.notiNo })">삭제</a>
						<a href="noticeWrite.do" class="btn btn-primary pull-right">글쓰기</a>
					</c:if>
					<form id="frmDelete" name="frmDelete" method="post" action="<c:url value='/notice/noticeDelete.do'/>">
						<input type="hidden" name="notiNo" value="${param.notiNo }">
						<input type="hidden" name="notiFilename" value="${vo.notiFilename}">
					</form>
				</div>
			</div>
				<!-- 3. 내용 끝 -->
</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript">
			$(function(){
				$('header nav ul li:nth-child(8) a').addClass('active');
			});
			
			function del(notiNo){
				if(confirm("삭제하시겠습니까?")){
					$('#frmDelete').submit();
				}
			}
			
		</script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@include file="../inc/bottom.jsp" %>