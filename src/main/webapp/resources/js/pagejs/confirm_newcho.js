$(function(){				
	$('.dd a').click(function(){
		var docNo = $(this).attr('id');
		$('#form_no').val(docNo);
	});
	
	$('#doc_type a').click(function(){
		$('#doc_type a i').attr('class', 'fa fa-folder');
		$(this).find('i').attr('class','fa fa-folder-open');
		
		$('#doc_form .dd a').hide();
		$('#cf_choice #doc_form .dd').css('background-color', '');
		var docType = $(this).attr('class');
		var open = '#doc_form .dd a.'+docType;
		$(open).show();
	});
	
	$('#cf_choice #doc_form .dd').click(function(){
		$('#cf_choice #doc_form .dd').css('background-color', '');
		$(this).css('background-color', '#d1d1d1');
	});
	
	$('#choicebtn').submit(function(){
		if($('#choicebtn #form_no').val()==""){
			alert('결재 문서 양식이 지정 되지 않았습니다.');
			return false;
		}
	});
});