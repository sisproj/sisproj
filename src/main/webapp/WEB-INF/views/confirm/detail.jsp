<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%-- <%@ include file="../inc/top.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../inc/top.jsp"/>
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
					<li><a href="<c:url value='/confirm/postbox.do'/>"><i class="fa fa-archive"></i>&nbsp;<span>참조 수신함</span></a></li>
					<li><a href="<c:url value='/confirm/setting.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
					<c:if test="${sessionScope.empVo.empLev == '관리자' }">
						<li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
					</c:if>
				</ul>	
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;${docVo.cfTitle }(${dfName })&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
				<div id="linebtn">
					<!-- 내문서 && 임시 저장 || 결재대기 && !내문서  -->
					<c:if test="${(docVo.empNo == sessionScope.empVo.empNo && docVo.cfStatus == '임시저장') || (docVo.empNo != sessionScope.empVo.empNo && docVo.cfStatus == '결재대기' && docVo.cfConfirmer == sessionScope.empVo.empNo) }">
						<input type="button" id="cf_ok" value="결재승인">&nbsp;&nbsp;
					</c:if>
					<!-- 내문서가 아니면서 && 결재대기 이면서&& 내 결재 차례인 경우 -->
					<c:if test="${docVo.empNo != sessionScope.empVo.empNo && docVo.cfStatus == '결재대기' && docVo.cfConfirmer == sessionScope.empVo.empNo }">
						<input type="button" id="cf_return" value="결재반려">&nbsp;&nbsp;
					</c:if>
					<!-- 임시저장이거나 결재반려인경우 -->
					<c:if test="${docVo.cfStatus == '임시저장' || docVo.cfStatus == '결재반려'}">
						<input type="button" id="cf_edit" value="수정">&nbsp;&nbsp;
						<input type="button" id="cf_del" value="삭제">&nbsp;&nbsp;
					</c:if>
					<!--엑셀파일로 다운로드는 결재완료인경우만-->
					<c:if test="${docVo.cfStatus == '결재완료' }">
						<a class="button" href="<c:url value='/confirm/getXFile.do?cfNo=${docVo.cfNo }'/>">엑셀로 다운</a>
					</c:if>
				</div>
			<!-- writeform -->	
				<div name="writeFrm" id="writeFrm">
				<!-- 서식 -->
					<div id="doc_type">
						<div id="dt_head">
							<input type="text" name="doctype" value="${docVo.formName }">
						</div>
						<span></span>
						<p id="userinfo">
							기안자 : <input type="text" name="username" value="${writerEmpVo.empName }(${writerEmpVo.deptName })" readonly><br>
							현재 문서 상태 : <strong>${docVo.cfStatus }</strong>
						</p>
						<div id="doc_info">
							<div>
								<label for ="docno" class="sd1">문서 번호</label>
								<input type="text" name="docno" id="docno" value="${docVo.cfNo }" readonly>
							</div>
							<div>
								<label for="docreg" class="sd1">기안 일자</label>
								<input type="text" name="docreg" id="docreg" 
									value='<fmt:formatDate value="${docVo.cfRegdate }" pattern="yyyy-MM-dd"/>' readonly>
							</div>
							<div>
								<label for="doclife" class="sd1">보존 년한</label>	
								<input type="text" name="doclife" id="doclife" value="${docVo.formLife }" readonly>
							</div>
							<div>
								<label for="docsecu" class="sd1">보안수준</label>	
								<input type="text" name="docsecu" id="docsecu" value="${docVo.formSecu }" readonly>
							</div>
						</div>
						<div id="confirmer">
							<c:forEach var="clVo" items="${clVoList }">
								<div>
									<span>
										<c:if test="${clVo.lineStat == CL_COMPLETE}">
											<c:if test="${!empty clVo.signName}">
												<img src="<c:url value='/user_sign/${clVo.signName }'/>" alt="결재"> <!-- 결재자 사인 경로 넣기 -->
											</c:if>
											<c:if test="${empty clVo.signName}">
												<p style="color: #036">결재</p>
											</c:if>
										</c:if>
										<c:if test="${clVo.lineStat == CL_RETURN}">
											<img src="<c:url value='/user_sign/return_img.jpg'/>" alt="반려">											
										</c:if>
										<c:if test="${clVo.lineStat == CL_AWAIT }">
											
										</c:if>
									</span>
									<span>${clVo.empName } ${clVo.posName }
									<c:if test="${clVo.lineStat != '대기'}">
										<br><fmt:formatDate value="${clVo.lineRegdate }" pattern="yy-MM-dd"/>
									</c:if></span>
								</div>
							</c:forEach>
						</div>
						<div class="clr"></div>
						<div id="cf_info">
							<div class="dr">
								<label for="linkdoc" class="sd1">연계문서</label>	
								<input type="text" name="linkdoc" id="linkdoc" value="<c:if test="${!empty linkDoc }">(${linkDoc.cfNo }) ${linkDoc.cfTitle }
								</c:if>" readonly>
							</div>
							<div class="dr">
								<label for="doctitle" class="sd1">제목</label>	
								<input type="text" name="doctitle" id="doctitle" value="${docVo.cfTitle }" readonly>
							</div>			
							<!-- 내용부분 -->
							<div id="contents">
								${docVo.cfContent }
							</div>
							<!-- 내용부분 끝 -->				
						</div>
					</div>
					<!-- 미드 끝 -->
					<!-- 파일첨부 -->
					<div id="insFile">
						<h3><i class="fa fa-floppy-o"></i> 첨부된 파일</h3>
						<div id="files">
							<c:forEach var="cfVo" items="${fileList }" varStatus="status">
								<span><a href="<c:url value='/attachfile/${cfVo.fileName }'/>">${status.index+1 }. ${cfVo.fileOriName }</a> 
								/ (${(cfVo.fileSize/1024) + (((cfVo.fileSize/1024) % 1 > 0.5)?(1 - ((cfVo.fileSize/1024) % 1)) % 1:-((cfVo.fileSize/1024) % 1))}KB)</span>
								<c:if test="${status.index != fn:length(fileList) }">
									<br>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<!-- 의견 -->
					<c:if test="${docVo.cfStatus != '임시저장' }">
						<div id="cf_comment">
							<h3><i class="fa fa-commenting-o"></i> 의견 (${fn:length(commVoList) })</h3>
							<!-- 상단등록창 -->
							<c:if test="${docVo.cfStatus != '결재완료' && docVo.cfStatus != '결재반려' }">
								<form name="comm_wr" id="comm_wr" method="post" action="<c:url value='/confirm/writeComm.do'/>">
									<input type="hidden" name="cfNo" value="${docVo.cfNo }">
									<input type="hidden" name="memNo" value="${sessionScope.empVo.empNo }">
									<textarea name="commContent" id="con" placeholder="줄바꿈이 되지 않습니다."></textarea>
									<input type="submit" class="bold" value="등록">
								</form>
							</c:if>
							<!-- 상단등록창 끝 -->
							<!-- 의견리스트 -->
							<!-- 반복 -->
							<c:if test="${!empty commVoList }">
								<c:forEach var="commVo" items="${commVoList }" varStatus="status">
									<div class="selcomm" id="${commVo.commNo }">
										<div class="comm_info">
											<span class="comm_reg bold">${commVo.empName }</span> 
											<span class="comm_reg"><fmt:formatDate value="${commVo.commRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
											<span id="comm-${status.index }">
												<c:if test="${commVo.memNo == sessionScope.empVo.empNo && docVo.cfStatus != '결재완료' && docVo.cfStatus != '결재반려'}">
													<a class="comm_delete bold" href="<c:url value='/confirm/deleteComm.do?commNo=${commVo.commNo }&cfNo=${docVo.cfNo }'/>">삭제</a>&nbsp;&nbsp;&nbsp;
													<a class="comm_edit bold" id="btn_e-${status.index }" href="#comm-${status.index }">수정</a>&nbsp;&nbsp;&nbsp;<!-- 1부분 아이디 반복문 i로 돌리기 -->
												</c:if>
											</span>
										</div>
										<div class="comm_content" id="comm_con-${status.index }"><!-- 1부분 아이디 반복문 i로 돌리기 -->
											<div class="comm_con">${commVo.commContent }</div>
											<!-- 수정용 -->
											<form name="comm_ed" class="comm_ed" method="post" action="<c:url value='/confirm/editComm.do'/>">
												<textarea name="commContent">${commVo.commContent }</textarea>
												<input type="hidden" name="commNo" value="${commVo.commNo }">
												<input type="hidden" name="cfNo" value="${docVo.cfNo }">
												<input type="submit" class="bold" value="댓글 수정">
											</form>
											<!-- 수정용 끝 -->
										</div>
										<div class="clr"></div>
									</div>	
								</c:forEach>
							</c:if>
							<!-- 반복 끝 -->
							<!-- 의견리스트 끝 -->
						</div>
					</c:if>
				</div>
				<c:if test="${docVo.empNo == sessionScope.empVo.empNo && docVo.cfStatus == '결재완료' }">
					<div id="confirmRefer">
						<h3><i class="fa fa-paper-plane-o"></i> 참조 발신 <i class="fa fa-arrow-down" id="downbtn"></i></h3>
						<form name="sendFrm" id="sendFrm" method="post" action="<c:url value='/confirm/documentSend.do'/>">
							<p>조직도에서 참조 발신할 개인을 선택하거나 아래에서 부서를 선택하세요.</p>
							<div id="listeners">
								<ul><b>수신자 :</b>
								
								</ul>
							</div>
							<input type="hidden" name="cfNo" value="${docVo.cfNo }"> 
							<input type="hidden" name="allListener" id="allListener"><!-- 이따 히든 -->
							<label for="deptNo">부서 : </label> 
							<select name="deptNo">
								<option value="">부서를 선택하세요</option>
								<hr>
								<c:forEach var="dept" items="${deptList }">
									<option value="${dept.deptNo }">${dept.deptName }팀</option>
								</c:forEach>
							</select>
							<input type="button" id="resetbtn" value="초기화">
							<input type="submit" id="sendbtn" value="발신">
						</form>
					</div>
				</c:if>
				<!-- 하단 끝 -->
			<!-- writeform 끝-->
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@ include file="../inc/bottom.jsp" %>
<script type="text/javascript">
	$(function(){		
		$('input#cf_edit').click(function(){
			$(location).attr('href',"<c:url value='/confirm/edit.do?cfNo=${docVo.cfNo }'/>");
		});

		$('input#cf_del').click(function(){
			if(confirm('정말 문서를 삭제 하시겠습니까?')){
				$(location).attr('href',"<c:url value='/confirm/delete.do?cfNo=${docVo.cfNo }'/>");
			}
		});
		
		$('.comm_delete').click(function(){
			if(!confirm('정말 의견을 삭제 하시겠습니까?')){
				return false;
			}
		});
		
		$('a.comm_edit').click(function(){
			var getId = $(this).attr('id');
			var start = getId.indexOf('-');
			var num = getId.substring(start+1);
			var btn = '#comm-'+num;
			var con = '#comm_con-'+num+' .comm_con';
			var frm = '#comm_con-'+num+' .comm_ed';
			$(con).hide();
			$(btn).hide();
			$(frm).show();
		});
		$('form.comm_ed').submit(function(){
			var cont = $(this).find('textarea[name=commContent]').val();
			if(cont==''){
				return false;
			}
		});
		
		$('#cf_ok').click(function(){
			if(confirm('정말로 결재를 승인 하시겠습니까?')){
				location.href="<c:url value='/confirm/yesConfirm.do?cfNo=${docVo.cfNo }&empNo=${docVo.empNo}'/>";
			} else{
				return false;				
			}
		});
		$('#cf_return').click(function(){
			if(confirm('정말로 결재를 반려 하시겠습니까?')){
				location.href="<c:url value='/confirm/noConfirm.do?cfNo=${docVo.cfNo }&empNo=${docVo.empNo}'/>";			
			}else {
				return false;
				
			}	
		});
				
		//참조 발신 부분
		var sessempNo = ${sessionScope.empVo.empNo};
		
		$('#confirmRefer h3').click(function(){
			var sta = $('#confirmRefer').attr('class');
			
			if(sta == "up"){
				$('#confirmRefer form#sendFrm').slideUp();
				$('#confirmRefer h3 #downbtn').css('transform','rotate(0deg)');
				$('#confirmRefer').attr('class','down');
				$('#organ').css('height','40px');
				$('#orgUp').hide();
				$('#orgDown').show();
			} else {
				$('#confirmRefer form#sendFrm').slideDown();
				$('#confirmRefer h3 #downbtn').css('transform','rotate(180deg)');	
				$('#confirmRefer').attr('class','up');		
				$('#organ').css('height','500px');
				$('#orgUp').hide();
				$('#orgDown').show();
				$('#organbody').show();	
			}
		});		
		
		
		//조직도 이름 더블 클릭시
		$('#organbody ul li ul li').dblclick(function(){
			//창 오픈
			$('#confirmRefer form#sendFrm').slideDown();
			$('#confirmRefer h3 #downbtn').css('transform','rotate(180deg)');	
			$('#confirmRefer').attr('class','up');
			
			var empNo = $(this).attr('id');
			
			//본인 선택시 막기
			if(empNo == sessempNo){
				alert('자기자신은 선택할 수 없습니다.');
				return false;
			}
			
			//이미 리스트 존재시 막기
			var exist = 0;
			$('#listeners li .listener').each(function(){
				if($(this).val()==empNo){
					exist=1;
				}
			});
			
			if(exist==0){
				$.ajax({
					url:"<c:url value='/confirm/settingConfirmer.do'/>",
					type:"get",
					data:"empNo="+empNo,
					dataType:"json",
					success:function(res){
						$('#listeners ul').append("<li>"+res.empName+" "+res.posName+" ("+res.empNo+")<input type='hidden' class='listener' value='"+res.empNo+"'></li>");
					},
					error : function(xhr,status,error){
						alert("에러발생 : "+status+"==>"+error);
					}
				});
			}
		});
		
		//부서 선택 시 부서원 전체 로드
		$('#sendFrm select').change(function(){
			var deptNo = $(this).find('option:selected').val();

			if(deptNo!=0){
				$('#listeners ul').html('<b>수신자 :</b>');
				
				$.ajax({
					url:"<c:url value='/confirm/settingListener.do'/>",
					type:"get",
					data:"deptNo="+deptNo,
					dataType:"json",
					success:function(res){
						$.each(res,function(idx, item){
							$('#listeners ul').append("<li>"+item.empName+" "+item.posName+" ("+item.empNo+")<input type='hidden' class='listener' value='"+item.empNo+"'></li>");
						});
					},
					error:function(xhr,status,error){
						alert("에러발생 : "+status+"==>"+error);					
					}
				});
			}
		});
		
		//초기화 버튼
		$('#sendFrm input[type=button]').click(function(){
			//리스트 초기화
			$('#listeners ul').html('<b>수신자 :</b>');
			$('#sendFrm select').val('');
		});
		
		//유효성 : 수신자 없으면 발신안됨
		$('#sendbtn').click(function(){
			getConfirmers();
			
			if($('#allListener').val()==''){
				alert('수신자를 선택하세요.')
				return false;
			} else if(!confirm($('#allListener').val()+" 에게 발송 하시겠습니까?")){
				return false;
			}
		});
			
		//함수 : 수신자들 모아 hidden에 처리
		function getConfirmers(){
			$('#allListener').val('');
			var empNos = "";
			var maxCnt = $('input.listener').length-1;
			$('input.listener').each(function(idx, item){
				empNos += $(this).val();
				if(maxCnt!=idx){
					empNos += ",";
				}
			});
			$('#allListener').val(empNos);
		}
	});
</script>