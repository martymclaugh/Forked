$(document).ready(function() {

  $('.ingredient-image').mouseenter( function() {
    var stuff = $(this).attr("value");
    console.log(stuff);
      $(stuff).show();
  })

   $('.ingredient-image').mouseleave( function() {
      $('.ingredient-name').hide();
  })

})
