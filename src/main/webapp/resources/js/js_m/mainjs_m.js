$(function(){
	$("#navSlideBtn").click(function(){
		$("header nav").slideToggle();
	});
	
	$("aside #loginfo #asidebtn ul li:nth-child(2)").appendTo("header nav ul");
	$("aside #loginfo #asidebtn ul li:last-child a").prepend("<i class='fa fa-sign-out'></i> ");
	$("header nav ul").appendTo("aside");
	if($("aside nav > ul").length){
		$("aside nav ul").appendTo("header nav");
	} else {
		$("#navSlideBtn").hide();
	}
	
	$("aside > ul li:nth-child(2) a").prepend("<i class='fa fa-phone'></i>");
	$("aside > ul li:nth-child(3) a").prepend("<i class='fa fa-calendar-check-o'></i>");
	$("aside > ul li:nth-child(4) a").prepend("<i class='fa fa-calendar'></i>");
	$("aside > ul li:nth-child(5) a").prepend("<i class='fa fa-book'></i>");
	$("aside > ul li:nth-child(6) a").prepend("<i class='fa fa-clock-o'></i>");
	$("aside > ul li:nth-child(7) a").prepend("<i class='fa fa-floppy-o'></i>");
	$("aside > ul li:nth-child(8) a").prepend("<i class='fa fa-bullhorn'></i>");
	$("aside > ul li:nth-child(9) a").prepend("<i class='fa fa-newspaper-o'></i>");
	$("aside > ul li:nth-child(10) a").prepend("<i class='fa fa-comments'></i>");

	$("#mainNavButton").click(function(){
		if($(this).hasClass('hide')){
			//보여주는 곳
			$("aside").fadeIn();
			$(this).css({
				top:'10px',
				bottom:''
			});
			$(this).html("<i class='fa fa-times'></i>");
			$(this).attr("class","show");
		} else if($(this).hasClass('show')) {
			//가리는 곳
			$("aside").fadeOut();
			$(this).css({
				bottom:'10px',
				top:''
			});
			$(this).html("<i class='fa fa-th'></i>");
			$(this).attr("class","hide");
		}
	})
	/*최신 뉴스 5개 롤링*/
	$('footer div div').css('animation','newsrolling 15s infinite');
	setInterval(function(){
		setTimeout(function(){
			$('footer div div').css('top', '0px');
		}, 15000);
	},15500);
});