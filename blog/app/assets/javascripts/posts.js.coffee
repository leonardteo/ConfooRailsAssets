# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	# No check
	# $('#foo').fadeOut()


	# Controller/action specific check
	if controller() == "users" and action() == "index"
		$('#foo').fadeOut()


	# Debug
	if debug
		console.log("Debug is on!")