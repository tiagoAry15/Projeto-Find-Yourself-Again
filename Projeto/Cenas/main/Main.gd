extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if GameManager.firstTime == true:
		GameManager.delete_data()
		print("new game")
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

