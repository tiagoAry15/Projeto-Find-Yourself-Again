extends Node2D

signal is_working

	

func _process(delta):
	$Pagina1/Score.text = "Saldo: " + str(GameManager.score)
	$Pagina2/Score.text = "Saldo: " + str(GameManager.score)

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		emit_signal("is_working")
		get_tree().change_scene("res://Cenas/main/monitor.tscn")
		


func _on_back_pressed():
	get_tree().change_scene("res://Cenas/main/monitor.tscn")


func _ready():
	GameManager.load_data()
	print(GameManager.items)
	for item in get_tree().get_nodes_in_group("items_buttons"):
		print("item? " + item.name)
		item.connect("pressed", self,"buy_item", [item])
		
		
	$Pagina1/Voltar.show()
	
	
func buy_item(objeto):
	if GameManager.score >= GameManager.items[objeto.name].price:
		GameManager.items[objeto.name].comprado = true
		GameManager.score -= GameManager.items[objeto.name].price
		GameManager.save_data()
		# esgotado
		
func _on_Button_pressed():
	
	get_tree().change_scene("res://Cenas/main/monitor.tscn")
	pass # Replace with function body.


func _on_Voltar2_pressed():
	$Camera2D.offset = Vector2(1024 , 0)


func _on_Voltar_pressed():
		get_tree().change_scene("res://Cenas/main/monitor.tscn")


func _on_VoltarPag1_pressed():
	$Camera2D.offset = Vector2(0 , 0)

