extends Node



var coinSound = preload("res://assets/sounds/smb_coin.wav")

	
func _process(delta):
	$Boost.text = str(GameManager.SalaryBoost)+"x"

func _on_left_body_entered(body):
	$ball.position = Vector2(640, 360)
	GameManager.healthbar -= 2

func _on_right_body_entered(body):
	$ball.position = Vector2(640, 360)
	GameManager.score += (1 * GameManager.SalaryBoost) 
	if GameManager.score % 5 == 0:
		GameManager.SalaryBoost += 1
		$AnimationPlayer.play("promotion!")
		GameManager.healthbar += 10
	else:
		$AudioStreamPlayer2D.stream = coinSound
		$AudioStreamPlayer2D.play()
	
func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/main/monitor.tscn")
