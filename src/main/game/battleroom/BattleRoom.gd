"""
Description
"""


extends Spatial

var max_time: float = 4.0
var time_buffer: float = 0.05

var timer_minigame_going: bool = false
var crit: bool = false

var ui: Node = preload("res://src/main/game/battleroom/ui/UI.tscn").instance()

var player: Node = preload("res://src/main/game/battleroom/player/Player.tscn").instance()
var enemy:  Node = preload("res://src/main/game/battleroom/enemy/Enemy.tscn").instance()

func _ready():
	add_child(ui)
	
	add_child(player)
	add_child(enemy)
	
	ui.get_node("TurnSelector/BackgroundPanel/AttackButton").connect("pressed", self, "_timer_minigame_ready")
	
	ui.get_node("TurnSelector/BackgroundPanel/DefendButton").connect("pressed", player, "raise_shield")

func _timer_minigame():
	if $MinigameTimer.is_stopped():
		timer_minigame_going = false
		
	if Input.is_action_just_pressed("jump_button"):
		if $MinigameTimer.time_left <= 1.0 + time_buffer and $MinigameTimer.time_left >= 1.0 - time_buffer:
			crit = true
	
	if crit:
		player.play_jump_animation()
		enemy.play_squish_animation()
		crit = false
		
func _timer_minigame_ready():
	timer_minigame_going = true
	$MinigameTimer.start(max_time)
	
	player.play_jump_animation()
	enemy.play_squish_animation()
	


func _process(delta):
	if timer_minigame_going:
		_timer_minigame()
