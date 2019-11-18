$(document).on('turbolinks:load', $(function() {

  var image_tag;
  var image_count = 0;
  var change_count = 0;
  var change_count_2 = 0;
  var deletes = [];


  function buildImageTag(alt, src){
    var html = `<div class= "img_view">
                  <img alt="${alt}" src="${src}">
                  <div class="sell-upload-button">
                    <div class="btn edit">編集</div>
                    <div class="btn delete">削除</div>
                  </div>
                </div>`
    return html;
  };
  
  function buildNewFile(img_num,num){
    var html = `<label class="image-uploader${num}" id="image-label-${img_num}" for="item_item_images_attributes_${img_num}_image" style="display: none;">
                  <div class="sell-upload-drop-box${num}">
                    <pre>ドロップアンドドロップ<br>またはクリックしてファイルをアップロード</pre>
                    <input type="file" class="upload-image" name="item[item_images_attributes][${img_num}][image]" id="item_item_images_attributes_${img_num}_image">
                  </div>
                </label>`
    return html;
  }
  
  $(document).on('change', '.upload-image', function(e){
    var file = $(this).prop('files')[0];
    var file_reader = new FileReader();
    var target_label = $(this).parent().parent();
    var target_id =target_label.attr('id');
    var target_num = Number(target_id.replace('image-label-',''));
    var display_num = target_num+1;
    console.log(change_count);
    console.log(change_count_2);
    console.log(target_num);

    file_reader.onload = (function(){
      return function (e) {
        image_tag = buildImageTag(target_num, e.target.result);

        if (image_count <= 4){
          $('#preview').append(image_tag);
          change_count += 1;
        }
        if(image_count == 5){
          $('#preview').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
          $('#image-label-5').css({'display': 'block'});
          change_count += 1;
        }
        if ((image_count >= 6) && (image_count <= 9)){
          $('#preview2').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
          change_count_2 += 1;
        }
        if (image_count == 10){
          $('#preview2').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-uploader2').css({'display': 'none'});
          change_count_2 += 1;
        }
      };
    })(file);
    
    file_reader.readAsDataURL(file);
    
    // インプット要素が変更された時にラベルを１つずつ表示させる
    // label4まで表示されたら、deleteされた要素から１つずつ取り出して表示
    if (change_count < 4){
    $(`#image-label-${target_num}`).css('display', "none");
    $(`#image-label-${display_num}`).css('display', "block");
    }else if (target_num >= 5 && change_count_2 < 4) {
      $(`#image-label-${target_num}`).css('display', "none");
      $(`#image-label-${display_num}`).css('display', "block");
    }else{
      var num = deletes[0];
      $(`#image-label-${target_num}`).css('display', "none");
      $(`#image-label-${num}`).css('display', "block");
      deletes.shift();
    };

    image_count += 1;


  });


  $(document).on('click','.delete', function(){

    // previewを消す
    var target_image = $(this).parent().parent();
    target_image.remove();
    
    // labelを消す
    var img_num = Number(target_image.children('img').attr('alt'));
    $(`#image-label-${img_num}`).remove();
    if (img_num <= 4){
    $('.image-box').append(buildNewFile(img_num,""));
    }else{
    $('.image-box2').append(buildNewFile(img_num,2));
    }
    
    deletes.push(img_num);
    if (image_count == 5 || image_count == 10){
      var num = deletes[0];
      $(`#image-label-${num}`).css('display', "block");
      deletes.shift();
    }
    image_count -= 1;

  })

}));