extends Node

signal sleep
signal pill
signal eat_food
func _Sleep():
	emit_signal("sleep")
	
func _Work():
	get_tree().change_scene("res://Cenas/main/monitor.tscn")	
	

func _End_Game():
	get_tree().change_scene("res://Cenas/main/Final.tscn")
	
func _Workout():
	GameManager.healthbar += 25

func _play_game():
	GameManager.healthbar += 25

func _take_pill():
	GameManager.healthbar += 25
	emit_signal("pill")

func _eat():
	GameManager.healthbar += 25
	emit_signal("eat_food")
