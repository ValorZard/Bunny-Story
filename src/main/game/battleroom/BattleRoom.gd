"""
Description

Contributors:
	Jacob Singleton - Initial implementation.
"""


extends Spatial


var ui: Node = preload("res://src/main/game/battleroom/ui/UI.tscn").instance()

var player: Node = preload("res://src/main/game/battleroom/player/Player.tscn").instance()
var enemy:  Node = preload("res://src/main/game/battleroom/enemy/Enemy.tscn").instance()


func _ready():
	add_child(ui)
	
	add_child(player)
	add_child(enemy)
	
	ui.get_node("TurnSelector/BackgroundPanel/AttackButton").connect("pressed", player, "play_jump_animation")
	ui.get_node("TurnSelector/BackgroundPanel/AttackButton").connect("pressed", enemy, "play_squish_animation")
	
	ui.get_node("TurnSelector/BackgroundPanel/DefendButton").connect("pressed", player, "raise_shield")


func _process(delta):
	pass
