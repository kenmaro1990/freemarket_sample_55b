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
}))