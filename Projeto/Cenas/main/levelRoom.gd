extends Node2D

signal is_working


func _ready():
	for item in get_tree().get_nodes_in_group("objects"):
		if len(item.get_children()) != 0:
			print(item.get_children()[0])
	$Cenario/Door/Area2D/CollisionShape2D.disabled = true
	
	CharacterActions.connect("pill", self, "on_pill_used")
	CharacterActions.connect("eat", self, "on_food_eated")

func on_pill_used():
	$WallShelving1/Remedio.visible = false

func on_food_eated():
	$Cenario/mesa_com_comida/Comida.visible = false

	
func _on_exit_pressed():
	$monitor.hide()
	$player.show()

func _on_shop_pressed():
	$monitor/Menu/workButton.hide()
	$monitor/Menu/shop.hide()
	$monitor/Menu/buy1.show()
	$monitor/Menu/buy2.show()




func _on_back_pressed():
	$monitor/Menu/buy1.show()
	$monitor/Menu/buy2.show()
	$monitor/Menu/workButton.show()
	$monitor/Menu/shop.show()
	$monitor/Menu/buy1.hide()
	$monitor/Menu/buy2.hide()



