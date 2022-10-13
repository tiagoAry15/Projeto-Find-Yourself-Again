extends Sprite

signal tapete_comprado
signal blue_comprado
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_shop_pressed():
	$Menu/workButton.hide()
	$Menu/shop.hide()
	$Menu/buy1.show()
	$Menu/buy2.show()
	$back.show()
	pass # Replace with function body.


func _on_buy1_pressed():
	if GameManager.score >= 5:
		GameManager.score -= 5
		emit_signal("tapete_comprado")
		$Menu/buy1.hide()
		GameManager.tapeteComprado = true
	pass # Replace with function body.


func _on_buy2_pressed():
	if GameManager.score >= 5:
		GameManager.score -= 5
		emit_signal("blue_comprado")
		$Menu/buy2.hide()
		GameManager.bancoComprado = true
	pass # Replace with function body.


func _on_back_pressed():
	$Menu/buy1.show()
	$Menu/buy2.show()
	$Menu/workButton.show()
	$Menu/shop.show()
	$Menu/buy1.hide()
	$Menu/buy2.hide()
	$back.hide()

	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().change_scene("res://Cenas/main/Main.tscn")
	pass # Replace with function body.
