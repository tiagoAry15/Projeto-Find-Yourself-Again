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
	for item in get_tree().get_nodes_in_group("items_buttons"):
		item.connect("pressed", self,"buy_item")
		
	$back.show()
	
	
func buy_item(objeto):
	if GameManager.score >= GameManager.items[objeto.name].price:
		GameManager.items[objeto.name].comprado = true
		GameManager.score -= GameManager.items[objeto.name].price
		# esgotado
		
func _on_Button_pressed():
	
	get_tree().change_scene("res://Cenas/main/monitor.tscn")
	pass # Replace with function body.

func _on_Halter_pressed():
	if GameManager.itens_comprados["Halter"] == false:
		if GameManager.score >= 10:
			GameManager.score -= 10
			GameManager.itens_comprados["Halter"] = true


func _on_P_pressed():
	if GameManager.itens_comprados["Piano3"] == false:
		if GameManager.score >= 35:
			GameManager.score -= 35
			GameManager.itens_comprados["Piano3"] = true
			


func _on_Console_pressed():
	if GameManager.itens_comprados["Console"] == false:
		if GameManager.score >= 25:
			GameManager.score -= 25
			GameManager.itens_comprados["Console"] = true


func _on_TextureButton_pressed():
	if GameManager.itens_comprados["Art"] == false:
		if GameManager.score >= 15:
			GameManager.score -= 15
			GameManager.itens_comprados["Art"] = true


func _on_Books_pressed():
	if GameManager.itens_comprados["Books"] == false:
		if GameManager.score >= 10:
			GameManager.score -= 10
			GameManager.itens_comprados["Books"] = true


func _on_Espelho_pressed():
	if GameManager.itens_comprados["Mirror"] == false:
		if GameManager.score >= 5:
			GameManager.score -= 5
			GameManager.itens_comprados["Mirror"] = true


func _on_Comida_pressed():
		if GameManager.score >= 3:
			GameManager.score -= 3


func _on_Remedio_pressed():
		if GameManager.score >= 8:
			GameManager.score -= 8


func _on_Voltar2_pressed():
	$Camera2D.offset(Vector2(1540 , 301))


func _on_Voltar_pressed():
		get_tree().change_scene("res://Cenas/main/monitor.tscn")


func _on_VoltarPag1_pressed():
	$Camera2D.offset(Vector2(512 , 301))

