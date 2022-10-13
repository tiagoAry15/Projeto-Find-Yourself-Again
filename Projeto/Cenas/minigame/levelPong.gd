extends Node



func _on_left_body_entered(body):
	$ball.position = Vector2(640, 360)


func _on_right_body_entered(body):
	$ball.position = Vector2(640, 360)
	GameManager.score +=1


func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/main/monitor.tscn")
