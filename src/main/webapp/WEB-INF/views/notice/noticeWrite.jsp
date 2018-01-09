<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/admTop.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>">
<script type="text/javascript"
	src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>
<!-- 왼쪽 사이드 메뉴 끝 -->
<article id="headsection">
	<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
	<h1>
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;공지 사항&nbsp;
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
	<!-- 3. 내용 -->
	<script type="text/javascript">
	
	$(function(){
		/**
		 * write부분 js파일
		 */
		function submitContents() {
			 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		}

		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1",
			sSkinURI: "/sisproj/resources/se2/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
		
		$('#btWrite').click(function(){
			if($('#notiTitle').val()==''){
				alert("제목을 입력하세요");
				$('#notiTitle').focus();
				return false;
			}
			/* if($('#notiContent').val()==''){
				alert("내용을 입력하세요");
				$('#notiContent').focus();
				return false;
			} */
			if($('#notiCategory').val()=='0'){
				alert("카테고리를 선택하세요");
				$('#notiCategory').focus();
				return false;
			}
			return true;
		});
		$('form[name=formWrite]').submit(function(){
			submitContents();		
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
			<form name="formWrite" method="post"
				action="<c:url value='/notice/noticeWrite.do'/>"
				enctype="multipart/form-data" onsubmit="return send(this)">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #c5bdbd;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">공지사항
								글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="notiTitle" id="notiTitle"
								maxlength="50"></td>
						</tr>
						<tr class="active">
							<td><textarea class="form-control" placeholder="글 내용"
									id="ir1" name="notiContent" maxlength="2048"
									style="height: 430px;"></textarea></td>
						</tr>
						<tr>
							<td style="text-align: left;">
							<select name="notiCategory" id="notiCategory">
								<option value="0">선택하세요</option>
								<option value="[공지]">[공지]</option>
								<option value="[채용]">[채용]</option>
								<option value="[행사]">[행사]</option>
								<option value="[프로젝트]">[프로젝트]</option>
							</select>
							<input type="file" id="upfile" name="upfile" 
								style="display:inline-block; float: right;" />
						</tr>
					</tbody>
				</table>
				<%-- <input type="Button" class="btn btn-primary pull-right" value="목록으로"
					onclick="location.href='<c:url value="/notice/noticeList.do"/>'" /> --%>
				<a href="<c:url value='/notice/noticeList.do'/>" class="btn btn-primary">목록</a>
				<!-- <input type="submit" class="btn btn-primary pull-right" id="btWrite" value="글쓰기"> -->
				<button type="submit" class="btn btn-primary pull-right" id="btWrite">글쓰기</button>
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

<%@include file="../inc/bottom.jsp"%>