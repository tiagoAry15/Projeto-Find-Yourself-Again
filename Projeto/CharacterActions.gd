extends Node

signal sleep

func _Sleep():
	emit_signal("sleep")
	
func _Work():
	get_tree().change_scene("res://Cenas/main/monitor.tscn")	
	

func _End_Game():
	get_tree().change_scene("res://Cenas/main/Final.tscn")
	
func _Workout():
	print("adicione coisa")

func _play_game():
	print("jogar")
