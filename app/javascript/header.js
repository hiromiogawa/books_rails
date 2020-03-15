$(function() {
  let toggleMenu = $('.nav_wrap'),
	      toggleMenuWidth;

	$(window).on('load resize', function(){
		toggleMenuWidth = toggleMenu.outerWidth();
		if ( $('header .menu').hasClass('pushed') == true ) {
			toggleMenu.css({'left' : 0, 'opacity' : 1 });

		} else {
			toggleMenu.css({'left' : - toggleMenuWidth , 'opacity' : 1 });
		}
	});


	$('.menu').on('click', function(){
		toggleMenuWidth = toggleMenu.outerWidth();
		if ( $('header .menu').hasClass('pushed') == true ) {
			toggleMenu.animate({'left' : - toggleMenuWidth }, 300);

		} else {
			$('.menu p').text('閉じる');
			toggleMenu.animate({'left' : 0 }, 300);
		}
		$('header .menu').toggleClass('pushed');
		$('nav_wrap').toggleClass('active');
	});
});
