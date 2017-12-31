$(function(){
	var pageNo = 0;
	$('header nav ul li a').each(function(idx, item){
		if($(this).hasClass('active')){
			pageNo = idx+1;
		}
	});
	
	var str = $('#bookmarkbtn span').attr('id');
	var bookmark = str.split(",");
	
	if($('#headsection h1 a i').hasClass('bookmark')){
		$('#headsection h1 a i').removeClass('bookmark');
	}

	$.each(bookmark, function(idx, item){
		if(pageNo == item){
			$('#headsection h1 a i').addClass('bookmark');
		} else {
			$('#headsection h1 a i').addClass('nobook');			
		}
	});	
	
	/*북마크 버튼*/
	$('#headsection h1 a').click(function(){
		$('header nav ul li a').each(function(idx, item){
			if($(this).hasClass('active')){
				pageNo = idx+1;
			}
		});
		
		$('#pageNo').val(pageNo);
		if($(this).find('i').hasClass('bookmark')){
			$('#markStat').val('bookmark');
		} else {
			$('#markStat').val('nobook');
		}
		
		var param = $('#bookmarkFrm').serialize();
		$.ajax({
			url:"/sisproj/bookmark/mark.do",
			type:"post",
			data:param,
			dataType:"json",
			success:function(res){
				location.reload();
			}, error:function(xhr, status, error){
				alert('에러발생 : '+status+'=>'+error);
			}
		});
	});
});