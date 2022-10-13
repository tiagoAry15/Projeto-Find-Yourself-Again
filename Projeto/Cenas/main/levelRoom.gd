extends Node2D



func _on_Area2D_body_entered(body):
	$monitor.show()
	$monitor/Menu/workButton.show()
	$monitor/Menu/shop.show()
	$player.hide()
	print('hellio')





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
