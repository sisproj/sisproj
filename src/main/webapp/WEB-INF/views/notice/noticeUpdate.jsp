<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/admTop.jsp" %>
<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>

		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;공지 사항&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
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
		
		$('#btUpdate').click(function(){
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
		$('form[name=formUpdate]').submit(function(){
			submitContents();		
		});
	});
	
	
	</script>
	<div class="container" style="max-width: 1045px;">
		<div class="row">
			<form name="formUpdate" method="post"
				action="<c:url value='/notice/noticeUpdate.do'/>"
				enctype="multipart/form-data" onsubmit="return send(this)">
				<input type="hidden" name="notiNo" value="${vo.notiNo }">
				<input type="hidden" name="empNo" value="${vo.empNo }">
				<input type="hidden" name="oldFileName" value="${vo.notiFilename }">
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
								name="notiContent" id="ir1" maxlength="2048" style="height: 480px;">${vo.notiContent }
							</textarea></td>
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
							<c:if test="${!empty vo.notiFilename }">
					            <br>
					            <span class="sp1">&nbsp</span>
					            <span style="color:darkgreen; display:inline-block; float: right;">            
				            		※첨부파일을 새로 지정할 경우 기존파일 ${fileInfo }는 삭제됩니다.</span>
				            </c:if>	
						</tr>
					</tbody>
				</table>
				<!-- <input type="submit" class="btn btn-primary" id="btUpdate" value="글수정"> -->
				<a href="noticeList.do" class="btn btn-primary">목록</a>
				<button type="submit" class="btn btn-primary pull-right" id="btUpdate">글수정</button>
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



