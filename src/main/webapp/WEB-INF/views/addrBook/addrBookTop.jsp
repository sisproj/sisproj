<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="../inc/top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#groupList').mouseleave(function(){
			$(this).css('visibility', 'hidden');
		});
		$('.myAddress').mouseenter(function(){
			$('#groupList').css('visibility', 'visible');
			var empNo="empNo="+${sessionScope.empVo.empNo};
			/* alert(empNo); */
			$('#groupList ul').val("");
			$.ajax({
				url:"<c:url value='/addrBook/groupList.do'/>",
				data:empNo,
				dataType:"json",
				type:"get",
				success:function(res){
					$('#groupList ul').html("<li>   <span id='0'>전체주소록</span><ul></ul></li>");
					if(res.length>0 ){
						$.each(res, function(idx, item){				
							$('#groupList ul li ul').append("<li>    <span id='"+item.groupNo+"'>└ "+item.groupName+"</span></li>");
						});						
						
						$('#groupList li span').click(function(){
							var groupNo=$(this).attr('id');							
							$('#frmList #groupNo').val(groupNo);
							$('#frmList').submit();							
						$('#groupList').css('visibility', 'hidden');
						}); 		
						
													
					}else{
						$('#searchResult ul li ul').html("<li>그룹을 생성하세요</li>");
					}					
				},
				error:function(xhr, status, error){
					alert("에러 : "+status+"=>"+error);
				}			
			});			
		});//////
		
		
		
		$('.divAddrBody table td').hover(function(){
			$(this).parent().css('background','rgb(245,245,245)');
		},function(){
			$(this).parent().css('background','white');
		});
		
		$('#checkAll').click(function() {
			if($("#checkAll").prop("checked")) {
				//전체 checkbox들을 체크해준다 
				$("td input[type=checkbox]").prop("checked",true); 
			} else { 
				//모든 checkbox들의 체크해제
				$("td input[type=checkbox]").prop("checked",false); 
			}
		});
		
		$('.divAddrBody table tr:eq(0)').css('border-bottom','1px solid rgb(195, 195, 195)');
		
		$('#addressWrite').click(function(){
			$('#divWriteSection').css('visibility', 'visible');
			$('#divUpdateSection').css('visibility', 'hidden');
			$('#divInsertGroup').css('visibility', 'hidden');
		});
		
		/* 연락처 입력 */
		$('#btSubmit').click(function(){
			if($('#addrName').val()==''){
				alert("이름을 입력하세요");
				$('#addrName').focus();
				return false;
			}
			var hp="";
			if($('#hp2').val()=='' || $('#hp3').val()==''){
				alert("핸드폰 번호를  입력하세요");
				$('#hp2').focus();
				return false;
			}else{
				hp=$('#hp1 option:checked').val()+"-"+$('#hp2').val()+"-"+$('#hp3').val();
			}
			$('#addrTel').val(hp);

			var email1 = $('#email1').val();
			var email2 = $('#email2 option:selected').val();
			var email3 = $('#email3').val();
			var email="";
			
			if($('#email2').val()=="etc"){
				if($('#email1').val()!="" && $('#email3').val()!=""){
					email=email1+"@"+email3;
				}
			}else if($('#email1').val()!="" && $('#email2').val()!=""){
				email=email1+"@"+email2;
			}
			$('#addrEmail').val(email);
			
			$('#frmWrite').submit();
			
		});
		$('#btCancel').click(function(){
			$('#divWriteSection').css('visibility', 'hidden');
		});
		$('#btCancelU').click(function(){
			$('#divUpdateSection').css('visibility', 'hidden');
		});	
		
		/* 리스트의 이름 클릭시 수정창 띄우며 정보 보여주기 */
		$('#addrTable tbody tr td:nth-child(2) ').click(function(){
			$('#divUpdateSection').css('visibility', 'visible');
			$('#divWriteSection').css('visibility', 'hidden');
			$('#divInsertGroup').css('visibility', 'hidden');
			
			$('#addrNameUpdate').val('');
			$('#hp1Update').val('010');
			$('#hp2Update').val('');
			$('#hp3Update').val('');
			$('#email1Update').val('');
			$('#email2Update').val('naver.com');
			$('#email3Update').val('');
			$('#addrCompUpdate').val('');
			$('#groupNoUpdate').val('');
			
			var addrNo="addrNo="+$(this).attr('id');
			$.ajax({
				url:"<c:url value='/addrBook/displayUpdate.do'/>",
				data:addrNo,
				type:"get",
				dataType:"json",
				success:function(res){
					$('#addrNoUpdate').val(res.addrNo);
					$('#addrNameUpdate').val(res.addrName);
					$('#addrCompUpdate').val(res.addrComp);
					$('#groupNoUpdate').val(res.groupNo);
					var hpArr=(res.addrTel).split('-');
					$('#hp1Update').val(hpArr[0]);
					$('#hp2Update').val(hpArr[1]);
					$('#hp3Update').val(hpArr[2]);
					
					if(res.addrEmail !='' && res.addrEmail !=null){
						var emailArr=(res.addrEmail).split('@');

						$('#email1Update').val(emailArr[0]);

						if(emailArr[1]=="naver.com" || emailArr[1]=="hanmail.net" 
								|| emailArr[1]=="nate.com" || emailArr[1]=="gmail.com"){
							$('#email2Update').val(emailArr[1]);
							$('#email3Update').css('visibility','hidden');
						} else {
							$('#email2Update').val('etc');
							$('#email3Update').css('visibility','visible');
							$('#email3Update').val(emailArr[1]);								
						}
					}
				},
				error:function(xhr, status, error){
					alert("에러 : "+status+"=>"+error);
				}
			});
		});
		
		$('#email2Update').change(function(){
			if($('#email2Update').val()=='etc'){
				$('#email3Update').css('visibility','visible');
				$('#email3Update').focus();
				$('#email3Update').val('');
			}else if($('#email2Update').val()!='etc'){
				$('#email3Update').css('visibility','hidden');
			}
		});
		$('#email2').change(function(){
			if($('#email2').val()=='etc'){
				$('#email3').css('visibility','visible');
				$('#email3').focus();
				$('#email3').val('');
			}else if($('#email2').val()!='etc'){
				$('#email3').css('visibility','hidden');
			}
		});
		
		
		/* 연락처 수정버튼 클릭 */
		$('#btEdit').click(function(){
			if($('#addrNameUpdate').val()==''){
				alert("이름을 입력하세요");
				$('#addrNameUpdate').focus();
				return false;
			}
			var hp="";
			if($('#hp2Update').val()=='' || $('#hp3Update').val()==''){
				alert("핸드폰 번호를  입력하세요");
				$('#hp2Update').focus();
				return false;
			}else{
				hp=$('#hp1Update option:checked').val()+"-"+$('#hp2Update').val()+"-"+$('#hp3Update').val();
			}
			$('#addrTelUpdate').val(hp);
			
			var email1 = $('#email1Update').val();
			var email2 = $('#email2Update option:selected').val();
			var email3 = $('#email3Update').val();
			var email="";
			
			if($('#email2Update').val()=="etc"){
				if($('#email1Update').val()!="" && $('#email3Update').val()!=""){
					email=email1+"@"+email3;
				}
			}else if($('#email1Update').val()!="" && $('#email2Update').val()!=""){
				email=email1+"@"+email2;
			}
			$('#addrEmailUpdate').val(email);
			
			$('#frmUpdate').submit();
		});
		
		
		/* 그룹추가 영역 */
		$('#insertGroup').click(function(){
			$('#divInsertGroup').css('visibility','visible');
			$('#divWriteSection').css('visibility', 'hidden');
			$('#divUpdateSection').css('visibility', 'hidden');
			$('#groupName').val('');
			
			var empNo="empNo="+${sessionScope.empVo.empNo};
			$.ajax({
				url:"<c:url value='/addrBook/groupList.do'/>",
				data:empNo,
				type:"get",
				dataType:"json",
				success:function(res){
					$('.divInsertGroupList table tr').html("");
					if(res.length>0 ){
						$.each(res, function(idx, item){
							var groupName="<tr><td>"+item.groupName+"</td><td><a href='<c:url value='/addrBook/deleteGroup.do?groupNo="+item.groupNo+"'/>'>삭제</a></td></tr>";
							$('.divInsertGroupList table tbody').append(groupName);							
						});
					}	
				},
				error:function(xhr, status, error){
					alert("에러 : "+status+"=>"+error);
				}
			});
		});
		
		$('#btNewGroup').click(function(){
			if($('#groupName').val()==''){
				alert("그룹명을 입력하세요");
				$('#groupName').focus();
				return false;
			}
			$('#frmNewGroup').submit();
		});
				
		$('#btExit').click(function(){
			$('#divInsertGroup').css('visibility','hidden');
		});
		
		/*그룹추가 영역 끝*/

	});
</script>
    <style>
    	#bodysection > div{
    		background: #fff;
    		margin: 0;
    	}
    	#divBodysection{
    		background: #fff;
    		padding: 5px;
    		width: 77%;
    		margin: 0 auto;
    	}
    	#addressList .myAddress{
    		width:50px; 
    		height:50px;
    		line-height:50px;
    		display:block;
    		float: right;    
    		text-align: center;		
    	}
    	.divAddrHeader{
    		overflow: hidden;
    	}
    	.divAddrHeader div{
    		float: left;
    		border: 1px solid rgb(195, 195, 195);
    		margin-right: 20px;
    		padding: 5px;
    		background-color: white;
    	}
    	.divAddrHeader div input{
    		border: none;
    		padding: 1px 0;
    	}
    	#addrSearch{
    		color: rgb(195, 195, 195);
    	}
    	.divAddrBody{
    		height: 570px;
    		margin-top: 10px;
    		overflow: auto;
    	}
    	.divAddrBody table, .divInsertGroupList table{
    		border-collapse: collapse;
    		width: 100%;
    	}
    	.divAddrBody table tr, .divInsertGroupList table tr{
    		border-bottom: 1px solid rgb(245,245,245);
    		border-top: 1px solid rgb(195,195,195);
    		background-color: #fff;
    	}
    	.divAddrBody table th, td{
    		text-align: center;
    		padding: 10px;
    	}
    	#paging{
    		/* border: 1px solid rgb(195, 195, 195); */
    		height: 50px;
    		text-align: center;
    		vertical-align: top;
    	}
    	#selectMenu{
    		float: right;
    	}
    	#selectMenu select{
    		border: 0;
    	}		
		#groupList{
			position : fixed;
			width: 100px;
			border: 1px solid #333;
			top:310px;
			left:298px;			
			background-color: #fff;
			transition : all 500ms linear;
			z-index: 9999;
			cursor: pointer;
			visibility: hidden;
		}
		#groupList ul > li{
			list-style: none;
			padding: 2px;
		}
		#groupList li ul li:hover{
			background-color: rgb(245,245,245);
		}
		
		/* 연락처 입력부분 */
	#divWriteSection, #divUpdateSection{
		width: 560px;
		height: 290px;
		border: 1px solid rgb(195, 195, 195);
		position: fixed;
		left: 40%;
		visibility: hidden;
	}
	#divWriteSection h3{
		padding:15px;
	}
	
	#divInsertGroup{
		width: 440px;
		border: 1px solid rgb(195, 195, 195);
		position: fixed;
		left: 40%;
		visibility: hidden;
	}
	.divWriteBody, .divUpdateBody{
		width: 530px;
		height:230px;
		padding: 10px;
	}
	.divInsertGroupList{
		width: 400px;
		padding: 10px;
	}
	.divInsertNewGroup{
		width: 400px;
		height : 50px;
		padding: 10px;
	}
	.divWriteBody label, .divUpdateBody label{
		width: 20%;
		float: left;
		text-align: right;
		padding: 3px 15px 0 0;
		clear: left;
		font-weight: bold;
	}
	.divWriteBody input, .divUpdateBody input {
		line-height: 20px;
		width: 120px;
	}
	.divInsertNewGroup input{
		line-height: 27px;
		width: 183px;
		align:absmiddle;
		margin-right: 40px;
	}
	.divWriteBody select, .divUpdateBody select{
		height: 24px;
	}
	#btSubmit, #btEdit, #btNewGroup{
		border: 1px solid rgb(195, 195, 195);
		padding: 5px;
		width: 60px;
	}
	#btCancel, #btCancelU, #btExit{
		border: 1px solid rgb(195, 195, 195);
		padding: 5px;
		width: 60px;
		margin-left: 10px;
	}
	#btSubmit i, #btEdit i, #btNewGroup i{
		color: #0f0;
	}
	#btCancel i,#btCancelU i, #btExit i{
		color: #f00;
	}
	.center{
		text-align: center;
		padding: 10px;
	}
	.divWriteBody form div{
		margin-bottom: 10px;
	}
    </style>
<!-- 0. include부분 -->
	
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li id="addressList"><a href="<c:url value='/addrBook/addrBookList.do'/>"><i class="fa fa-address-book-o"></i>&nbsp;<span>내 주소록</span>
                	<i id="myAddressRight" class="myAddress fa fa-chevron-right"></i></a>
                </li>
                <li id="addressWrite"><a href="#"><i class="fa fa-user-plus"></i>&nbsp;<span>연락처 추가</span></a></li>
                <li id="insertGroup"><a href="#"><i class="fa fa-users"></i>&nbsp;<span>그룹 추가 / 삭제</span></a></li>
                <li><a href="<c:url value='/addrBook/addrBookTrash.do'/>"><i class="fa fa-trash"></i>&nbsp;<span>휴지통</span></a></li>
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    
	<!-- 내주소록 클릭시 그룹리스트 보여주기 -->		
    <div id="groupList">
       	<ul>
       		            		
       	</ul>                	
    </div>
	<!-- 내주소록 그룹 리스트 끝 -->
	
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <hr>
    
    <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
    <article id="headsection">
        <h1>
        	<i class="fa fa-phone"></i>&nbsp;주소록&nbsp;
        	<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a>
        </h1>
    </article>
    <!-- 2. 페이지 이름 지정 끝 -->
    
   <!--  주소록 - include 영역 시작 -->
   
    
   
   <!--  주소록 - include 영역 끝 -->
       


    
    
    