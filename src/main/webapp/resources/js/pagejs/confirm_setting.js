
	function fileCheck(obj){
		var pathpoint = obj.value.lastIndexOf(".");
		var filepoint = obj.value.substring(pathpoint+1,obj.length);
		var filetype = filepoint.toLowerCase();
		if(filetype == 'bmp'){
			alert('bmp파일은 업로드가 불가능 합니다.');
			return false;
		} else if(filetype != 'jpg' && filetype != 'jpeg' && filetype != 'gif' && filetype != 'png'){
			alert('이미지파일만 업로드가 가능합니다.');
			return false;
		} else {
			$('#updateSign').submit();		
		}
	}
	
	$(function(){
		$('#udSign').click(function(){
			var res = false;
			if($('#upfile').val()!=""){
				return fileCheck(document.getElementById('upfile'));
			}

			$('#updateSign').submit();
		});

		$( "#cf_settings" ).tabs();
	});