$(document).on('turbolinks:load', function() {

  //カテゴリー選択機能
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
    <label for="product[product_size_id]"><p class="form-block__label">サイズ
    <span class="form-block__require">必須</span>
    </p></label>
    <select class="form-block__form--select" name="product[product_size_id]">
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
          console.log(sizes)
          if (sizes.length !== 0) {
            appendSizeForm(sizes);
          }
        })
        .fail(function() {

        })
      }
    })
  });

  //ここから利益計算機能
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

  //ここから画像選択機能
  var imageFormId = 2;
  //^機能全体で使う変数の初期値を設定
  $('.image-forms-wrapper').on('click', function(){

      function viewThumbnail(file, thisImageId) {
      //選択された画像を読み込んでサムネイルを表示する機能
      var reader = new FileReader();
      reader.onload = function() {
        var img_src = $('<img>').attr('src', reader.result);
        $(`#image${thisImageId} .thumbnail`).html(img_src);
        //^選択したファイルフォームと同じidのボックスのサムネイルdivのみに追加する
        }
      //reader.onloadにfunctionを設定している。
      reader.readAsDataURL(file);
      //^ブラウザ上で画像を表示するために必要。仮表示用のURLを作成して読み込んでいる？
      }
    
    function changeImageFormToSelectedForm(thisImageId) {
      var thisImageForm = $(`#image${thisImageId}`);
      //^変更すべきdiv(.image-form)のdomを取得
      thisImageForm.removeClass('image-form');
      thisImageForm.addClass('image-form--selected');
      //^classを書き換える->見た目が変わる！
      $(`#image${thisImageId} p`).remove();
      //^説明を削除
      var deleteButton = `<div class="edit-button-box">
<div class="edit-button-box__edit-btn" data-editimageid="${thisImageId}">変更</div>
<div class="edit-button-box__delete-btn" data-deleteimageid="${thisImageId}">削除</div>
</div>`;
      thisImageForm.append(deleteButton);
      //^編集・削除ボタンを追加
    }

    function appendNextImageForm() {
      var wrapper = $('.image-forms-wrapper');
      var html = `<label for="product_image${imageFormId}"><div class="image-form" id="image${imageFormId}">
<input class="image-form__file" type="file" name="product[image${imageFormId}]" id="product_image${imageFormId}" data-imageid=${imageFormId}>
<p>クリックしてファイルをアップロード</p>
<div class="thumbnail"></div>
</div>
</label>`
      wrapper.append(html);
      imageFormId += 1;
      //^画像選択欄それぞれに使うid用番号を増やす（上限なし）
    }

    function countNumberofImageForms(){
      var NumberofImageForm = $(".image-form--selected").length;
      return NumberofImageForm
    }

    function changeImageFormWidth(){
      var numberofImageForm = countNumberofImageForms();
      var width = 630 - (126 *  numberofImageForm);
      $('.image-form').css('width', width);
    }

    $('.image-form__file').off().on('change', function() {
      var file = $(this).prop('files')[0];
      var currentClass = $(this).parent().attr('class');
      var thisImageId = $(this).attr("data-imageid");
      viewThumbnail(file, thisImageId);
      //ファイルが空→有の場合、クラスの変更＋新規フォームの追加を行う。変更のみの場合、追加は行わない。
      if (currentClass == 'image-form') {
        $(this).parent().unwrap();
        //labelが邪魔になるので削除
        changeImageFormToSelectedForm(thisImageId);
        if (countNumberofImageForms() < 5) {
          appendNextImageForm()
          changeImageFormWidth()
        }
      }
    })
    
    $('.edit-button-box__edit-btn').off().on('click', function() {
      var editImageId = $(this).attr("data-editimageid");
      var editForm = $(`#product_image${editImageId}`)
      editForm.trigger("click")
    })

    $('.edit-button-box__delete-btn').off().on('click', function() {
      var deleteImageId = $(this).attr("data-deleteimageid")
      var deleteBox = $(`#image${deleteImageId}`)
      deleteBox.remove()
      if (countNumberofImageForms() == 4)
      appendNextImageForm()
      changeImageFormWidth()
    })

  })
});