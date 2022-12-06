extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("TransitionAnimation")
	yield($AnimationPlayer,"animation_finished")
	var novo_dialogo = Dialogic.start('terms')
	add_child(novo_dialogo)
	novo_dialogo.connect("dialogic_signal", self, "on_end_dialog")
 
func on_end_dialog(value):
	$AnimationPlayer.play_backwards("TransitionAnimation")
	yield($AnimationPlayer,"animation_finished")
	if value == "sim":
		get_tree().change_scene("res://Cenas/main/Main.tscn")
	else:
		get_tree().change_scene("res://Cenas/main/Menu.tscn")
		
