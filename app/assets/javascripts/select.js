$(document).on('turbolinks:load', $(function() {

  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
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
    var html = `<option value="${size.size}">${size.size}</option>`;
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
                        <div class="select-wrap">
                          <input class="input-brand" value="" placeholder="例）シャネル" type="text" name="item[brand_id]" >
                        </div>
                      </div>`;
    return brandBoxHtml;
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

}))