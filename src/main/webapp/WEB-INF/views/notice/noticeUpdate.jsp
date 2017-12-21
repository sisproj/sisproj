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
	<script type="text/javascript">
	
	$(function(){
		$('#btUpdate').click(function(){
			if($('#notiTitle').val()==''){
				alert("제목을 입력하세요");
				$('#notiTitle').focus();
				return false;
			}
			if($('#notiContent').val()==''){
				alert("내용을 입력하세요");
				$('#notiContent').focus();
				return false;
			}
			return true;
		});
	});
	
	/* 	function send(form){
			if(form.notiTitle.value=""){
				alert("제목을 입력하세요");
				form.notiTitle.focus();
				return false;
			}else if(form.notiContent.value=""){
				alert("내용을 입력하세요");
				form.notiContent.focus();
				return false;
			}
		
		return true; 
		}*/
	</script>
	<div class="container" style="max-width: 1045px;">
		<div class="row">
			<form name="formUpdate" method="post"
				action="<c:url value='/notice/noticeUpdate.do'/>"
				onsubmit="return send(this)">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #c5bdbd;">
					<thead>
						<tr>
							<th colspan="2"	style="background-color: #eeeeee; text-align: center;">공지사항 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="notiTitle" id="notiTitle" maxlength="50" 
								value="${vo.notiTitle }"></td>
						</tr>
						<tr>
							<td class="active"><textarea class="form-control" placeholder="글 내용"
								name="notiContent" id="notiContent" maxlength="2048" style="height: 480px;">${vo.notiContent }
							</textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글수정">
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
		</script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@include file="../inc/bottom.jsp" %>



