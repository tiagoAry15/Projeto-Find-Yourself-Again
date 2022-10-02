extends KinematicBody2D

signal exploded

export var initial_ball_speed = 300
export var speed_commulator = 50
var ball_speed = initial_ball_speed

var hitcounter = 0
var max_hitcounter = 12
var direction = Vector2()

var is_boosted = false
export var boost = 300

var trail_length = 30
onready var trail = $Trail/Points

func _ready():
	trail.clear_points()
	randomize()

func set_start_direction():
	var random_x = 0
	
	if randi()%10 < 5:
		random_x = 1
	else:
		random_x = -1
	
	direction = Vector2(random_x, rand_range(-1, 1))
	direction = direction.normalized() * ball_speed

func _physics_process(delta):
	if trail.points.size() > trail_length:
		trail.remove_point(0)
	trail.add_point(position)
	
	handle_boost()
	
	var y = direction.y
	var collision = move_and_collide(direction * delta)
	if collision:
		direction = direction.bounce(collision.normal)
		if collision.collider.is_in_group("rackets"):
			y = direction.y / 2 + collision.collider_velocity.y
			
			if hitcounter < max_hitcounter:
				hitcounter += 1
			
			$RacketSound.play()
		else:
			y = direction.y
			$WallSound.play()
	
	direction = Vector2(direction.x, y).normalized() * (ball_speed + hitcounter * speed_commulator)

func handle_boost():
	if Input.is_action_pressed("boost"):
		if (direction != Vector2() && !is_boosted):
			ball_speed += boost
			is_boosted = true
	else:
		if (direction != Vector2() && is_boosted):
			ball_speed -= boost
			is_boosted = false

func explode():
	$GoalExplosion.set_emitting(true)
	$Sprite.set_visible(false)
	
	ball_speed = 0
	
	$ExplosionTimer.start($GoalExplosion.lifetime + 0.2)

func reset():
	position = Vector2(512, 256)
	direction = Vector2()
	hitcounter = 0
	ball_speed = initial_ball_speed
	is_boosted = false
	trail.clear_points()
	$Sprite.set_visible(true)

func _on_ExplosionTimer_timeout():
	emit_signal("exploded")
