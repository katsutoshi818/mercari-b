$(document).on('turbolinks:load',function(){
  $("#new-users1,#new-users2,#new-users3,#new-users4,#new-users5,#new-users6").hide();
    $('.single-box_mail').on('click',function(){
      $('#new-users1').fadeIn(100);
        $('html,body').scrollTop(0);
          $('#new-users0').hide();
            return false;
  });

  $('.btn-next').on('click',function(){
    $('#new-users2').fadeIn(100);
      $('html,body').scrollTop(0);
        $('#new-users1').hide();
          return false;
  });

  $('.btn-next2').on('click',function(){
    $('#new-users3').fadeIn(100);
      $('html,body').scrollTop(0);
        $('#new-users2').hide();
        return false;
  });

  $('.btn-next3').on('click',function(){
    $('#new-users4').fadeIn(100);
      $('html,body').scrollTop(0);
        $('#new-users3').hide();
          return false;
  });

  $('.btn-back1').on('click',function(){
    $('#new-users0').fadeIn(100);
      $('html,body').scrollTop(0);
        $('#new-users1').hide();
  });

  $('.btn-back2').on('click',function(){
    $('#new-users1').fadeIn(100);
      $('html,body').scrollTop(0);
        $('#new-users2').hide();
  });

  $('.btn-back3').on('click',function(){
    $('#new-users2').fadeIn(100);
      $('html,body').scrollTop(0);
        $('#new-users3').hide();
  });

  $('.btn-back4').on('click',function(){
    $('#new-users3').fadeIn(100);
      $('html,body').scrollTop(0);
        $('#new-users4').hide();
  });
});