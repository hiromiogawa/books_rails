$(function() {
  $('.slide').slick({
    infinite: true,
    slidesToShow: 1,
    arrows: false,
    fade: true,
    asNavFor: '.slide_thumb'
  });

  $('.slide_thumb').slick({
    slidesToShow: 5,
    asNavFor: '.slide',
    focusOnSelect: true,
    arrows: false
  });
});
