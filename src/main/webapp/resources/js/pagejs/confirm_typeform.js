	$(function(){
		$('#formName').change(function(){
			var title = $(this).val();
			$('#doc_type #dt_head input[name=doctype]').val(title);
		});
		$('#formLife').change(function(){
			var title = $(this).val();
			$('#doc_info #doclife').val(title);
		});
		$('#formSecu').change(function(){
			var title = $(this).val();
			$('#doc_info #docsecu').val(title);
		});
		
		$('#docFrm').submit(function(){
			if($('#formName').val()==""){
				alert('양식이름을 입력해야 합니다.');
				$('#formName').focus();
				return false;
			} else if($('#typeType').val()==""){
				alert('문서종류를 입력해야 합니다.');
				$('#typeType').focus();
				return false;				
			}
		});
		
		$('#submitbtn #delbtn').click(function(){
			if(!confirm('정말로 삭제 하시겠습니까?')){
				return false;
			}
		});		
		
		$('#cf_choice #doc_type a').click(function(){
			$('#cf_choice #doc_type a i').attr('class', 'fa fa-folder');
			$(this).find('i').attr('class','fa fa-folder-open');
			
			$('#cf_choice #doc_form .dd a').hide();
			var docType = $(this).attr('class');
			var open = '#cf_choice #doc_form .dd a.'+docType;
			$(open).show();
		});
	});