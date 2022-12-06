extends Node2D

signal is_working
func _process(delta):

	pass

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		emit_signal("is_working")
		get_tree().change_scene("res://Cenas/main/monitor.tscn")
		

func _on_buy1_pressed():
	if GameManager.score >= 5:
		GameManager.score -= 5
		$Cenario/tapete.show()
	


func _on_buy2_pressed():
	if GameManager.score >= 5:
		GameManager.score -= 5
		$Cenario/TableRoundBlue.show()


func _on_back_pressed():
	$monitor/Menu/buy1.show()
	$monitor/Menu/buy2.show()
	$monitor/Menu/workButton.show()
	$monitor/Menu/shop.show()
	$monitor/Menu/buy1.hide()
	$monitor/Menu/buy2.hide()


func _on_monitor_blue_comprado():
	$TableRoundBlue.show()
	pass # Replace with function body.


func _on_monitor_tapete_comprado():
	$Cenario/Art75.show()
	pass # Replace with function body.

func _on_Halter_pressed():
	$Cenario/Halter.show()


func _on_P_pressed():
	$Cenario/Piano3.show()


func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/main/monitor.tscn")
	pass # Replace with function body.
