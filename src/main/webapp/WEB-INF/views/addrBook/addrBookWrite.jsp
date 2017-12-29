<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="addrBookTop.jsp"%>
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function(){
		$('#email3').hide();	
		$('frm [name=frmWrite]').submit(function(){
			if($('#addrName').val()==''){
				alert("이름을 입력하세요");
				$('#addrName').focus();
			}
			if($('#hp2').val()=='' || $('#hp3').val()==''){
				alert("핸드폰 번호를  입력하세요");
			}else{
				var hp=$('#hp1').val()+"-"+$('#hp2').val()+"-"$('#hp3').val();
				$('#addrTel').val(hp);
			}
			
			if($('#email2').val()=='etc'){
				$('#email3').show();
				$('#email3').focus();
				var email=$('#email1').val()+"@"+$('#email3').val();
				$('#addrEmail').val(email);
			}else{		
				var email=$('#email1').val()+"@"+$('#email2').val();
				$('#addrEmail').val(email);
			}
		});
	});
</script>
<style>
	#divWriteSection{
		width: 560px;
		height: 290px;
		border: 1px solid rgb(195, 195, 195);
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

<!-- 3. 내용 -->
<article id="bodysection">
	
</article>
 <!-- 3. 내용 끝 -->

    <%@include file="addrBookBottom.jsp" %>
