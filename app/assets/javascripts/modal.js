$(document).on('turbolinks:load', $(function() {
  $(".modalbttn").click(function() {
    $(".modalcontainer").fadeIn("slow");
    $(".modal").fadeIn("slow");
  });

  $(".close").click(function() {
    $(".modalcontainer").fadeOut("slow");
    $(".modal").fadeOut("slow");
  });

  $(".buttons").click(function() {
    $(".modalcontainer").fadeOut("slow");
    $(".modal").fadeOut("slow");
  });
}));
