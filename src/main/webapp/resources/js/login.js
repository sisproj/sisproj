$(function(){
	$('#loginbtn').click(function(){
		if($('#userid').val()==""){
			$('#errormsg').text('아이디를 입력해주세요');
			$('#userid').focus();
			return false;
		} else if($('#pwd').val()==""){
			$('#errormsg').text('비밀번호를 입력해주세요');
			$('#pwd').focus();
			return false;
		}
		$('#loginfrm').submit();
	});
});