<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="../inc/top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#divWriteSection').hide();
		$('#groupList').hide();
		$('.myAddress').hover(function(){
			$('#groupList').show();
			var empNo="empNo="+${sessionScope.empVo.empNo};
			/* alert(empNo); */
			$('#groupList ul').val("");
			$.ajax({
				url:"<c:url value='/addrBook/groupList.do'/>",
				data:empNo,
				dataType:"json",
				type:"get",
				success:function(res){
					$('#groupList ul').html("<li>   전체주소록<ul></ul></li>");
					if(res.length>0 ){
						$.each(res, function(idx, item){				
							$('#groupList ul li ul').append("<li>    └ "+item.groupName+"</li>");
						});							
					}else{
						$('#searchResult ul li ul').html("<li>그룹을 생성하세요</li>");
					}					
				},
				error:function(xhr, status, error){
					alert("에러 : "+status+"=>"+error);
				}
			
			});			
		},function(){
			$('#groupList').hide();
		});

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
			$('#divWriteSection').show();
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
			alert(hp);
			
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
			alert("email1:"+email1);
			alert("email2:"+email2);
			alert("email3:"+email3);
			alert("email:"+email);
			
			$('#frmWrite').submit();
			
		});
		$('#btCancel').click(function(){
			$('#divWriteSection').hide();
		});
		$('#btCancelU').click(function(){
			$('#divUpdateSection').hide();
		});
		
		$('#listName').click(function(){
			$('#divUpdateSection').show();
		});
		
		$('#email2').change(function(){
			if($('#email2').val()=='etc'){
				$('#email3').css('visibility','visible');
				$('#email3').focus();
				$('#email3').val('');
			}
		});
		$('#selectMenu select option:selected').change(function(){
			var countPerPage=$('#countPerPage').val();
			countPerPage=$(this).val();
			
			$('#frmList').prop('action', '<c:url value="/addrBook/pageCount.do"/>');
			$('#frmList').submit();
			
		});
		
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
    		margin: 20px, 0, 0, 0;
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
    	#bodysection div{
    		margin: 10px;
    	}
    	.divAddrBody{
    		height: 570px;
    		margin-top: 10px;
    	}
    	.divAddrBody table{
    		border-collapse: collapse;
    		width: 100%;
    	}
    	.divAddrBody table tr{
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
			height: 120px;
			border: 1px solid #333;
			top:310px;
			left:298px;			
			background-color: #fff;
			transition : all 500ms linear;
			z-index: 9999;
			cursor: pointer;
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
	}
	.divWriteBody, .divUpdateBody{
		width: 530px;
		height:230px;
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
	.divWriteBody input, .divUpdateBody input{
		line-height: 20px;
		width: 120px;
	}
	.divWriteBody select, .divUpdateBody select{
		height: 24px;
	}
	#btSubmit, #btEdit{
		border: 1px solid rgb(195, 195, 195);
		padding: 5px;
		width: 60px;
	}
	#btCancel, #btCancelU{
		border: 1px solid rgb(195, 195, 195);
		padding: 5px;
		width: 60px;
		margin-left: 10px;
	}
	#btSubmit i, #btEdit i{
		color: #0f0;
	}
	#btCancel i,#btCancelU i{
		color: #f00;
	}
	.center{
		text-align: center;
		padding: 10px;
	}
    </style>
<!-- 0. include부분 -->
	
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li id="addressList"><a href="#"><i class="fa fa-address-book-o"></i>&nbsp;<span>내 주소록</span>
                	<i id="myAddressRight" class="myAddress fa fa-chevron-right"></i></a>
                </li>
                <li id="addressWrite"><a href="#"><i class="fa fa-user-plus"></i>&nbsp;<span>연락처 추가</span></a></li>
                <li><a href="#"><i class="fa fa-users"></i>&nbsp;<span>그룹 추가</span></a></li>
                <li><a href="<c:url value='/addrBook/addrBookTrash.do'/>"><i class="fa fa-trash"></i>&nbsp;<span>휴지통</span></a></li>
                <li><a href="#"><i class="fa fa-cog"></i>&nbsp;<span>환경설정</span></a></li>
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
       


    
    
    