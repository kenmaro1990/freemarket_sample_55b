$(document).on('turbolinks:load', $(function(){
  
 // -----------------------販売価格表示----------------------------
 
  $('.input-price-area').on('keyup', function(e){
    var input = $("#item_price").val();
    $.ajax({
      type: 'GET',
      url: 'get_price',
      data: { keyword: input },
      dataType: 'json',
    })
    .done(function(data){
      if (data.price >= 300 && data.price <= 9999999) {
        $('#item_fee').text(data.fee);
        $('#item_profit').text(data.profit);
      }
      else{
        $('#item_fee').text('-')
        $('#item_profit').text('-')
      }
    })
    .fail(function(){
      alert('無効な値です');
    })
  });  
  
})

);