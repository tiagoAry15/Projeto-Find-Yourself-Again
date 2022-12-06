extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for button in get_tree().get_nodes_in_group("items_buttons"):
		button.connect("pressed", self, "buy_item",[button.name])

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func buy_item(item):
	if GameManager.score >= 5:
		GameManager.score -= 5
		GameManager.itens_comprados[item] = true
		get_node("Menu/" + item).hide()



func _on_Button_Shop_pressed():
	get_tree().change_scene("res://Cenas/main/Marketplace.tscn")

func _on_Button_Work_pressed():
	get_tree().change_scene("res://Cenas/minigame/pong.tscn")
	get_tree().change_scene("res://Cenas/main/Marketplace.tscn")


func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/main/Main.tscn")
