


$(function(){
	if (window.PIE) {
		$('.rounded').each(function() {
			PIE.attach(this);
		});
	}

	//GNB
	var $gnbWrap = $("#hnn-header"),
			$gnbLi = $("#hnn-gnb > li"),
			$gnbBg = $(".hnn-bg"),
			gnbAni = "easeInOutExpo",
			gnbBaPosition = [233,73],
			gnbSpd = 200;
	$gnbLi.mouseenter(function(){
		$gnbLi.children("div").slideDown(gnbSpd,gnbAni);
		$gnbBg.slideDown(gnbSpd,gnbAni);
	});
	$gnbWrap.mouseleave(function(){
		$gnbLi.children("div").stop().slideUp(gnbSpd,gnbAni);
		$gnbBg.stop().slideUp(gnbSpd,gnbAni);
	});


	//SNB
	var $snbLi = $('#hnn-navi > ul > li');
	$snbLi.on('mouseenter',function(){
		$(this).children('ul').stop(true).slideDown('fast');
	}).on('mouseleave',function(){
		$(this).children('ul').stop(true).slideUp('fast');
	});
	//퀵메뉴
	$(document).ready(function(){
		$(window).scroll(function() {
			var ST = $(window).scrollTop();
			if( ST > 540){
				$('#hnn-aside').addClass("sc1");
			}else if( ST < 540 ){
				$('#hnn-aside').removeClass("sc1");
			}
		});
	});
});

//LANG
var lang = {
	init : function(){
		this.action();
	},
	action : function(){
		var set = {
			lang : $('#hnn-lang')
		};
		var langSpd = 300;

		set.lang.children('a').on({
			"click" : function(){
				if(set.lang.hasClass('active')){
					set.lang.removeClass('active');
					$(this).next('ul').slideUp(langSpd);
				}else{
					set.lang.addClass('active');
					$(this).next('ul').slideDown(langSpd);
				}
			}
		});
	}
}

//팝업
$(function(){
	var $layer = $('#hnn-layer'),
			$layerClose = $layer.find('.hnn-close'),
			layerSpd = 300;
	$layerClose.on('click',function(){
		$layer.fadeOut(layerSpd);
		return false;
	});
	var $reviewBtn = $('.hnn-bre .hnn-txt a');
	$reviewBtn.on('click',function(){
		var $this = $(this),
				$Tr = $this.parents('tr'),
				$Tr2 = $Tr.next('.hnn-re');
		if($Tr2.hasClass('hidden')){
			$Tr2.removeClass('hidden');
			$Tr2.find('.hnn-re-txt').slideDown(300);
			$Tr2.siblings().find('.hnn-re-txt').not(':hidden').slideUp(300,
				function(){$(this).parents('.hnn-re').addClass('hidden');}
			);
		}else{
			$Tr2.find('.hnn-re-txt').slideUp(300,
				function(){$Tr2.addClass('hidden');}
			);
		}
		return false;
	});
});



$(function(){
lang.init()//상단 언어

});
