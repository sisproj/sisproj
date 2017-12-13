<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_instypeform.css'/>" rel="stylesheet" type="text/css">
		<!-- 0. include부분 -->
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
					<li><a href="<c:url value='/confirm/tempsave.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
					<li><a href="<c:url value='/confirm/await.do'/>"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
					<li><a href="<c:url value='/confirm/complete.do'/>"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
					<li><a href="<c:url value='/confirm/return.do'/>"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
					<li><a href="<c:url value='/confirm/setting.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
					<li class="active"><a href="<c:url value='/confirm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
				</ul>	
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;신규 결재 양식 등록&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
			<!-- writeform -->	
				<!-- 상단 -->
				<form name="docFrm" id="docFrm" method="post" action="#" enctype="multipart/form-data">
				<div id="link_cho">
					<div id="divtitle">
						<span class="sd1">양식이름</span>
						<input type="text" id="doc_name">
					</div>
					<div id="link_doc">
						<span class="sd1">문서종류</span>
						<input type="text" id="doc_title">
					</div>
					<div id="link_doc">
						<span class="sd1">문서종류번호</span>
						<input type="text" id="doc_title">
					</div>
					<div id="link_doc">
						<span class="sd1">보안수준</span>
						<input type="text" id="doc_title">
					</div>
					<div id="link_doc">
						<span class="sd1">보존년한</span>
						<input type="text" id="doc_title">
					</div>
					<div id="submitbtn">
						<input type="button" id="submit" value="등록">
					</div>
				</div>	
				</form>
				<!-- 상단 끝 -->
				<!-- 미드 -->
					<div id="doc_type">
						<div id="dt_head">
							<input type="text" name="doctype" value="시행기안문">
						</div>
						<div id="doc_info">
							<div>
								<label for ="docno" class="sd1">문서 번호</label>
								<input type="text" name="docno" id="docno" value="" readonly>
							</div>
							<div>
								<label for="docreg" class="sd1">기안 일자</label>
								<input type="text" name="docreg" id="docreg" value="" readonly>
							</div>
							<div>
								<label for="doclife" class="sd1">보존 년한</label>	
								<input type="text" name="doclife" id="doclife" value="" readonly>
							</div>
							<div>
								<label for="docsecu" class="sd1">보안수준</label>	
								<input type="text" name="docsecu" id="docsecu" value="" readonly>
							</div>
						</div>
						<div id="confirmer">
							<div>
								<span><img src="../user_sign/app_sign.gif" alt="결재"></span>
								<span>결재자1</span>
							</div>
							<div>
								<span><img src="../user_sign/app_sign.gif" alt="결재"></span>
								<span>결재자2</span>
							</div>
							<div>
								<span><img src="../user_sign/app_sign.gif" alt="결재"></span>
								<span>결재자3</span>
							</div>
							<div>
								<span><img src="../user_sign/app_sign.gif" alt="결재"></span>
								<span>결재자4</span>
							</div>
							<div>
								<span><img src="../user_sign/app_sign.gif" alt="결재"></span>
								<span>결재자5</span>
							</div>
							<div>
								<span><img src="../user_sign/app_sign.gif" alt="결재"></span>
								<span>결재자6</span>
							</div>
							<div>
								<span><img src="../user_sign/app_sign.gif" alt="결재"></span>
								<span>결재자7</span>
							</div>
							<div>
								<span><img src="../user_sign/app_sign.gif" alt="결재"></span>
								<span>결재자8</span>
							</div>
						</div>
						<div class="clr"></div>			
						</div>
					</div>
					<!-- 미드 끝 -->
				<!-- 하단 끝 -->
			<!-- writeform 끝-->	
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

<%@ include file="../../inc/bottom.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#doc_name').change(function(){
			var title = $(this).val();
			$('#doc_type #dt_head input[name=doctype]').val(title);
		});
	});
</script>