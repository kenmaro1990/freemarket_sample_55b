$(function() {
  function buildChildHTML(child){
    var html =`<a class="child_category" id="${child.id}" 
                href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }

  $(".parent_category").on("mouseover", function() {
    var id = this.id
    $(".now-selected-red").removeClass("now-selected-red")
    $('#' + id).addClass("now-selected-red");
    $(".child_category").remove();
    $(".grand_child_category").remove();
    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {parent_id: id},
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {
        var html = buildChildHTML(child);
        $(".children_list").append(html);
      })
    });
  });

 
  function buildGrandChildHTML(child){
    var html =`<a class="grand_child_category" id="${child.id}"
                href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }

  $(document).on("mouseover", ".child_category", function () {
    var id = this.id
    $(".now-selected-gray").removeClass("now-selected-gray");
    $('#' + id).addClass("now-selected-gray");
    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {parent_id: id},
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".grand_children_list").append(html);
      })
      $(document).on("mouseover", ".child_category", function () {
        $(".grand_child_category").remove();
      });
    });
  });  
});

$(function() {
  $('a[href^="#"]').click(function(){
    var speed = 500;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

