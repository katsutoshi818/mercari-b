$(document).on('turbolinks:load', function() {

  function appendCategoryForm(categories, hierarchy) {
    categoryList = $('.category-block');
    var html = `<div class="form-block--select-append">
    <label for="product_category_id">
    </label>
    <select class="form-block__form--select" id="${hierarchy}_category" name="product[${hierarchy}_category_id]">
    <option value="0">---</option>`;

    var option = ``;
    $.each(categories, function(i, category) {
      option += `<option value="${category.id}">${category.name}</option>`
    })
    html += option;
    html += `</select>
    <i class="fas fa-chevron-down select-arrow-append"></i></div>`;
    categoryList.append(html);
  }

  function appendSizeForm(sizes){
    var sizeForm = $('#size-block');
    var html = `<div class="form-block--select-append" id="size-form">
    <label for="product_category_id"><p class="form-block__label">サイズ
    <span class="form-block__require">必須</span>
    </p></label>
    <select class="form-block__form--select" name="product[product_size]">
    <option value="0">---</option>`;
    $.each(sizes, function(i, size) {
      html += `<option value="${size.id}">${size.text}</option>`
    });
    html += `</select>
    <i class="fas fa-chevron-down select-arrow"></i></div>`;
    sizeForm.append(html);
  }

  $('.category-block').on('click', function() {
    function deleteMidCategories() {
      $('#mid_category').remove();
    }

    function deleteLowCategories() {
      $('#low_category').remove();
    }

    $('#top_category').on('change', function() {
      var value = $(this).val();
      if (value != 0) {
        $.ajax({
          type: 'GET',
          url: '/categories',
          data: {value: value},
          dataType: 'json'
        })
        .done(function(midCategories) {
          deleteMidCategories();
          deleteLowCategories();
          if (midCategories.length !== 0) {
            appendCategoryForm(midCategories, 'mid');
          }
        })
        .fail(function() {
        })
      }
    })
  

    $('#mid_category').on('change', function() {
      var value = $(this).val();
      if (value != 0) {
        $.ajax({
          type: 'GET',
          url: '/categories',
          data: {value: value},
          dataType: 'json'
        })
        .done(function(lowCategories) {
          deleteLowCategories();
          if (lowCategories.length !== 0) {
            appendCategoryForm(lowCategories, 'low');
          }
        })
        .fail(function() {
        })
      }
    })

    $('#low_category').off('change').on('change', function() {
      $('#size-form').remove();
      var lowCategory = $('#low_category').val();
      if (lowCategory !== 0){
        $.ajax({
          type: 'GET',
          url: '/product_sizes',
          data: {low_category: lowCategory},
          dataType: 'json'
        })
        .done(function(sizes) {
          if (sizes !== 0) {
            appendSizeForm(sizes);
          }
        })
        .fail(function() {

        })
      }
    })
  });

  function separateOnThousand(number) {
    return String(number).replace(/(\d)(?=(\d\d\d)+$)/g, '$1,');
  }

  var preinput = "";
  $('.price-form__text').on('keyup', function() {
    var input = $(this).val();
    if (input !== preinput) {
      if (input > 300) {
        var charge = Math.floor(input * 0.1);
        var profit = input - charge;
        $('.form-block__charge').text("¥" + separateOnThousand(charge));
        $('.form-block__profit').text("¥" + separateOnThousand(profit));
      }
      else {
        $('.form-block__charge').text('-');
        $('.form-block__profit').text('-');
      }
    }
    preinput = input;
  });


  var imageFormId = 2;
  $('.image-forms-wrapper').on('click', function(){
      function viewThumbnail(file, thisImageId) {
        console.log(thisImageId);
      //選択された画像を読み込んでサムネイルを表示する機能
      var reader = new FileReader();
      reader.onload = function() {
        var img_src = $('<img>').attr('src', reader.result);
        //選択したファイルフォームと同じボックスのサムネイルのみに追加する
        $(`#image${thisImageId} .thumbnail`).html(img_src);
      }
      reader.readAsDataURL(file);
    }
    
    function changeImageFormToSelectedForm(thisImageId) {
      //変更すべきdiv(.image-form)のdomを取得
      var thisImageForm = $(`#image${thisImageId}`);
      //classを書き換える
      thisImageForm.removeClass('image-form');
      thisImageForm.addClass('image-form--selected');
      //->見た目が変わる！
    }

    function appendNextImageForm() {
      var wrapper = $('.image-forms-wrapper');
      var html = `<label for="product_image${imageFormId}"><div class="image-form" id="image${imageFormId}">
<input class="image-form__file" type="file" name="product[image${imageFormId}]" id="product_image${imageFormId}" data-imageid=${imageFormId}>
<p>ドラッグアンドドロップ</p>
<p>またはクリックしてファイルをアップロード</p>
<div class="thumbnail"></div>
</div>
</label>`
      wrapper.append(html);
      imageFormId += 1;
    }

    $('.image-form__file').off().on('change', function() {
      //ファイルが空→有の場合、追加を行う。変更のみの場合、追加は行わない。
      var file = $(this).prop('files')[0];
      var parent = $(this).parent();
      var thisImageId = $(this).attr("data-imageid");
      console.log(file);
      console.log(parent);
      changeImageFormToSelectedForm(thisImageId);
      viewThumbnail(file, thisImageId);
      $(`#image${thisImageId} p`).remove();
      appendNextImageForm();
    })
  })
});