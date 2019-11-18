$(document).on('turbolinks:load', $(function() {

  var image_count = 0;
  var display_num = 1;
  var image_tag;

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
  
  function buildNewFile(num){
    var html = `<label class="image-uploader" id="image-label-${num}" for="item_item_images_attributes_${num}_image" style="display: none;">
    <div class="sell-upload-drop-box">
    <pre>ドロップアンドドロップ<br>またはクリックしてファイルをアップロード</pre>
    <input type="file" class="upload-image" name="item[item_images_attributes][${num}][image]" id="item_item_images_attributes_${num}_image">
    </div>
    </label>`
    return html;
  }
  
  $(document).on('change', '.upload-image', function(e){
    var file = $(this).prop('files')[0];
    var file_reader = new FileReader();
    
    file_reader.onload = (function(){
      return function (e) {
        image_tag = buildImageTag(image_count, e.target.result);
        if (image_count <= 4){
          $('#preview').append(image_tag);
        }
        if(image_count == 5){
          $('#preview').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
          $('#image-label-5').css({'display': 'block'});
        }
        if ((image_count >= 6) && (image_count <= 9)){
          $('#preview2').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
        }
        if (image_count == 10){
          $('#preview2').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-uploader2').css({'display': 'none'});
        }
      };
    })(file);
    
    file_reader.readAsDataURL(file);
    
    // インプット要素が変更された時にラベルを１つずつ表示させる
    $(`#image-label-${display_num}`).css('display', "block");
    $(`#image-label-${image_count}`).css('display', "none");
    image_count += 1;
    display_num += 1;
  });


  $(document).on('click','.delete', function(){
    var target_image = $(this).parent().parent();
    var img_num = target_image.children('img').attr('alt');
    console.log(img_num);
    target_image.remove();
    $(`#image-label-${img_num}`).remove();
    $('.image-box').append(buildNewFile(img_num));

    
    image_count -= 1;
    // if (image_count <= 4){
      //   $(".image-uploader").css({'display': 'block'});
      //   $('.image-uploader2').css({'display': 'none'}); 
      //   $('.image-box2').css({'display': 'none'});
      //   $('.sell-upload-drop-box').css({'display': 'block'})
      // }
      // if(image_count == 5){
        //   $('.image-uploader').css({'display': 'none'});
        //   $('.image-box2').css({'display': 'flex'});
        //   $('.image-uploader').css({'display': 'none'})
        // }
    // if ((image_count >= 6) && (image_count <= 9)){
    //   $('.image-uploader').css({'display': 'none'});
    //   $('.image-box2').css({'display': 'flex'});
    // }
    // if (image_count == 10){
    //   $('.sell-upload-drop-box').css({'display': 'none'});
    //   $('.image-uploader2').css({'display': 'none'});
    // }
  })

  

}));
