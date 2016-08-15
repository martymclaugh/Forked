$(document).ready(function() {

  $('.ingredient-image').mouseenter( function() {
    var idSuffix = $(this).attr("value");
    nameSelector = $('#ingredient-' + idSuffix);
    nameSelector.show();
  })

   $('.ingredient-image').mouseleave( function() {
      nameSelector.hide();
  })

})
