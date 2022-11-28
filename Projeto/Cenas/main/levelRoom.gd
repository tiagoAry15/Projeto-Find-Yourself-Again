extends Node2D

signal is_working

func _ready():
	for item in get_tree().get_nodes_in_group("interactive_objects"):
		print(GameManager.items)
		
			
func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		emit_signal("is_working")
		get_tree().change_scene("res://Cenas/main/monitor.tscn")
	
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
