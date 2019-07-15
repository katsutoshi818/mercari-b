$(document).on('turbolinks:load', function() {
  $(".down_list_right").on('mouseover',function(){
    $(".mypage-box").removeClass("none");
  });
  $(".down_list_right").on('mouseout',function(){
    $(".mypage-box").addClass("none");
  });
})