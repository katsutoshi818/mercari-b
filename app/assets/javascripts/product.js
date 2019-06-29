$(document).on('turbolinks:load', function(){

  $(".photo_box__image").on('mouseover',function(){
    
    $(".photo_box__image").css("opacity", "0.4");
    $(this).css("opacity", "1");
    var dataUrl = $(this).attr('data-url');
    $(".photo_stage__image").attr('src',dataUrl);
    
  });
  
  var count = 0
  $('.other_left__left').on('click',function(){
    if ( count === 0 ){
      $('.other_left__left').css('color','#ea352d');
      $('.other_left__left').css('border', '1px solid #ea352d');
      $('.other_left__left').css('background-color', '#fff');
      $('#change_icon').removeClass().addClass("fas fa-heart other_left__left__heart2");
        count = 1;
    }
    else {
      $('.other_left__left').css('color','#212121');
      $('.other_left__left').css('border', '1px solid #f5f5f5');
      $('.other_left__left').css('background-color', '#f5f5f5');
      $('#change_icon').removeClass().addClass("far fa-heart other_left__left__heart");
        count = 0;
    }
  });

});