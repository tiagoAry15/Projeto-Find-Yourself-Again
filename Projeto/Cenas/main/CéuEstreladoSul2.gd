extends TextureRect

func _process(delta):
	var time = OS.get_time()
	var TimeInSeconds = time.second
	var minuter = time.minute % 4
	var CurrentFrame = range_lerp(TimeInSeconds,0,4,0,24)
	$AnimationPlayer.play("CEU")
	$AnimationPlayer.seek(CurrentFrame)
