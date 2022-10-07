extends KinematicBody2D

var speed = Vector2(64, 64)
var last_mouse_pos = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("game_move") :
		last_mouse_pos = get_viewport().get_mouse_position()

func _physics_process(delta):
	if last_mouse_pos:
		var direction_vector = (last_mouse_pos - global_position).normalized()
	
		if direction_vector.length() < 3:
			return
	
		var velocity  = move_and_slide(direction_vector  * 64)
		
		if velocity.x > velocity.y && velocity.x < -velocity.y:
			 $AnimatedSprite.play("walk_up")
		elif velocity.x < velocity.y && velocity.x > -velocity.y:
			 $AnimatedSprite.play("walk_down")
		else:
			if velocity.x > 0:
				$AnimatedSprite.play("walk_right")
			else:
				$AnimatedSprite.play("walk_left")	
		
