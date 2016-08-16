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
//= require turbolinks
//= require_tree .


$(document).on("ready", function(){
	$('.ingredient-check').on('click', recipeDone)
	$('.directions').on('click', directionDone)
	addIngredient()
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
	$('#ingredient-form').on('submit', function(event){
		event.preventDefault();
		var formData = $('Input#ingredient_ingredient').serialize()
		console.log(formData);
		$.ajax({
			url: '/ingredients',
			method: 'POST',
			data: formData
		})
		.done(function(response){
			console.log(response);
			// var html = "<div class='ingredient-item'> <img class='ingredient-image' src='" + response.image + "' value='"+ response.name + "'><div class='ingredient-name'> <p>" + response.name + "</p></div> <div class='ingredient-delete'> <%= button_to 'X', {:controller => :ingredients, :action => 'destroy', :id => " + response.id + "}, :method => :delete %> </div> </div>"
			$('.ingredients-list').append(response);
		})
	})
}
