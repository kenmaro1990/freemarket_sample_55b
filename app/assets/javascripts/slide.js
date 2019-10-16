window.addEventListener('DOMContentLoaded', function() {
  var swiper = new Swiper('.main-top__contents__center__screen .swiper-container', {
    pagination: '.swiper-pagination',
    paginationClickable: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    loop: true
  });
}, false);