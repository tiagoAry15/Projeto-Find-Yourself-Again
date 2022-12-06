extends KinematicBody2D

signal update_health
signal working
signal interact


var imagem = load("res://assets/terraria.png")
var randomNumber = 0
var randomNumber2 = 0
var textura;
var speed = Vector2(4, 2)
var last_mouse_pos = null
var last_sprite_animation = null;
var interactable = true
var object = null
var rng = RandomNumberGenerator.new()
var isWorking = false
var doingSomething = false
var sprite_movement = {
	"walk_up":"idle_up",
	"walk_down":"idle_down",
	"walk_right":"idle_right",
	"walk_left":"idle_left"
}


func _ready():
	rng.randomize()
	var timer = Timer.new()
	textura = AtlasTexture.new()
	textura.atlas = imagem
	$Emotion.texture = textura
	$Emotion.hide()
	add_child(timer)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(1.0)
	timer.set_one_shot(false) # Make sure it loops
	timer.start()
	self.connect("interact",GameManager,"object_interact")
	randomNumber = rng.randi_range(10,15)
	randomNumber2 = rng.randi_range(15,45)

func _input(event):
	if event.is_action_pressed("game_move") :
		last_mouse_pos = get_global_mouse_position()
	if event.is_action_pressed("interact_button") and interactable:
		GameManager.playerPosition = global_position
		emit_signal("interact", object)
		

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
			if velocity.collider.get_parent().is_in_group("objects"):
				$InteractionButton.visible = true
				interactable = true
				var nome_objeto = velocity.collider.get_parent().name
				object = nome_objeto
				#$AnimatedSprite.play(GameManager.animacoes[nome_objeto])
			if last_sprite_animation:
				$AnimatedSprite.play(sprite_movement[last_sprite_animation])
			

		else:
			interactable = false
			$InteractionButton.visible = false
				
		
func on_character_working():
	isWorking = true
	print(isWorking)
	pass # Replace with function body.

func on_show_emotion(emotion):
	$Emotion.show()
	$Emotion.texture.set_region(CharacterMood.Character_Emotions[emotion])
	yield(get_tree().create_timer(4.0), "timeout")
	$Emotion.hide()
	 
func _on_Timer_timeout():
	if not isWorking and not doingSomething:
		update_health(-2)
		
	if randomNumber == 0:
		if GameManager.healthbar > 225:
			on_show_emotion("VeryHappy")
		if GameManager.healthbar < 225 and GameManager.healthbar >= 150:
			on_show_emotion("Happy")
		if GameManager.healthbar < 150 and GameManager.healthbar >= 75:
			on_show_emotion("Sad")	
		if GameManager.healthbar < 75 and GameManager.healthbar >= 25:
			on_show_emotion("VerySad")		
		randomNumber = rng.randi_range(10,15)
	else:
		randomNumber -= 1
	
	if randomNumber2 == 0:
		$AudioStreamPlayer2D.play()
		randomNumber2 = rng.randi_range(15,45)
	else:
		randomNumber2 -= 1
		 

func is_sleepy():
	on_show_emotion("Sleepy")	

func update_health(value):
	GameManager.healthbar += value
	$HealthBar.text = str(GameManager.healthbar)
		
	


