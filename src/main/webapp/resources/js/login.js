$(function(){
	$('#loginbtn').click(function(){
		if($('#empNo').val()==""){
			$('#errormsg').text('아이디를 입력해주세요');
			$('#empNo').focus();
			return false;
		} else if($('#empPwd').val()==""){
			$('#errormsg').text('비밀번호를 입력해주세요');
			$('#empPwd').focus();
			return false;
		}
		$('#loginfrm').submit();
	});
});