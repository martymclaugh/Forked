$(document).ready(function() {

  $('.button_to').hide();


  $('.ingredient-image').mouseenter( function() {
    var idSuffix = $(this).attr("value");
    nameSelector = $('#ingredient-' + idSuffix);
    nameSelector.show();
    $('.button_to').show();
  })

   $('.ingredient-image').mouseleave( function() {
      nameSelector.hide();
      $('.button_to').hide();
  })

})
