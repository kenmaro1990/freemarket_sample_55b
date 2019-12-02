$(function() {
  $('img.thumb').mouseover(function(){
  var selectedSrc = $(this).attr('src');
  
  $('img.mainImage').stop().fadeOut(
  function(){
  $('img.mainImage').attr('src', selectedSrc);
  $('img.mainImage').stop().fadeIn();
  });
  });
 });
