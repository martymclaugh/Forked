$(document).ready(function() {

  $('.ingredient-image').mouseenter( function() {
      $('.ingredient-name').show();
  })

   $('.ingredient-image').mouseleave( function() {
      $('.ingredient-name').hide();
  })

})
