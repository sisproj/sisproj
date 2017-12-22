<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_write.css'/>" rel="stylesheet" type="text/css">
			<nav>
				<ul>
					<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
					<li class="active"><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
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
			<h1><i class="fa fa-book" aria-hidden="true"></i>&nbsp;전자 결재 - 새 결재 진행&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
				<div id="linebtn">
					<input type="button" value="결재라인 지정">	
				</div>
			<!-- writeform -->	
				<!-- 상단 -->
				<div id="link_cho">
					<div id="divtitle">
						<span class="sd1">제목</span>
						<input type="text" id="doc_title">
					</div>
					<div id="link_doc">
						<span class="sd1">연계문서선택</span>
						<select id="link_doc" class="sd2">
							<!-- if(내 문서들 출력) -->
							<option value="">선택하세요</option>
							<c:forEach var="selVo" items="${docuVo }">
								<option value="${selVo.cfNo }">${selVo.cfTitle }</option>								
							</c:forEach>
						</select>
					</div>
				</div>	
				<!-- 상단 끝 -->

				<form name="writeFrm" id="writeFrm" method="post"
					action="<c:url value='/confirm/confirmOk.do'/>" enctype="multipart/form-data">
				<!-- 미드 -->
					<input type="text" name="cfStatus" id="writeType">
					<input type="text" name="allConfirmers" id="allConfirmers">
					<div id="doc_type">
						<div id="dt_head">
							<input type="text" name="formName" value="${vo.formName }" readonly>
							<input type="hidden" name="formNo" value="${param.formNo }">
						</div>
						<p id="userinfo">
							기안자 : <input type="text" name="username" value="사용자(부서이름)" readonly>
							<input type="hidden" name="empNo" value="${empNo }">
						</p>
						<div id="doc_info">
							<div>
								<label for ="docno" class="sd1">문서 번호</label> <!-- 날짜+부서번호+양식번호+문서시퀀스 -->
								<input type="text" name="cfNo" id="docno" value="${today }301${vo.formNo }${seq}" readonly>
							</div>
							<div>
								<label for="docreg" class="sd1">기안 일자</label>
								<input type="text" name="docreg" id="docreg" value="${today }" readonly>
							</div>
							<div>
								<label for="doclife" class="sd1">보존 년한</label>	
								<input type="text" name="formLife" id="doclife" value="${vo.formLife }" readonly>
							</div>
							<div>
								<label for="docsecu" class="sd1">보안수준</label>	
								<input type="text" name="formSecu" id="docsecu" value="${vo.formSecu }" readonly>
							</div>
						</div>
						<div id="confirmer">
						
						</div>					
						<div class="clr"></div>
						<div id="cf_info">
							<div class="dr">
								<label for="linkdoc" class="sd1">연계문서</label>	
								<input type="text" name="linkdoc" id="linkdoc" value="" readonly>
								<input type="hidden" name="linkCfNo" id="linkCfNo">
							</div>
							<div class="dr">
								<label for="doctitle" class="sd1">제목</label>	
								<input type="text" name="cfTitle" id="doctitle" value="" readonly>
							</div>			
							<!-- 에디터부분 -->
							<div id="smarteditor">
								<textarea name="cfContent" id="ir1" rows="20" style="width: 100%;"></textarea>
							</div>
							<!-- 에디터부분 끝 -->				
						</div>
					</div>
					<!-- 미드 끝 -->
					<!-- 하단 -->
					<div id="insFile">
						<h3><i class="fa fa-floppy-o"></i> 파일 첨부</h3>
						<label for="fileQty">파일 개수를 선택하세요.</label>
						<select name="fileQty" id="fileQty">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
						<div id="files"></div>
					</div>
				</form>
				<div id="submitbtn">
					<input type="button" id="confirmbtn" value="결재">&nbsp;&nbsp;
					<input type="button" id="savebtn" value="임시저장">	
				</div>
				<div id="choice_cfer" class='off'>
					<c:import url='/confirm/line.do'/>
				</div>
				<div id="temp"></div>
				<!-- 하단 끝 -->
			<!-- writeform 끝-->	
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->
<%@ include file="../inc/bottom.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm_write.js'/>"></script>
<script type="text/javascript">
	$(function(){
		//결재라인 지정 버튼 클릭 시 결재라인 지정 window fadeIn
		$('#linebtn input[type=button]').click(function(){
			$('#cf_ch_savedline ul li i').prop('class','fa fa-folder-o');
			$('#choice_cfer').fadeIn();
			$('#choice_cfer').attr('class','on');
		});

		var order = 0;
		//조직도에서 사원 리스트 더블클릭시 리스트에 추가
		$('#organbody ul li ul li').dblclick(function(){
			var empNo = $(this).attr('id');
			var sessempNo = '${empNo}';
			var status = $('#choice_cfer').attr('class');
			if($('#confirmers').attr('class')=='favorite' && empNo == sessempNo){
				alert('자기자신은 선택할 수 없습니다.');
				return false;
			}
			if($('#confirmers').attr('class')=='favorite' && empNo != sessempNo && status=='on'){
				if(confirm('현재 선택된 결재라인이 제거됩니다.')){
					$('#cf_ch_savedline ul li i').prop('class','fa fa-folder-o');
					$('#confirmers').html('');
					$('#confirmers').removeClass();
					order=0;
				} else {
					return false;
				}	
			}			
			
			if(order<1 && $('#confirmers').attr('class')!='favorite' && status=='on'){
				//초기 본인 세팅
				$('#confirmers').prepend("<tr class='t1'><td>1</td></tr>");
				$("#temp").load("<c:url value='/confirm/choLine.do?empNo="+sessempNo+"'/>", function(response, status, xhr) {
					if(status=='success'){
						var temp = $("#temp").html();
						$('#confirmers tr.t1').append(temp);					
					}
				});
				order+=1;
			}
			
			var exist = 0;
			$('#confirmers input[type=hidden]').each(function(){
				if($(this).val()==empNo){
					exist=1;
				}
			});

			//현재 접속자와 조직도에서 선택한 사람이 같지 않을 경우에만 처리
			if(status=='on' && exist==0 && empNo != sessempNo){
				if(order==8){alert('최대 8명까지 가능 합니다.'); return false;};
				$("#temp").load("<c:url value='/confirm/choLine.do?empNo="+empNo+"'/>", function(response, status, xhr) {
					if(status=='success'){
						$('#confirmers').append("<tr class='t"+order+"'><td>"+order+"</td></tr>");
						var temp = $("#temp").html();
						$('#confirmers tr.t'+order).append(temp);				
					}
				});
				order+=1;	
			}
		});
		
		//결재라인 지정 window 취소 버튼시 창 닫기
		$('#cf_win_close').click(function(){
			$('#choice_cfer').fadeOut();
			$('#choice_cfer').attr('class','off');
			$('#confirmers').html('');
			order=0;
		});
		
		//결재라인 지정 window에 선택된 결재자 더블클릭시 리스트에서 제거
		$('body').on('dblclick','#confirmers tr',function(){
			var thissel = $(this).find('input[type=hidden]').val();
			if($('#confirmers').attr('class')=='favorite'){
				alert('저장된 리스트는 삭제 할 수 없습니다.');
				return false;
			} else if(thissel == '${empNo}'){
				alert('본인은 삭제 할 수 없습니다.');
				return false;
			} else {
				$(this).remove();
				order-=1;
				giveOrder();
			}
		});
		
		//저장된 결재라인 리스트 클릭시 해당 리스트 추가
		$('#cf_ch_savedline ul li').click(function(){
			$('#confirmers').html('');
			$('#confirmers').attr('class','favorite');
			$('#cf_ch_savedline ul li i').prop('class','fa fa-folder-o');
			$(this).find('i').prop('class','fa fa-folder-open-o');
			var saveNo = $(this).attr('id');
			$('#confirmers').load("<c:url value='/confirm/choLine.do?saveNo="+saveNo+"'/>", function(response, status, xhr) {
				if(status=='success'){					
					giveOrder();
				}
			});
		});
		
		//결재 라인 지정 버튼 클릭시 양식에 추가
		$('#ins_cfer').click(function(){
			$('#doc_type #confirmer').html('');
			$('#confirmers tr').each(function(){
				var cf_empName = $(this).find('td.cf_empName').text();
				var cf_empPo = $(this).find('td.cf_empPo').text();
				var cf_empNo = $(this).find('input[type=hidden]').val();
				
				$('#doc_type #confirmer').append("<div id='confirmer1'><span></span><span>"+cf_empName+" "+cf_empPo+"</span><input type='hidden' name='allConfirmer' value='"+cf_empNo+"'></div>");
				$('#choice_cfer').fadeOut();
				$('#choice_cfer').attr('class','off');
			});
			
			getConfirmers();
		});
		
		//유효성
		$('#writeFrm').submit(function(){
			if($('input[name=cfTitle]').val()==''){
				alert('결재문서의 제목을 입력하세요');
				$('#doc_title').focus();
				return false;
			} else if($('textarea[name=cfContent]').val()=='<p><br></p>'){
				alert('결재문서의 내용을 입력하세요');
				$('textarea[name=cfContent]').focus();
				return false;
			} else if($('#allConfirmers').val()==''){
				alert('결재라인을 지정하세요');
				$('#linebtn input[type=button]').focus();
				return false;				
			}
		})
		//함수 : 앞 인덱스 맞춰 주기
		function giveOrder(){
			$('#confirmers tr').each(function(index){
				$(this).find('td:first-child').remove();
			});
			$('#confirmers tr').each(function(index){
				$(this).prepend("<td>"+(index+1)+"</td>");
				$(this).attr('class','t'+(index+1));
			});
		}
		
		//함수 : 결재자들 모아 hidden에 처리
		function getConfirmers(){
			$('#allConfirmers').val('');
			var empNos = "";
			$('#confirmer1 input[name=allConfirmer]').each(function(idx, item){
				empNos += ($(this).val()+",");
			});
			$('#allConfirmers').val(empNos);
		}
	});
</script>