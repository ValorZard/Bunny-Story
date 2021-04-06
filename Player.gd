extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var health : int = 10
var max_health : int = 10

var mana : int = 10
var max_mana : int = 10

var coins : int = 0

var level : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func update_ui():
	get_parent().get_node("Control/BattlePanel/PlayerHealthText").text = "Health: " + str(health) + "/" + str(max_health)
	get_parent().get_node("Control/BattlePanel/PlayerManaText").text = "Mana: " + str(mana) + "/" + str(max_health)
	get_parent().get_node("Control/BattlePanel/MoneyText").text = "Coins: " + str(coins)
	get_parent().get_node("Control/BattlePanel/LevelText").text = "Level: " + str(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_ui()


func _on_AttackButton_pressed():
	get_parent().get_node("Enemy").health -= 1


func _on_MagicButton_pressed():
	get_parent().get_node("Enemy").health -= 3
	mana -= 2


func _on_DefendButton_pressed():
	pass # Replace with function body.


func _on_SkipButton_pressed():
	pass # Replace with function body.
