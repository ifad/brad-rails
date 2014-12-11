$(function () {
  $('[data-toggle="brad-popover"]').popover({
    content: function(){
      return $($(this).attr("data-target")).find(".content").html()
    },
    title: function(){
      return $($(this).attr("data-target")).find(".title").html()
    },
    html: true
  }).on("click", function(e){ e.preventDefault();})
})

