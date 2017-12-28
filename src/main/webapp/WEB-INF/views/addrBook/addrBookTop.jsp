<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="../inc/top.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#groupList').hide();
		$('.myAddress').click(function(){
			$('#groupList').show();
			var empNo="empNo="+${sessionScope.empVo.empNo};
			var groupList="";
			$.ajax({
				url:"<c:url value='/addrBook/groupList.do'/>",
				data:empNo,
				dataType:"json",
				type:"get",
				success:function(res){
					groupList+="<li>전체주소록</li><ul></ul>";
					if(res.length>0 ){					
						$.each(res, function(idx, item){
							$(groupList).append("<li>└ "+item.groupNameme+"</li>");
						});							
					}					
					$('#groupList').html(groupList);
				},
				error:function(xhr, status, error){
					alert("에러 : "+status+"=>"+error);
				}
			});			
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
		$('#btCancel').click(function(){
			$('#divWriteSection').hide();
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
			height: 100px;
			border: 1px solid rgb(245,245,245);
			top:299px;
			left:298px;
			width:300px;
			background-color: #ff0;
			transition : all 500ms linear;
		}
		
		/* 연락처 입력부분 */
	#divWriteSection{
		width: 560px;
		height: 290px;
		border: 1px solid rgb(195, 195, 195);
		position: fixed;
		left: 40%;
	}
	.divWriteBody{
		width: 530px;
		height:230px;
		padding: 10px;
	}
	.divWriteBody label{
		width: 20%;
		float: left;
		text-align: right;
		padding: 3px 15px 0 0;
		clear: left;
		font-weight: bold;
	}
	.divWriteBody input{
		line-height: 20px;
		width: 120px;
	}
	.divWriteBody select{
		height: 24px;
	}
	#btSubmit{
		border: 1px solid rgb(195, 195, 195);
		padding: 5px;
		width: 60px;
	}
	#btCancel{
		border: 1px solid rgb(195, 195, 195);
		padding: 5px;
		width: 60px;
		margin-left: 10px;
	}
	#btSubmit i{
		color: rgb(181,230,29);
	}
	#btCancel i{
		color: rgb(255,0,128);
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
       		<li><a href="<c:url value='/addrBook/addrBookList.do'/>">전체 주소록</a>
       			<ul>
       				<%-- <c:import url="/addrBook/addrGroupList.do"/> --%>
       				<!-- <li><a href="#">└ 가족</a></li> -->        				
       			</ul>
       		</li>                		
       	</ul>                	
    </div>
	<!-- 내주소록 그룹 리스트 끝 -->
	
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <hr>
    
    <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
    <article id="headsection">
        <h1>
        	<i class="fa fa-phone"></i>&nbsp;주소록&nbsp;
        	<a href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
        </h1>
    </article>
    <!-- 2. 페이지 이름 지정 끝 -->
    
   <!--  주소록 - include 영역 시작 -->
   
   
   <!--  주소록 - include 영역 끝 -->
       


    
    
    