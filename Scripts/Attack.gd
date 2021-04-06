extends Node

class_name Attack

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var damage : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func attack_thing(attacker: Character, thing: Character):
	thing.health -= damage

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
