$(document).on('turbolinks:load', function() {

  $('.image-form__file').on('change', function() {
    console.log('change!');
    console.log($(this).val());
  })

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
    <i class="fas fa-chevron-down select-arrow-append"></i>`;
    categoryList.append(html);
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
      console.log("category_change");
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
      console.log("mid_category_change");
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


  });
});