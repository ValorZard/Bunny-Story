extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name Character

var health : int = 10
var max_health : int = 10

var mana : int = 10
var max_mana : int = 10

var coins : int = 0

var level : int = 1
var experience : int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
