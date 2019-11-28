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
  
  function buildUpdatefile(num){
    var html = `<label class="image-uploader" for="item_images_attributes_${num}" id="label-box--${num}" style="display:block">
                  <duv class="sell-upload-drop-box">
                    <pre>クリックしてファイルをアップロード</pre>
                  </div>
                </label>`
    return html;
  }

  function buildInputbox(num){
    var html = `<input class="update-image" id="item_images_attributes_${num}" name="item[item_images_attributes][${num}][image]" type="file">`
    return html;
  }

  $(document).on('change', '.upload-image', function(e){
    var file = $(this).prop('files')[0];
    var file_reader = new FileReader();
    var target_label = $(this).parent().parent();
    var target_id =target_label.attr('id');
    var target_num = Number(target_id.replace('image-label-',''));
    var display_num = target_num+1;

    // image_countの個数によって、previewとlabelの表示する箇所を変える
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
  });



  // 編集ページでイメージがクリックされた時
  // labelのforの番号を入れ替える

  $(document).on('change', '.update-image', function(){
    var target_id = $(this).attr('id');
    var target_num = Number(target_id.replace('item_images_attributes_',''));
    var display_num = target_num+1;
    var file = $(this).prop('files')[0];
    var file_reader = new FileReader();

    $(`#label-box--${target_num}`).remove();
    $('#preview').after(buildUpdatefile(display_num));

    // image_countの個数によって、previewとlabelの表示する箇所を変える
    file_reader.onload = (function(){
      return function (e) {
        image_tag = buildImageTag(target_num, e.target.result);

        if (target_num <= 3){
          $('#preview').append(image_tag);
        }
        if(target_num == 4){
          $('#preview').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
          $('.image-uploader2').css({'display': 'block'});
        }
        if ((target_num >= 5) && (target_num <= 8)){
          $('#preview2').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
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

  $(document).on('click','.delete', function(){

    // previewを消す
    var target_image = $(this).parent().parent();
    target_image.remove();
    
    // labelを消す
    var img_num = Number(target_image.children('img').attr('alt'));
    $(`#item_images_attributes_${img_num}`).remove();
    $('.hidden-content').append(buildInputbox(img_num));
    
    deletes.push(img_num);
    if (img_num == 4 || img_num == 9){
      var num = deletes[0];
      $(`#label-box--${img_num}`).remove();
      $('#preview').after(buildUpdatefile(num));
        deletes.shift();
    }
    image_count -= 1;
  });


}));