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


func _on_back_pressed():
	
	$Menu/workButton.show()
	$Menu/shop.show()
	
	$back.hide()

	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().change_scene("res://Cenas/main/Main.tscn")
	pass # Replace with function body.


func _on_Button_Game_pressed():
	get_tree().change_scene("res://Cenas/minigame/pong.tscn")


func _on_Button_Shop_pressed():
	get_tree().change_scene("res://Cenas/main/Marketplace.tscn")
	
	
	for item in get_tree().get_nodes_in_group("items_buttons"):
		print(item.name)
		if GameManager.itens_comprados[item.name] == true:
			get_node("Menu/" + item.name).hide()
		else:
			get_node("Menu/" + item.name).show()
	$back.show()
