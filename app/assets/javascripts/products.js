$(document).on('turbolinks:load', function() {
  console.log('turbo!');

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

    //引数の数だけoptionを追加する
    var option = ``;
    $.each(categories, function(i, category) {
      option += `<option value="${category.id}">${category.name}</option>`
      //jbuilderでcategory.nameで名前が表示できるようにする？
    })
    html += option;
    html += `</select>
    <i class="fas fa-chevron-down select-arrow-append"></i>`;
    // console.log('html ->' + html)
    categoryList.append(html);
  }


  $('.category-block').on('click', function() {
    function deleteMidCategories() {
      $('#mid_category').remove();
    }

    function deleteLowCategories() {
      $('#low_category').remove();
    }

    console.log('click')
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
          midCategories.forEach(function(category) {
            console.log(category.id);
            console.log(category.name);
          })
          //!中カテゴリーのフォームをアペンドする。
          //追加すべき内容を引数にしてappendCategoryFormを呼ぶ。
          if (midCategories.length !== 0) {
            deleteMidCategories();
            deleteLowCategories();
            appendCategoryForm(midCategories, 'mid');
          }
        })
        .fail(function() {
          //fail
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
          //!中カテゴリーのフォームをアペンドする。
          //追加すべき内容を引数にしてappendCategoryFormを呼ぶ。
          if (lowCategories.length !== 0) {
            deleteLowCategories();
            appendCategoryForm(lowCategories, 'low');
          }
        })
        .fail(function() {

        })
      }
    })


  });
});

//topカテゴリー選択時、すでにmid,lowカテゴリーがあればそれを消去してからアペンドする。
//midカテゴリー選択時、すでにlowカテゴリーがあればそれを消去してからアペンドする。

// （カテゴリ）実装すべき内容
// function1 () {
// 大カテゴリで選択されたことを確認
// 子となっている中カテゴリの中身を取得(ajax)
// 中カテゴリ選択用のselectフォームをappendする
// }
// function2 () {
// 中カテゴリが選択されたことを確認
// 子となっている小カテゴリを取得(ajax)
// 子カテゴリ選択用のselectフォームをappendする。
// }

// （利益計算）実装すべき内容
// function () {
// 入力された価格を取得
// 手数料と利益を計算
// 手数料、利益を表示する。
// //299円以下はだめ
// }

// （画像フィールド）実装すべき内容
// 1.ファイルが追加されたのを確認
// 2.ファイルの