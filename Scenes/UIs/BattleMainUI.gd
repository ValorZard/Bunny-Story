extends Control

var player: Node = preload("res://Scenes/Player.tscn").instance()
var enemy: Node = preload("res://Scenes/Enemy.tscn").instance()

func _ready():
	$CharacterPanel/AttackButton.connect("pressed", player, "play_jump_animation")
	$CharacterPanel/AttackButton.connect("pressed", enemy, "play_squish_animation")
	
	get_tree().current_scene.add_child(player)
	get_tree().current_scene.add_child(enemy)
	
	
