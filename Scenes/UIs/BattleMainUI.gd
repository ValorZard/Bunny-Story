extends Control


onready var attack_button = $CharacterPanel/AttackButton
onready var magic_button = $CharacterPanel/MagicButton
onready var defend_button = $CharacterPanel/DefendButton
onready var skip_button = $CharacterPanel/SkipButton

var Player: Node = load("res://Scenes/Player.tscn").instance()
var Enemy: Node = load("res://Scenes/Enemy.tscn").instance()

func _ready():
	attack_button.connect("pressed", self, "_attack_pressed")
	#magic_button.connect("pressed", self, "_on_MagicButton_pressed")
	#defend_button.connect("pressed", self, "_on_DefendButton_pressed")
	#skip_button.connect("pressed", self, "_on_SkipButton_pressed")
	
	get_tree().current_scene.add_child(Player)
	get_tree().current_scene.add_child(Enemy)
	
func _attack_pressed():
	Player._on_AttackButton_pressed()
	Enemy._on_AttackButton_pressed()
	
	
