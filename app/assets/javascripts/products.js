$(document).on('turbolinks:load', function() {
  // var CLOTHES = ["XXS以下", "XS", "S", "M", "L", "XL", "2XL", "3XL", "4XL以上", "FREE SIZE"];
  // var SHOES = ["20.0cm以下", "20.5cm", "21.0cm", "21.5cm", "22.0cm", "22.5cm", "23.0cm", "23.5cm", "24.0cm", "24.5cm", "25.0cm", "25.5cm", "26.0cm", "26.5cm", "27.0cm", "27.5cm以上"];

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
      //low_categoryが決まったときに発火
      // low_categoryのIDから、サイズパターンのidを取得する(ajax)
      console.log("appendsize");
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
      //カテゴリーidに紐づいたサイズパターンを取得する
    })
  });
});