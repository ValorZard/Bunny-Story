"""
Description

Contributors:
	Jacob Singleton - Initial implementation.
"""


extends Sprite3D


var health : int = 10
var max_health : int = 10

var mana : int = 10
var max_mana : int = 10

var coins : int = 0

var level : int = 1

func _ready():
	# Clear the viewport.
	var viewport = $Viewport
	$Viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	# Let two frames pass to make sure the vieport is captured.
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	# Retrieve the texture and set it to the viewport quad.
	texture  = viewport.get_texture()


func update_ui():
	get_parent().get_node("BattleMain/BattlePanel/PlayerHealthText").text = "Health: " + str(health) + "/" + str(max_health)
	get_parent().get_node("BattleMain/BattlePanel/PlayerManaText").text = "Mana: " + str(mana) + "/" + str(max_health)
	get_parent().get_node("BattleMain/BattlePanel/MoneyText").text = "Coins: " + str(coins)
	get_parent().get_node("BattleMain/BattlePanel/LevelText").text = "Level: " + str(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_ui()


"""
Plays the jumping animation.
"""
func play_jump_animation():
	if not $JumpAnimation.is_playing():
		$JumpAnimation.queue("WalkUp")
		$JumpAnimation.queue("JumpOn")
		$JumpAnimation.queue("JumpOff")
		$JumpAnimation.queue("WalkBack")


func _on_MagicButton_pressed():
	get_parent().get_node("Enemy").health -= 3
	mana -= 2


func _on_DefendButton_pressed():
	pass # Replace with function body.


func _on_SkipButton_pressed():
	pass # Replace with function body.
