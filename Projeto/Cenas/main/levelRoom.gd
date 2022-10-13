extends Node2D


func _process(delta):
	if GameManager.tapeteComprado == true:
		$Cenario/Art75.show()
	if GameManager.bancoComprado == true:
		$TableRoundBlue.show()
	pass



func _on_Area2D_body_entered(body):
	print("teste")
	if body is KinematicBody2D:
		get_tree().change_scene("res://Cenas/main/monitor.tscn")






func _on_exit_pressed():
	$monitor.hide()
	$player.show()

func _on_shop_pressed():
	$monitor/Menu/workButton.hide()
	$monitor/Menu/shop.hide()
	$monitor/Menu/buy1.show()
	$monitor/Menu/buy2.show()


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
