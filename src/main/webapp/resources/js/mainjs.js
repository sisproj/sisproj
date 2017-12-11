$(function(){
	/*로그인정보 부분 슬라이드*/
	$('#loginfo p').on("click", function(){
		$('#loglist').slideToggle();
	});
	/*로그인정보부분 section 클릭시 close*/
	$('section').on("click", function(){
		$('#loglist').slideUp();
	});
	/*왼쪽 메뉴 슬라이드*/
	$('#listbtn p').on("click", function(){
		var cname = $('#listbtn').attr('class');
		if(cname=='hidden'){
			$('aside').animate({
				width:'298px'
			});
			$('#listbtn').attr('class','show');
			$(this).html('<i class="fa fa-chevron-circle-left" style="text-align: center;">');
			$('section article').animate({
				width: 'calc(100%-300px)',
				'margin-left':'300px'
			});
			$('aside nav ul li a span').show();
			$('aside #loginfo').delay(500).css('display','block');
		} else {
			$('aside').animate({
				width:'50px'
			});
			$('#listbtn').attr('class','hidden');
			$(this).html('<i class="fa fa-chevron-circle-right" aria-hidden="true"></i>');
			$('section article').animate({
				width: 'calc(100%-50px)',
				'margin-left':'80px'
			});
			$('aside nav ul li a span').hide();
			$('aside #loginfo').hide();
		}
	});
	/*북마크 창*/
	$('#bookmarkbtn').on("click",function(){
		var cname = $('#bookmark').attr('class');
		if(cname=='hidden'){
			$('#bookmark').css({
				width: '140px',
				'min-height': '0',
				padding: '10px',						
			});
			$('#bookmark i').css({
				'line-height':'0'						
			});
			$('#bookmark ul li a span, #bookmarkbtn span').show();
			$('#bookmark').attr('class','show');
		} else {
			$('#bookmark').css({
				width: '40px',
				'min-height': '40px',
				padding: '0',						
			});
			$('#bookmark i').css({
				'line-height':'40px'						
			});
			$('#bookmark ul li a span, #bookmarkbtn span').hide();
			$('#bookmark').attr('class','hidden');
			
		}
	});
	/*최신 뉴스 5개 롤링*/
	$('footer div div').css('animation','newsrolling 15s infinite');
	setInterval(function(){
		setTimeout(function(){
			$('footer div div').css('top', '0px');
		}, 15000);
	},15500);
});