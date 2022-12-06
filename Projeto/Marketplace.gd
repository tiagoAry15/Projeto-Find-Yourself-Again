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
	for item in get_tree().get_nodes_in_group("items_buttons"):
		item.connect("pressed", self,"buy_item",[item])

	
	
func buy_item(objeto):
	print(GameManager.items)
	if GameManager.score >= GameManager.items[objeto.name].price:
		GameManager.items[objeto.name].comprado = true
		GameManager.score -= GameManager.items[objeto.name].price
		print(GameManager.items[objeto.name].name)
		
func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/main/monitor.tscn")
	pass # Replace with function body.

func _on_Voltar2_pressed():
	$Camera2D.offset(Vector2(1540 , 301))


func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/main/monitor.tscn")


func _on_VoltarPag1_pressed():
	$Camera2D.offset(Vector2(512 , 301))

