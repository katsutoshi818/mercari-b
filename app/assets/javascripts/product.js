$(document).on('turbolinks:load', function () {
  var image = $('.show_photo_list').children('div :first').children('img').attr('data-url');
  $(".show_photo_stage__image").attr('src',image);
  $('.show_photo_list').children('div :first').children('img').css('opacity', '1');
});

$(document).on('turbolinks:load', function(){

  $(".show_photo_box__image").on('mouseover',function(){
    
    $(".show_photo_box__image").css("opacity", "0.4");
    $(this).css("opacity", "1");
    var dataUrl = $(this).attr('data-url');
    $(".show_photo_stage__image").attr('src',dataUrl);
    
  });
  
  $(document).on("click", ".other_left__left--black", function () {
    $('.other_left__left--black').addClass('other_left__left--red');
    $('.other_left__left--red').removeClass('other_left__left--black');
    $('.id_form_button--black').addClass('id_form_button--red');
    $('.id_form_button--red').removeClass('id_form_button--black');
    $('#change_icon').removeClass().addClass("fas fa-heart other_left__left__heart2");
  });

  $(document).on("click", ".other_left__left--red", function () {
    $('.other_left__left--red').addClass('other_left__left--black');
    $('.other_left__left--black').removeClass('other_left__left--red');
    $('.id_form_button--red').addClass('id_form_button--black');
    $('.id_form_button--black').removeClass('id_form_button--red');
    $('#change_icon').removeClass().addClass("far fa-heart");
  });

});

