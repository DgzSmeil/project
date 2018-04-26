(function($){
	$(function(){
		wow = new WOW({
			mobile: false
		});
		wow.init();

		$('a[href*=#]').bind("click", function(e){
			var anchor = $(this);
			$('html, body').stop().animate({
				scrollTop: $(anchor.attr('href')).offset().top-100
			}, 1000);
			e.preventDefault();
		});

	});
	//�����ͻ�
	var height=$(".sec25 .wrap").offset().top;
	$(window).scroll( function() {
		var h=$(window).scrollTop();
		var x=height-h;
		if(x<400){
			$(".sec25 .org").fadeIn();
			$(".sec25 .org").addClass("active");
		}
	} );
	//�ͻ�����ͼƬ�ֲ�
	var mySwiper = new Swiper('.sec14 .swiper-container',{
		pagination: '.pagination',
		paginationClickable: true,
		slidesPerView: 2,
		loop: true,
		autoplayDisableOnInteraction : false,
		nextButton: '.swiper-button-next',
		prevButton: '.swiper-button-prev',
		autoplay: 2000
	})
})(jQuery)