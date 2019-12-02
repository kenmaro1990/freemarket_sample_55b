$(document).on('turbolinks:load', $(function(){
// -----------------------編集前価格表示----------------------------
  var input = $("#item_price").val();
  var fee    = Math.round(input * 0.1)
  var profit = input - fee

    if (input >= 300 && input <= 9999999) {
      $('#item_fee').text(fee);
      $('#item_profit').text(profit);
    }

   // -----------------------編集した価格を表示----------------------------
  $('.input-price-area').on('keyup', function(e){
    var input = $("#item_price").val();
    var fee    = Math.round(input * 0.1)
    var profit = input - fee

      if (input >= 300 && input <= 9999999) {
        $('#item_fee').text(fee);
        $('#item_profit').text(profit);
      }
      else{
        $('#item_fee').text('-')
        $('#item_profit').text('-')
      }
  });
})
);