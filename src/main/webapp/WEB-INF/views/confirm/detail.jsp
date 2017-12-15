<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_detail.css'/>" rel="stylesheet" type="text/css">
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
					<li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
				</ul>	
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;문서제목(양식이름)&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
				<div id="linebtn">
					<input type="button" id="cf_ok" value="결재승인">&nbsp;&nbsp;
					<input type="button" id="cf_not" value="결재반려">&nbsp;&nbsp;
					<input type="button" id="cf_edit" value="수정">&nbsp;&nbsp;
					<input type="button" id="cf_del" value="삭제">&nbsp;&nbsp;
					<input type="button" id="cf_re" value="재 상신">	
				</div>
			<!-- writeform -->	
				<div name="writeFrm" id="writeFrm">
				<!-- 서식 -->
					<div id="doc_type">
						<div id="dt_head">
							<input type="text" name="doctype" value="시행기안문">
						</div>
						<p id="userinfo">
							기안자 : <input type="text" name="username" value="사용자(부서이름)" readonly>
							<input type="hidden" name="userno" value="회원번호">
						</p>
						<div id="doc_info">
							<div>
								<label for ="docno" class="sd1">문서 번호</label>
								<input type="text" name="docno" id="docno" value="20171011102030001" readonly>
							</div>
							<div>
								<label for="docreg" class="sd1">기안 일자</label>
								<input type="text" name="docreg" id="docreg" value="20171011" readonly>
							</div>
							<div>
								<label for="doclife" class="sd1">보존 년한</label>	
								<input type="text" name="doclife" id="doclife" value="5년" readonly>
							</div>
							<div>
								<label for="docsecu" class="sd1">보안수준</label>	
								<input type="text" name="docsecu" id="docsecu" value="중" readonly>
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
						<div id="cf_info">
							<div class="dr">
								<label for="linkdoc" class="sd1">연계문서</label>	
								<input type="text" name="linkdoc" id="linkdoc" value="(20171010102031001) 시행기안문" readonly>
							</div>
							<div class="dr">
								<label for="doctitle" class="sd1">제목</label>	
								<input type="text" name="doctitle" id="doctitle" value="" readonly>
							</div>			
							<!-- 내용부분 -->
							<div id="contents">
								<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid #cccccc; border-left:0; border-bottom:0;" class="__se_tbl"><tbody>
<tr><td style="border:1px solid #cccccc; border-top:0; border-right:0; background-color:#ffffff" width="693"><p>&nbsp;dadads</p></td>
<td style="border:1px solid #cccccc; border-top:0; border-right:0; background-color:#ffffff" width="693"><p>&nbsp;213123</p></td>
</tr>
<tr><td style="border:1px solid #cccccc; border-top:0; border-right:0; background-color:#ffffff" width="693"><p>&nbsp;sadasd</p></td>
<td style="border:1px solid #cccccc; border-top:0; border-right:0; background-color:#ffffff" width="693"><p>&nbsp;1234123</p></td>
</tr>
</tbody>
</table><p><br></p>
							</div>
							<!-- 내용부분 끝 -->				
						</div>
					</div>
					<!-- 미드 끝 -->
					<!-- 파일첨부 -->
					<div id="insFile">
						<h3><i class="fa fa-floppy-o"></i> 파일 첨부</h3>
						<div id="files">
							<span><a href="#">파일이름.jsp</a></span><br>
							<span><a href="#">파일이름.jsp</a></span><br>
							<span><a href="#">파일이름.jsp</a></span><br>
							<span><a href="#">파일이름.jsp</a></span>
						</div>
					</div>
					<!-- 의견 -->
					<div id="cf_comment">
						<h3><i class="fa fa-commenting-o"></i> 의견</h3>
						<!-- 상단등록창 -->
						<form name="comm_wr" id="comm_wr" method="post" action="#">
							<input type="hidden" name="title" value="Hello">
							<input type="hidden" name="board" value="페이지정보">
							<input type="hidden" name="mem_no" value="작성자no">
							<textarea name="con" id="con"></textarea>
							<input type="submit" class="bold" value="등록">					
						</form>
						<!-- 상단등록창 끝 -->
						<!-- 의견리스트 -->
						<!-- 반복 -->
						<div class="selcomm">
							<div class="comm_info">
								<span class="comm_reg bold">작성자</span> 
								<span class="comm_reg">등록일</span>
								<span id="comm-1"><!-- 1부분 아이디 반복문 i로 돌리기 -->
									<a class="comm_delete bold" href="#">삭제</a>
									<a class="comm_edit bold" id="hello_e-1" href="#">수정</a><!-- 1부분 아이디 반복문 i로 돌리기 -->
								</span>
							</div>
							<div class="comm_con">내용<br>내용<br>내용<br>내용<br>내용<br></div>
							<!-- 수정용 -->
							<div class="comm_content" id="comm_con-1"><!-- 1부분 아이디 반복문 i로 돌리기 -->
								<form name="comm_ed" class="comm_ed" method="post" action="#">
									<textarea name="con"></textarea>
									<input type="submit" class="bold" value="댓글 수정">
									<input type="hidden" name="no" value="의견번호">
									<input type="hidden" name="board" value="페이지정보">
								</form>
							</div>
							<!-- 수정용 끝 -->
						</div>	
						<div class="selcomm">
							<div class="comm_info">
								<span class="comm_reg bold">작성자</span> 
								<span class="comm_reg">등록일</span>
								<span id="comm-1"><!-- 1부분 아이디 반복문 i로 돌리기 -->
									<a class="comm_delete bold" href="#">삭제</a>
									<a class="comm_edit bold" id="hello_e-1" href="#">수정</a><!-- 1부분 아이디 반복문 i로 돌리기 -->
								</span>
							</div>
							<div class="comm_con">내용<br>내용<br>내용<br>내용<br>내용<br></div>
							<!-- 수정용 -->
							<div class="comm_content" id="comm_con-1"><!-- 1부분 아이디 반복문 i로 돌리기 -->
								<form name="comm_ed" class="comm_ed" method="post" action="#">
									<textarea name="con"></textarea>
									<input type="submit" class="bold" value="댓글 수정">
									<input type="hidden" name="no" value="의견번호">
									<input type="hidden" name="board" value="페이지정보">
								</form>
							</div>
							<!-- 수정용 끝 -->
						</div>	
						<!-- 의견리스트 끝 -->
						<!-- 반복 끝 -->
					</div>
				</div>
				<!-- 하단 끝 -->
			<!-- writeform 끝-->	
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@ include file="../inc/bottom.jsp" %>