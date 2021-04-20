"""
Description

Contributors:
	Jacob Singleton - Initial implementation.
"""


extends Spatial


var battle_ui: Node = preload("res://Scenes/UIs/BattleUI.tscn").instance()

var player: Node = preload("res://Scenes/Player.tscn").instance()
var enemy:  Node = preload("res://Scenes/Enemy.tscn").instance()


func _ready():
	add_child(battle_ui)
	
	add_child(player)
	add_child(enemy)
	
	battle_ui.get_node("CharacterPanel/AttackButton").connect("pressed", player, "play_jump_animation")
	battle_ui.get_node("CharacterPanel/AttackButton").connect("pressed", enemy, "play_squish_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
