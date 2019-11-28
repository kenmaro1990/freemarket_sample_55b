$(document).on('turbolinks:load', $(function() {

// -----------------------カテゴリ選択ビルド-----------------------
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml =`<div class="select-wrap", id="children_wrapper">
                        <select class="select-default" id="child_category" name="item[category_id]"><option value="---">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('#select_parent_category').append(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml =`<div class="select-wrap", id="grandchildren_wrapper">
                        <select class="select-default" id="grandchild_category" name="item[category_id]"><option value="---">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('#select_parent_category').append(grandchildSelectHtml);
  }
// -----------------------カテゴリ選択ビルド-----------------------

// -----------------------サイズ選択ビルド-----------------------
  function appendSizeOption(size){
    var html = `<option value="${size.id}">${size.size}</option>`;
    return html;
  }

  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="form-group" id="size_wrapper">
                        <label class="form-label">
                          サイズ
                        </label>
                        <span class="form-require">
                          必須
                        </span>
                        <div class="select-wrap">
                          <select class="select-default" name="item[size_id]" id="size"><option value="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>
                      </div>`;
    $('#select_parent_category').after(sizeSelectHtml);
  }
// -----------------------サイズ選択ビルド-----------------------

// -----------------------ブランド選択ビルド-----------------------
function appendBrandBox(){
    var brandBoxHtml = `<div class="form-group" id="brand_wrapper">
                          <label class="form-label">
                            ブランド
                          </label>
                          <span class="form-arbitrary">
                            任意
                          </span>
                          <div class="select-wrap">
                            <input class="input-brand" value="" placeholder="例）シャネル" type="text" name="item[brand_name]" >
                          </div>
                      </div>`;
    return brandBoxHtml;
  }

  function appendselectBrand(brand){
    var html = `<li id="${brand.id}" class="search-brand">${brand.name}</li>`;
    return html;
  }

  function appendBrand(insertHTML){
    var html = `<div>
                  <ul class="sell-brand-suggest form-suggest-list" id="brand-search-result">
                    ${insertHTML}
                  </ul>
                </div>`;
    return html;
  }

  function appendhiddenBrand(brandId,brandName){
    var html = `<select class="display-none" name="item[brand_id]" id="selected_brand_id">
                  <option value="${brandId}">${brandName}</option>
                </select>`
    return html;
  }
// -----------------------ブランド選択ビルド-----------------------

// -----------------------配送方法選択ビルド-----------------------
  function appendShipOption(shipping){
    var html = `<option value="${shipping}">${shipping}</option>`;
    return html;
  }

  function appendPostage_seller(insertHTML){
    var postageSelectHtml = `<div class="form-group" id="shipping_method_select">
                        <label class="form-label">
                          配送の方法
                        </label>
                        <span class="form-require">
                          必須
                        </span>
                        <div class="select-wrap">
                          <select class="select-default" name="item[shipping_method]" id="shipping_method">
                          <option value="---">---</option>
                          ${insertHTML}
                          </select>
                        </div>
                      </div>`;
    return postageSelectHtml;
  }

  function appendPostage_buyer(insertHTML){
    var postageSelectHtml = `<div class="form-group" id="shipping_method_select">
                        <label class="form-label">
                          配送の方法
                        </label>
                        <span class="form-require">
                          必須
                        </span>
                        <div class="select-wrap">
                          <select class="select-default" name="item[shipping_method]" id="size">
                          <option value="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>
                      </div>`;
    return postageSelectHtml;
  }
// -----------------------配送方法選択ビルド-----------------------


// -----------------------カテゴリ選択----------------------------
  $('#parent_category').on('change', function(){
    var parentCategory = $('#parent_category').val();
    if (parentCategory != "---"){
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
    .done(function(children){
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
      var insertHTML = '';
      children.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChidrenBox(insertHTML);
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
    }
    else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

  $('#select_parent_category').on('change', '#child_category',function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != ""){
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
// -----------------------カテゴリ選択----------------------------

// -----------------------サイズ選択----------------------------
  $('#select_parent_category').on('change', '#grandchild_category', function(){
    var grandchildID =$('#grandchild_category option:selected').data('category');
    if (grandchildID != 0){
      $.ajax({
        url: '/items/get_size',
        type: 'GET',
        data: { grandchild_id: grandchildID },
        dataType: 'json'
      })
      .done(function(sizes){
        $('#size_wrapper').remove();
        if (sizes.length != 0){
          var insertHTML = '';
          sizes.forEach(function(size){
            insertHTML += appendSizeOption(size);
          });
          appendSizeBox(insertHTML);
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }else{
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  })
// -----------------------サイズ選択----------------------------

// -----------------------ブランド入力----------------------------
$(document).on('change', '#grandchild_category', function(){
  var categoryName = $('#parent_category option:selected').val();
  if (categoryName != "本・音楽・ゲーム"&& categoryName != "おもちゃ・ホビー・グッズ" && categoryName != "ハンドメイド" && categoryName != "チケット" && categoryName != "その他"){
    $('#brand_wrapper').remove();
    $('.form-group-first-select').after(appendBrandBox);
  }else{
  $('#brand_wrapper').remove();
  }
});

$(document).on('keyup','.input-brand', function(){
  var input = $(".input-brand").val();
  if (input != "") {
    $.ajax({
      url: '/items/search_brand',
      type: 'GET',
      data: { keyword: input },
      dataType: 'json',
    })
    .done(function(brands){
      $("#brand-search-result").remove();
      var insertHTML = ''
      brands.forEach(function(brand){
        insertHTML += appendselectBrand(brand);
      });
      $('.input-brand').after(appendBrand(insertHTML));
    })
    .fail(function(){
      alert('ブランド検索に失敗しました');
    })
  }else{
    $("#brand-search-result").remove();
  }
});

$(document).on("click", '.search-brand', function(){
  $('#selected_brand_id').remove();
  var brandId = $(this).attr('id');
  var brandName = $(this).text();
  $('.input-brand').attr('value', brandId);
  $('.input-brand').append(appendhiddenBrand(brandId,brandName));
  $("#brand-search-result").remove();
})
// -----------------------ブランド入力----------------------------

// -----------------------配送方法選択----------------------------
  $('#postage').on('change',  function(){
    var postage = $('#postage option:selected').val();
    if (postage == "送料込み(出品者負担)"){
      $('#shipping_method_select').remove();
      var insertHTML = '';
      var shipping_method = ['未定','らくらくメルカリ便','ゆうメール','普通郵便(定形、定形外)','レターパック','クロネコヤマト','ゆうパック','クリップポスト','ゆうパケット'];
      shipping_method.forEach(function(shipping){
        insertHTML += appendShipOption(shipping);
      });
      $('#postage').after(appendPostage_seller(insertHTML));
    }else if(postage == "着払い(購入者負担)" ){
      $('#shipping_method_select').remove();
      var insertHTML = '';
      var shipping_method = ['未定','クロネコヤマト','ゆうパック','ゆうメール'];
      shipping_method.forEach(function(shipping){
        insertHTML += appendShipOption(shipping);
      });
      $('#postage').after(appendPostage_buyer(insertHTML));
    }else{
      $("#shipping_method_select").remove();
    }
  });
// -----------------------配送方法選択----------------------------

}))