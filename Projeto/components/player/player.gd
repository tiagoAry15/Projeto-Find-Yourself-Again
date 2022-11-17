extends KinematicBody2D

signal update_health
signal working

var speed = Vector2(4, 2)
var last_mouse_pos = null
var last_sprite_animation = null;

var healthbar = 255;


var isWorking = false
var doingSomething = false
var sprite_movement = {
	"walk_up":"idle_up",
	"walk_down":"idle_down",
	"walk_right":"idle_right",
	"walk_left":"idle_left"
}


func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(1.0)
	timer.set_one_shot(false) # Make sure it loops
	timer.start()


func catersian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y)/2)

func _input(event):
	if event.is_action_pressed("game_move") :
		last_mouse_pos = get_global_mouse_position()
		
func _physics_process(delta):
	#$AnimatedSprite.modulate = Color(healthbar,healthbar,healthbar)
	if last_mouse_pos:
		var direction_vector = (last_mouse_pos - global_position)
		
		if direction_vector.length() < 5:
			if last_sprite_animation :
				$AnimatedSprite.play(sprite_movement[last_sprite_animation])
			return
		
		var motion = direction_vector.normalized()  * speed
		var velocity  = move_and_collide(motion)
		var x_axis = direction_vector.normalized()[0]
		var y_axis = direction_vector.normalized()[1]
		
	
		if x_axis > y_axis && x_axis < -y_axis:
			 $AnimatedSprite.play("walk_up")
			 last_sprite_animation = "walk_up"
		elif x_axis < y_axis && x_axis > -y_axis:
			 $AnimatedSprite.play("walk_down")
			 last_sprite_animation = "walk_down"
		else:
			if x_axis > 0:
				$AnimatedSprite.play("walk_right")
				last_sprite_animation = "walk_right"
			else:
				$AnimatedSprite.play("walk_left")	
				last_sprite_animation = "walk_left"
		
		
		if velocity and velocity.collider:
			if velocity.collider.get_parent().is_in_group("interactive_objects"):
				var nome_objeto = velocity.collider.get_parent().name
				doingSomething = true
				$AnimatedSprite.play(GameManager.animacoes[nome_objeto])
				update_health(GameManager.atividades[nome_objeto]);
				
				
			if last_sprite_animation:
				$AnimatedSprite.play(sprite_movement[last_sprite_animation])
			

func on_character_working():
	isWorking = true
	print(isWorking)
	pass # Replace with function body.


func _on_Timer_timeout():
	if not isWorking and not doingSomething:
		update_health(-5)

func update_health(valor):
	healthbar += valor
	
		
	
