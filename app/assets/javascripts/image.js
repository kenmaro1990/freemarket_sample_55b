$(function(){

  var image_file = $('.image-box');
  var image_count = 1;
  var image_tag;
  var file_tag;

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

  function buildFileTag(num){
    var html = `<input type="file" class="upload-image"  multiple= "multiple" name="item_images[image][${num}]" id="item_item_images_attributes_${num}_image" data-image= ${num}>`
    return html;
  };

  $(document).on('change', '.upload-image', function(e){
    var file = $(this).prop('files')[0];
    var file_reader = new FileReader();
    
    file_reader.onload = (function(){
      return function (e) {
        image_tag = buildImageTag(image_count, e.target.result);
        if (image_count <= 4){
          $('#preview').append(image_tag);
          $(".image-uploader").css({display: 'block'});
          $('.image-uploader2').css({'display': 'none'}); 
        }
        if(image_count == 5){
          $('#preview').append(image_tag);
          $('.image-uploader').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
          $('.image-uploader2').css({'display': 'block'});
        }
        if ((image_count >= 6) && (image_count <= 9)){
          $('#preview2').append(image_tag);
          $('.sell-upload-drop-box').css({'display': 'none'});
          $('.image-box2').css({'display': 'flex'});
        }
        if (image_count == 10){
          $('#preview2').append(image_tag);
          $('.sell-upload-drop-box').css({'display': 'none'});
          $('.image-uploader2').css({'display': 'none'});
        }
        file_tag = buildFileTag(image_count);
        image_file.append(file_tag);
        image_count += 1;
      };
    })(file);

      file_reader.readAsDataURL(file);
  });

  // $(document).on('click','.delete', function(){
  //   var target_image = $(this).parent().parent();
  //   var img_num = target_image.children('img').attr('alt');
  //   target_image.remove();
  //   $(`#item_item_images_attributes_${img_num}_image`).remove();
  //   image_count -= 1;
  //   if (image_count <= 4){
  //     $(".image-uploader").css({display: 'block'});
  //     $('.image-uploader2').css({'display': 'none'}); 
  //     $('.image-box2').css({'display': 'none'});
  //     $('.sell-upload-drop-box').css({'display': 'block'})
  //   }
  //   if(image_count == 5){
  //     $('.image-uploader').css({'display': 'none'});
  //     $('.image-box2').css({'display': 'flex'});
  //     $('.image-uploader2').css({'display': 'block'});
  //   }
  //   if ((image_count >= 6) && (image_count <= 9)){
  //     $('.sell-upload-drop-box').css({'display': 'none'});
  //     $('.image-box2').css({'display': 'flex'});
  //   }
  //   if (image_count == 10){
  //     $('.sell-upload-drop-box').css({'display': 'none'});
  //     $('.image-uploader2').css({'display': 'none'});
  //   }
  // })


});























// $(document).on('turbolinks:load', $(function(){
//   var images = [];
//   var inputs  =[];
//   var input_area = $('.sell-upload-drop-box');
//   var preview = $('#preview');
//   var dropzone = $('.image-uploader');
//   var preview2 = $('#preview2');
//   var dropzone2 = $('.image-uploader2');

//   // 画像挿入の処理
//   function insert_image (){
//     $.each(images, function(index, image) {
//       image.attr('data-image', index);
//       preview.append(image);
//     })
//   }
  
//   // function insertImageBox(){
//   //   var imageBox = '';
//   //   imageBox = `<li class="sell-upload-item">
//   //                 <figure class="sell-upload-figure landscape">
//   //                   <img src="data:image">
//   //                 </figure>
//   //                 <div class="sell-upload-button">
//   //                   <a href="" class="sell-upload-edit">編集</a>
//   //                   <a href="">削除</a>
//   //                 </div>
//   //               </li>`;
//   //   $('#preview').after(imageBox);
//   // }

//   function btn_wrapper(){
//     var btnBox = '';
//     btnBox = `<div class="sell-upload-button">
//                 <a href="" class="sell-upload-edit">編集</a>
//                 <a href="">削除</a>
//               </div>`
//     return btnBox;
//   }

//   $(document).on('change', '.upload-image',function(e) {
//     var file = $(this).prop('files')[0];
//     var reader = new FileReader();
//     inputs.push($(this));
//     var img = $(`<div class= "img_view"><img></div>`);
//     reader.onload = function(e) {
//       img.append(btn_wrapper);
//       img.find('img').attr({
//         src: e.target.result
//       })
//     }
//     reader.readAsDataURL(file);
//     images.push(img);

//     // 画像プレビューを挿入する
//     $('#preview').empty();
//     insert_image();
//     if(images.length == 5) {
//       dropzone.css({
//         'display': 'none'
//       })
//     } else {
//         dropzone.css({
//           'width': `calc(100% - (100px * ${images.length}))`
//         })
//       }
//     var new_image = $(`<input class="upload-image" data-image= ${images.length} type="file" multiple="multiple" name="item_images[image][]">`);
//     // var new_image = $(`<input multiple= "multiple" name="item_images[image]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
//     input_area.prepend(new_image);
//   });

//  }));