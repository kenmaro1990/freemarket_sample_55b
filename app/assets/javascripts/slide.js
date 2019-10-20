window.addEventListener('DOMContentLoaded', function() {
  var swiper = new Swiper('.main-top__contents__center__screen .swiper-container', {
    pagination: '.swiper-pagination',
    paginationClickable: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    loop: true,
    speed: 1000,
    autoplay: 3000,
    spaceBetween: 10,
    effect: 'coverflow'
  });
}, false);