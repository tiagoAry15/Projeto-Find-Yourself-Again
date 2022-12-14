extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	set_items()	
	
	$CanvasLayer/AnimationPlayer.play("TransitionAnimation")
	$CanvasLayer/HBoxContainer.rect_position = Vector2(946,7)
	$KinematicBody2D.position = GameManager.playerPosition
	$CanvasLayer.connect("updating_day", $Room/CanvasModulate,"to_day_transition" )
	$CanvasLayer.connect("updating_day", self,"_on_day_updated")	
	$Room/CanvasModulate.connect("is_night", $KinematicBody2D,"is_sleepy" )

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

		print("itens adicionados")


		GameManager.save_data()
		
	else:
		print("carregando")
		#GameManager.load_data()
	for item in get_node("Room").get_tree().get_nodes_in_group("interactive_objects"):
		if GameManager.items[item.name].comprado == false:
		
			item.hide()
		else:
			item.show()
			
func _on_day_updated():
	GameManager.days += 1
	if GameManager.days == 2:
		$Room/Cenario/Door/Area2D/CollisionShape2D.disabled = false 
	

