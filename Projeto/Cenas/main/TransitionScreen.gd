extends CanvasLayer

signal updating_day
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	CharacterActions.connect("sleep", self,"play_dayTransition")

func play_dayTransition():
	$AnimationPlayer.play("sleep")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
