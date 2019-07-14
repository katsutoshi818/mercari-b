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

  $('.category_box').on('mouseover', function(){
    $('.category_box').css('background-color', '#ffffff')
    $(this).css('background-color', 'red')
    $('.category_box').css('color', 'black')
    $(this).css('color', '#ffffff')
    $('.category_index_children').removeClass('category_none');

    var text = $(this).html();
    var keyword = text.replace(/\n/g, "")
    $(".category_index_children").empty();
    if (keyword.length !== 0) {
    $.ajax({
      type: 'GET',
      url: '/products',
      data: {keyword: keyword},
      dataType: 'json'
    })

    .done(function(children) {
      $(".category_index_grandchildren").empty();
      $(".category_index_children").empty();
      if (children.length !== 0) {
      children.forEach(function(child){
      $(".category_index_children").append(`<div class = "category_box_children"><span>${child.category_name}</span></div>`)
      })
      }
    })
  }
  })

  $(document).on('mouseover',".category_box_children", function(){
    $('.category_box_children').css('background-color', '#ffffff')
    $(this).css('background-color', 'red')
    $('.category_box_children').children().css('color', 'black')
    $(this).children().css('color', '#ffffff')
    $('.category_index_grandchildren').removeClass('category_none');

    var keyword = $(this).text();
    if (keyword.length !== 0) {
    $.ajax({
      type: 'GET',
      url: '/products',
      data: {keyword: keyword},
      dataType: 'json'
    })

    .done(function(grandchildren) {
      $(".category_index_grandchildren").empty();
      if (grandchildren.length !== 0) {
      grandchildren.forEach(function(grand){
      $(".category_index_grandchildren").append(`<div class = "category_box_grandchildren"><span>${grand.category_name}</span></div>`)
      })
      }
    })
  }
  })

  

  $('.category_list').on('mouseover',function(){
    $('.category_index_parent').removeClass('category_none');
  })

  $(document).on('mouseover', '.category_box_grandchildren', function(){
    $('.category_box_grandchildren').css('background-color', '#ffffff')
    $(this).css('background-color', 'red')
    $('.category_box_grandchildren').children().css('color', 'black')
    $(this).children().css('color', '#ffffff')
  })

  $(document).on('mouseleave',".category_list", function(){
    $('.category_index_parent').addClass('category_none');
    $('.category_index_children').addClass('category_none');
    $('.category_index_grandchildren').addClass('category_none');

  })

  $('.brand_list').on('mouseover',function(){
    $('.brand_boxes').removeClass('brand_none');
  })



  $('.brand_list').on('mouseleave',function(){
    $('.brand_boxes').addClass('brand_none');
  })

  $(document).on('mouseover',".brand_box", function(){
    $('.brand_box').css('background-color', '#ffffff')
    $(this).css('background-color', 'red')
    $('.brand_box').css('color', 'black')
    $(this).css('color', '#ffffff')

  })

  $('.category_show_link').on('click', function(){
    var id = $(this).attr('id')
    var target = $('.category_index_list_name').filter('#' +id)
    var position = $(target).offset().top;
    $("html,body").animate({
    scrollTop : position
    }, {
    queue : false
    });
  })

});

