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
	get_parent().get_node("UI/HealthManaBar/BackgroundPanel/EnemyHealthText").text = "Enemy Health: " + str(health) + "/" + str(max_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_ui()


func add_health(extra_health):
	health += extra_health


func remove_health(minus_health):
	health -= minus_health


"""
Plays the squishing animation.
"""
func play_squish_animation():
	$JumpSquish.queue("JumpSquish")
