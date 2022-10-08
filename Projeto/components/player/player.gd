extends KinematicBody2D

var speed = Vector2(128, 128)
var last_mouse_pos = null
var last_sprite_animation = null;

var sprite_movement = {
	"walk_up":"idle_up",
	"walk_down":"idle_down",
	"walk_right":"idle_right",
	"walk_left":"idle_left"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("game_move") :
		print(get_viewport().get_mouse_position())
		last_mouse_pos = get_global_mouse_position()
		print(position)
func _physics_process(delta):
	if last_mouse_pos:
		var direction_vector = (last_mouse_pos - global_position)
	
		if direction_vector.length() < 3:
			if last_sprite_animation:
				$AnimatedSprite.play(sprite_movement[last_sprite_animation])
			return
	
		var velocity  = move_and_slide(direction_vector.normalized()  * speed)
		
		if velocity.x > velocity.y && velocity.x < -velocity.y:
			 $AnimatedSprite.play("walk_up")
			 last_sprite_animation = "walk_up"
		elif velocity.x < velocity.y && velocity.x > -velocity.y:
			 $AnimatedSprite.play("walk_down")
			 last_sprite_animation = "walk_down"
		else:
			if velocity.x > 0:
				$AnimatedSprite.play("walk_right")
				last_sprite_animation = "walk_right"
			else:
				$AnimatedSprite.play("walk_left")	
				last_sprite_animation = "walk_left"
		
