extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var health : int = 10

var max_health : int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_ui():
	get_parent().get_node("Control/BattlePanel/EnemyHealthText").text = "Enemy Health: " + str(health) + "/" + str(max_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_ui()


"""
Called when the attack button is pressed.
Temporarily acts like a Jump Attack.
"""
func _on_AttackButton_pressed():
	if not $JumpSquish.is_playing():
		$JumpSquish.queue("JumpSquish")
		$JumpSquish.queue("JumpUnsquish")
	
	get_parent().get_node("Enemy").health -= 5
