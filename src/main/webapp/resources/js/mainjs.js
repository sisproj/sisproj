$(function(){
	/*로그인정보 부분 슬라이드*/
	$('#loginfo p').on("click", function(){
		$('#loglist').slideToggle();
	});
	/*로그인정보부분 section 클릭시 close*/
	$('section').on("click", function(){
		$('#loglist').slideUp();
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
	
	$('#headsection').prepend("<form id='bookmarkFrm' name='bookmarkFrm' method='post' action='/sisproj/bookmark/mark.do'><input type='hidden' id='pageNo' name='pageNo'><input type='hidden' id='markStat' name='markStat'></form>");
	$('body').append("<script type='text/javascript' src='/sisproj/resources/js/bookmark.js'></script>");
});