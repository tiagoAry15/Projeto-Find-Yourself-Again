extends Node


var streak = 0;
var coinSound = preload("res://assets/sounds/smb_coin.wav")

func _ready():
	$Promotion.visible = false

func _process(delta):
	$Boost.text = str(GameManager.SalaryBoost)+"x"
	
	
func _on_left_body_entered(body):
	$ball.position = Vector2(640, 360)
	GameManager.healthbar -= 2
	streak = 0

func _on_right_body_entered(body):
	$ball.position = Vector2(640, 360)
	GameManager.score += (1 * GameManager.SalaryBoost)
	streak += 1  
	if streak == 5:
		streak= 0
		GameManager.SalaryBoost += 1
		$AnimationPlayer.play("promotion!")
		GameManager.healthbar += 10
	else:
		$AudioStreamPlayer2D.stream = coinSound
		$AudioStreamPlayer2D.play()
	
func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/main/monitor.tscn")


func _on_back_pressed():
	pass # Replace with function body.
