"""
Adds functionality for keyboard support in the menu
and handles button input for the exit button.
"""


extends Control


func _ready() -> void:
	"""
	Called when the title screen is loaded. Grabs focus of
	the first button to allow keyboard support.
	"""
	
	$Menu/Buttons/StartGame.grab_focus()


func _on_options_button_pressed() -> void:
	"""
	Called when the options button is pressed. 
	Plays rick roll music.
	"""
	
	if not $Audio/RickRoll.playing:
		$Audio/RickRoll.play(0)


func _on_exit_button_pressed() -> void:
	"""
	Called when the exit button is pressed. Closes the game.
	"""
	
	get_tree().quit()
