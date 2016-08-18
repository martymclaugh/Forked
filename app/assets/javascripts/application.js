// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require_tree .


$(document).on("ready", function(){
	$('.ingredient-check').on('click', recipeDone)
	$('.directions').on('click', directionDone)
	addIngredient();
	hideCustomIngredients();
})


function recipeDone(){
	$(this).css('color', 'green')
}

function directionDone(){
	console.log("Im clicked")
	$(this).html('')
	$(this).addClass('fa fa-check')
	$(this).parent().css('color', 'green')
	$(this).parent().parent().siblings().css('color', 'gray')


}

function addIngredient(){
	$('#ingredient-add').on('click', function(event){
		event.preventDefault();
		console.log(event);
		var formData = $('Input#ingredient_ingredient').serialize()
		$.ajax({
			url: '/ingredients',
			method: 'POST',
			data: formData
		})
		.done(function(response){
			$('.ingredients-list').append(response);
			$('#ingredient-form')[0].reset();
		})
	})
}

function hideCustomIngredients(){
	$('.users-ingredients').on('click', function(){
		$('#custom-ingredients').toggle();
		$('#my-ingredients').toggle();
	})
}
