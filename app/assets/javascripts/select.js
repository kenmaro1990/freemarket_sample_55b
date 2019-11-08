$(document).on('turbolinks:load', $(function() {

  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml =`<div class="select-wrap", id="children_wrapper">
                        <select class="select-default" id="child_category" name="category_id"><option value="---">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('#select_parent_category').append(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml =`<div class="select-wrap", id="grandchildren_wrapper">
                        <select class="select-default" id="grandchild_category" name="category_id"><option value="---">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('#select_parent_category').append(grandchildSelectHtml);
  }

  function appendSizeOption(size){
    var html = `<option value="${size.id}">${size.size}</option>`;
    return html;
  }

  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="form-group">
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
                    
  function appendBrandBox(){
    var brandBoxHtml = `<div class="form-group" id="brand-wrapper">
                        <label class="form-label">
                          ブランド
                        </label>
                        <span class="form-arbitrary">
                          任意
                        </span>
                        <div class="select-wrap" name="item[brand_id]">
                          <input class="input-brand" value="" placeholder="例）シャネル" type="text" name="item[brand_id]" >
                        </div>
                      </div>`;
    return brandBoxHtml;
  }
  
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

  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    
    if (parentCategory != "---"){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
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
        url: 'get_category_grandchildren',
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

  $('#select_parent_category').on('change', '#grandchild_category', function(){
    var grandchildID =$('#grandchild_category option:selected').data('category');
    if (grandchildID != 0){
      $.ajax({
        url: 'get_size',
        type: 'GET',
        data: { grandchild_id: grandchildID },
        dataType: 'json'
      })
      .done(function(sizes){
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
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

  $('#select_parent_category').on('change', '#grandchild_category', function(){
    var categoryName = $('#parent_category option:selected').val();
    if (categoryName != "本・音楽・ゲーム"&& categoryName != "おもちゃ・ホビー・グッズ" && categoryName != "ハンドメイド" && categoryName != "チケット" && categoryName != "その他"){
      $('#select_parent_category').after(appendBrandBox);
    }else{
    $('#brand_wrapper').remove();
    }
  });

  $('#postage').on('change',  function(){
    var postage = $('#postage option:selected').val();
    if (postage == "送料込み(出品者負担)"){
      var insertHTML = '';
      var shipping_method = ['未定','らくらくメルカリ便','ゆうメール','普通郵便(定形、定形外)','レターパック','クロネコヤマト','ゆうパック','クリップポスト','ゆうパケット'];
      shipping_method.forEach(function(shipping){
        insertHTML += appendShipOption(shipping);
      });
      $('#postage').after(appendPostage_seller(insertHTML));
    }else if(postage == "着払い(購入者負担)" ){
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

}))