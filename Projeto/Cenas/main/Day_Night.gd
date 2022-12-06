extends CanvasModulate

signal update_day
signal is_night
var onetime = true
var	CurrentFrame = 0
func _ready():
	$AnimationPlayer.seek(5)

func _process(delta):

	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(60.0)
	timer.set_one_shot(false) # Make sure it loops
	timer.start()
	var minuter = CurrentFrame % 4
	var CurrentFrame = range_lerp(minuter,0,4,0,24)
	if minuter == 3:
		if onetime: 
			emit_signal("is_night")
			onetime = false
	else:
		onetime = true
		

	$AnimationPlayer.play("Animation_Day_Night")
	$AnimationPlayer.seek(CurrentFrame)
	yield($AnimationPlayer, "animation_finished")
	emit_signal("update_day")
	
func _on_Timer_timeout():
	CurrentFrame += 1

func to_day_transition():
	CurrentFrame += 2
