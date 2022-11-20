extends CanvasModulate


func _process(delta):
	var time = OS.get_time()
	var TimeInSeconds = time.second
	var CurrentFrame = range_lerp(TimeInSeconds,0,59,0,24)
	$AnimationPlayer.play("Animation_Day_Night")
	$AnimationPlayer.seek(CurrentFrame)
