extends CanvasModulate

signal update_day

func _ready():
	$AnimationPlayer.seek(5)

func _process(delta):
	var time = OS.get_time()
	var TimeInSeconds = time.second
	var CurrentFrame = range_lerp(TimeInSeconds,0,59,0,120)
	$AnimationPlayer.play("Animation_Day_Night")
	$AnimationPlayer.seek(CurrentFrame)
	yield($AnimationPlayer, "animation_finished")
	emit_signal("update_day")
	
