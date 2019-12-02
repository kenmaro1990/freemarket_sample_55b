$(document).on('turbolinks:load', $(function() {

  var image_tag;
  var deletes = [];
  var delete_ids = [];

  function buildImageTag(alt, src){
    var html = `<div class= "img_view">
                  <img alt="${alt}" src="${src}">
                  <div class="sell-upload-button">
                    <div class="btn edit">編集</div>
                    <div class="btn update-delete">削除</div>
                  </div>
                </div>`
    return html;
  };
    
  function buildUpdatefile(num){
    var html = `<label class="image-uploader" for="item_images_attributes_${num}" id="label-box--${num}" style="display:block">
                  <div class="sell-upload-drop-box">
                    <pre>クリックしてファイルをアップロード</pre>
                  </div>
                </label>`
    return html;
  }

  function buildInputbox(num){
    var html = `<input class="update-image" id="item_images_attributes_${num}" name="item[item_images_attributes][${num}][image]" type="file">`
    return html;
  }

  // 編集ページでイメージがクリックされた時
  // labelのforの番号を入れ替える

  $(document).on('change', '.update-image', function(){
    var target_id = $(this).attr('id');
    var target_num = Number(target_id.replace('item_images_attributes_',''));
    var display_num = target_num + 1;
  
    var file = $(this).prop('files')[0];
    var file_reader = new FileReader();

    file_reader.onload = (function(){
      return function (e) {
        image_tag = buildImageTag(target_num, e.target.result);

        if (target_num <= 3){
          $('#preview').append(image_tag);
          $(`#label-box--${target_num}`).remove();
          $('#preview').after(buildUpdatefile(display_num));      
        }
        if(target_num == 4){
          $('#preview').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
          $('.image-uploader2').css({'display': 'block'});
          $(`#label-box--${target_num}`).remove();
          $('#preview2').after(buildUpdatefile(display_num));      
        }
        if ((target_num >= 5) && (target_num <= 8)){
          $('#preview2').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
          $('.image-uploader2').css({'display': 'block'});
          $(`#label-box--${target_num}`).remove();
          $('#preview2').after(buildUpdatefile(display_num));      
        }
        if (target_num == 9){
          $('#preview2').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-uploader2').css({'display': 'none'});
        }
      };
    })(file);
    
    file_reader.readAsDataURL(file);

  });

  // 既存の画像のdelete
  $(document).on('click','.edit-delete', function(){

    var target_image = $(this).parent().parent();
    var img_num = Number(target_image.children('img').attr('alt'));
    var img_id = target_image.children('img').attr('id');
    var img_id_num = Number(img_id.replace('img_view_',''));

    
    target_image.remove();
    delete_ids.push(img_num);

    $(`#item_item_images_attributes_${img_id_num}_image`).remove();
    $(`#item_item_images_attributes_${img_id_num}_id`).remove();
    
    $('.image-uploader').remove();
    $('#preview2').after(buildUpdatefile(img_id_num));
    $('.hidden-content').append(buildInputbox(img_id_num));

  });
  
  $(document).on('click','#edit-submit', function(){
    $.ajax({
      url: '/items/delete_image',
      type: 'GET',
      data: { id: delete_ids },
      dataType: 'json'
    })
  });

  //追加の画像のdelete
  $(document).on('click','.update-delete', function(){

    // previewを消す
    var target_image = $(this).parent().parent();
    target_image.remove();
    
    // inputを消す
    var img_num = Number(target_image.children('img').attr('alt'));
    $(`#item_images_attributes_${img_num}`).remove();
    $('.hidden-content').append(buildInputbox(img_num));
    $('.image-uploader').remove();
    $('#preview2').after(buildUpdatefile(img_num));

    deletes.push(img_num);
  });

}));