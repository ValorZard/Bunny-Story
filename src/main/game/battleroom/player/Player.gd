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
	$Viewport.set_clear_mode(Viewport.CLEAR_MODE_ALWAYS)
	# Let two frames pass to make sure the vieport is captured.
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	# Retrieve the texture and set it to the viewport quad.
	texture  = $Viewport.get_texture()


func update_ui():
	get_parent().get_node("UI/HealthManaBar/BackgroundPanel/PlayerHealthText").text = "Health: " + str(health) + "/" + str(max_health)
	get_parent().get_node("UI/HealthManaBar/BackgroundPanel/PlayerManaText").text = "Mana: " + str(mana) + "/" + str(max_health)
	get_parent().get_node("UI/Info/BackgroundPanel/MoneyText").text = "Coins: " + str(coins)
	get_parent().get_node("UI/Info/BackgroundPanel/LevelText").text = "Level: " + str(level)


func _process(delta):
	update_ui()


"""
Plays the jumping animation.
"""
func play_jump_animation():
	if not $JumpAnimation.is_playing():
		$Viewport/Bunny/AnimationPlayer.queue("walk")
		$JumpAnimation.queue("WalkUp")
		$Viewport/Bunny/AnimationPlayer.queue("rest")
		
		$JumpAnimation.queue("JumpOn")
		$JumpAnimation.queue("JumpOff")
		
		$Viewport/Bunny/AnimationPlayer.queue("walk")
		$JumpAnimation.queue("WalkBack")

func raise_shield():
	$Viewport/Bunny/Shield.set_visible(true)


func _on_MagicButton_pressed():
	get_parent().get_node("Enemy").health -= 3
	mana -= 2


func _on_DefendButton_pressed():
	pass # Replace with function body.


func _on_SkipButton_pressed():
	pass # Replace with function body.
