$(document).on('turbolinks:load', function() {
  $(".mypage").on('mouseover',function(){
    $(".mypage-box").removeClass("none");
  });
  $(".mypage").on('mouseout',function(){
    $(".mypage-box").addClass("none");
  });
})