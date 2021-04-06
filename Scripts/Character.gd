extends Sprite3D

class_name Character

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var health : int = 10
var max_health : int = 10

var mana : int = 10
var max_mana : int = 10

var coins : int = 0

var level : int = 1
var experience : int = 5

var attack_array : Array = []
var spell_array : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
