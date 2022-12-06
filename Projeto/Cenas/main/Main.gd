extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	set_items()
	$CanvasLayer/AnimationPlayer.play("TransitionAnimation")
	$CanvasLayer/HBoxContainer.rect_position = Vector2(946,7)
	$KinematicBody2D.position = GameManager.playerPosition
	$CanvasLayer.connect("updating_day", self,"_on_day_updated")	
	
func _process(delta):
	$CanvasLayer/HBoxContainer/Days.text = str(GameManager.days)
	
func set_items():
	if GameManager.firstTime == true:
		GameManager.delete_data()
		GameManager.firstTime = false

		
	if GameManager.items.empty():
		for item in get_node("Room").get_tree().get_nodes_in_group("interactive_objects"):
			var itemModel = {
			"id": item.name,
			"price" : item.price,
			"comprado": item.comprado,
			"increase_health": item.increase_health
			}
			GameManager.items[item.name] = itemModel
		print(GameManager.items)
		GameManager.firstTime = false
		GameManager.save_data()
		
	else:
		print("carregando")
		#GameManager.load_data()
	for item in get_node("Room").get_tree().get_nodes_in_group("interactive_objects"):
		if GameManager.items[item.name].comprado == false:
			print("escondido")
			item.hide()
		else:
			item.show()
			
func _on_day_updated():
	GameManager.days += 1
	

