extends Node2D
var music = preload("res://assets/sounds/A Tender Feeling.mp3")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.modulate = Color(1,1,1,0)
	$AnimationPlayer.play("Final Game")
	yield($AnimationPlayer,"animation_finished")
	$AudioStreamPlayer2D.stream = music
	$AudioStreamPlayer2D.play()
	var novo_dialogo = Dialogic.start('final')
	add_child(novo_dialogo)
	novo_dialogo.connect("timeline_end", self, "play_credits")
	novo_dialogo.connect("dialogic_signal", self, "play_credits")
	pass # Replace with function body.

func play_credits():
	print("entrou")
	$AnimationPlayer.play("Thanks_for_playing")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
