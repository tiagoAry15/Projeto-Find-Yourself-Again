extends TextureRect

func _process(delta):
	var time = OS.get_time()
	var TimeInSeconds = time.second
	var CurrentFrame = range_lerp(TimeInSeconds,0,59,0,24)
	$AnimationPlayer.play("CEU")
	$AnimationPlayer.seek(CurrentFrame)
