$(document).on('turbolinks:load', $(function(){
  var images = [];
  var inputs  =[];
  var input_area = $('.sell-upload-drop-box');
  var preview = $('#preview');
  var dropzone = $('.image-uploader');
  var preview2 = $('#preview2');
  var dropzone2 = $('.image-uploader2');

  // 画像挿入の処理
  function insert_image (){
    $.each(images, function(index, image) {
      image.attr('data-image', index);
      preview.append(image);
    })
  }
  
  // function insertImageBox(){
  //   var imageBox = '';
  //   imageBox = `<li class="sell-upload-item">
  //                 <figure class="sell-upload-figure landscape">
  //                   <img src="data:image">
  //                 </figure>
  //                 <div class="sell-upload-button">
  //                   <a href="" class="sell-upload-edit">編集</a>
  //                   <a href="">削除</a>
  //                 </div>
  //               </li>`;
  //   $('#preview').after(imageBox);
  // }

  function btn_wrapper(){
    var btnBox = '';
    btnBox = `<div class="sell-upload-button">
                <a href="" class="sell-upload-edit">編集</a>
                <a href="">削除</a>
              </div>`
    return btnBox;
  }

  $(document).on('change', '.upload-image',function(e) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e) {
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);

    // 画像プレビューを挿入する
    $('#preview').empty();
    insert_image();
    if(images.length == 5) {
      dropzone.css({
        'display': 'none'
      })
    } else {
        dropzone.css({
          'width': `calc(100% - (100px * ${images.length}))`
        })
      }
    var new_image = $(`<input class="upload-image" data-image= ${images.length} type="file" multiple="multiple" name="item_images[image][]">`);
    // var new_image = $(`<input multiple= "multiple" name="item_images[image]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });

 }));