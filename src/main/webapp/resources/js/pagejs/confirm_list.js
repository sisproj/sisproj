function movePage(currentP){
	document.frmPaging.currentPage.value=currentP;
	document.frmPaging.submit();
}
$(function(){
	$('#search input[type=button]').click(function(){
		var sk = $('#search #searchKey').val()
		$('form[name=frmPaging] input[name=searchKeyword]').val(sk);
		movePage(1);
	});	
});