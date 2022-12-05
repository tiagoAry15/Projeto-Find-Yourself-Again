extends Node2D

signal is_working


func _ready():
	for item in get_tree().get_nodes_in_group("objects"):
		if len(item.get_children()) != 0:
			print(item.get_children()[0])
	
	$CanvasModulate.connect("update_day",self,"_on_day_updated")
	
	
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



