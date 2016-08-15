$(document).on("ready", function(){
	$('.ingredient-check').on('click', recipeDone)
	$('.directions').on('click', directionDone)
    // $('.ingredient-image').on('mouseenter', showIngredientName )
    // $('.ingredient-image').on('mouseleave', hideIngredientName )
		// $('.ingredient-name').on('mouseenter', showIngredientName )
		// $('.ingredient-name').on('mouseleave', hideIngredientName )
})


function recipeDone(){
	$(this).css('color', 'green')
}

function directionDone(){
	console.log("Im clicked")
	$(this).html('')
	$(this).addClass('fa fa-check')
	$(this).parent().css('color', 'green')
}

// function showIngredientName(){
//     var idSuffix = $(this).attr("value")
//     nameSelector = $('#ingredient-' + idSuffix)
//     nameSelector.show()
// }
//
// function hideIngredientName(){
//       nameSelector.hide()
// }
