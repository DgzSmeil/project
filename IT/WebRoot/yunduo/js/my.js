var init = function(){
	var bannerImgHeight = $(".bannerImg").height();
	var buttonH = bannerImgHeight-50;
	// console.log(buttonH);
	$(".button").css("top",buttonH);
}
$(window).resize(function() {
	init();
});
init();