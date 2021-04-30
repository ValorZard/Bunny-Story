"""
Description
"""


extends Spatial

var ui: Node = preload("res://src/main/game/battleroom/ui/UI.tscn").instance()

var player: Node = preload("res://src/main/game/battleroom/player/Player.tscn").instance()
var enemy:  Node = preload("res://src/main/game/battleroom/enemy/Enemy.tscn").instance()

var crit: bool = false


func _on_attack_button_pressed():
	if not player.get_node("JumpAnimation").is_playing():	
		player.play_walk_up()
		player.play_jump_minigame_animation()
		
		enemy.play_squish_animation()
		
		$JumpMinigame.visible = true
		$JumpMinigame/MovingLineAnimation.queue("CritMove")


func _ready():
	add_child(ui)
	
	add_child(player)
	add_child(enemy)
	
	ui.get_node("TurnSelector/BackgroundPanel/AttackButton").connect("pressed", self, "_on_attack_button_pressed")
	ui.get_node("TurnSelector/BackgroundPanel/DefendButton").connect("pressed", player, "raise_shield")


func _process(delta):
	if $JumpMinigame/MovingLineAnimation.is_playing():
		_jump_minigame_process()


func _jump_minigame_process():
	if Input.is_action_just_pressed("jump_button"):
		if $JumpMinigame/MovingLine.rect_position.y >= 140:
			# they crit
			print('crit')
			crit = true
			pass
		else:
			print('no crit')
			crit = false
			#they did not crit
			pass


func _on_jump_minigame_finish(anim_name):
	$JumpMinigame.visible = false
	
	if crit:
		pass
	else:
		pass
	
	crit = false
