extends CanvasModulate

signal update_day

func _ready():
	$AnimationPlayer.seek(5)

func _process(delta):
	var time = OS.get_time()

	var minuter = time.minute % 4
	var CurrentFrame = range_lerp(minuter,0,4,0,24)

	$AnimationPlayer.play("Animation_Day_Night")
	$AnimationPlayer.seek(CurrentFrame)
	yield($AnimationPlayer, "animation_finished")
	emit_signal("update_day")
	
