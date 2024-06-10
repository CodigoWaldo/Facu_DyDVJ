extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 1100
#//////////////////////////
#Variables del personaje
#//////////////////////////
const SPEED = 250.0
const JUMP_VELOCITY = -300.0
var has_double_jumped = false;

#//////////////////////////
# Variables para el dash
#//////////////////////////
var dash_horizontal_distance = 200  
var dash_vertical_distance = 200  
var dash_duration = 0.5 
var dash_timer = 0.0
var is_dashing = false
var dash_horizontal_velocity = 0.0
var dash_vertical_velocity = 0.0

func _physics_process(delta):
	#//////////////////////////
	# Animaciones
	#//////////////////////////
	$AnimationPlayer.play("idle") # Animación idle	
	#//////////////////////////
	# Movimiento y gravedad
	#//////////////////////////
	if not is_dashing:
		if not is_on_floor():
			velocity.y += gravity * delta
		if Input.is_action_just_pressed("saltar") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		if is_on_floor():
			has_double_jumped = false
		if Input.is_action_just_pressed("saltar") and not is_on_floor() and not has_double_jumped:
			has_double_jumped = true
			velocity.y = JUMP_VELOCITY
		
		# Dirección del personaje
		var direction = Input.get_axis("mover_izquierda", "mover_derecha")
		if direction:
			velocity.x = direction * SPEED
			$Sprite2D.flip_h = direction < 0
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		perform_dash(delta)
	
	move_and_slide()
	
	#//////////////////////////
	# Manejo del dash
	#//////////////////////////
	if Input.is_action_just_pressed("dash") and not is_dashing and is_on_floor():
		start_dash()

#//////////////////////////
func start_dash():
	is_dashing = true
	dash_timer = dash_duration	
	if $Sprite2D.flip_h:
		dash_horizontal_velocity = -dash_horizontal_distance / dash_duration
	else:
		dash_horizontal_velocity = dash_horizontal_distance / dash_duration
	
	dash_vertical_velocity = -dash_vertical_distance / (dash_duration / 2)
	
#//////////////////////////
func perform_dash(delta):
	if dash_timer > dash_duration / 2:
		velocity.x = dash_horizontal_velocity
		velocity.y = 0
	else:
		velocity.x = 0
		velocity.y = dash_vertical_velocity
	
	dash_timer -= delta
	if dash_timer <= 0:
		is_dashing = false
		velocity = Vector2.ZERO
#//////////////////////////

