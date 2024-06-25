extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 1100
#//////////////////////////
#Variables del personaje
#//////////////////////////
const SPEED = 250.0
const JUMP_VELOCITY = -300.0
var has_double_jumped = false
var isRunning = false
var has_jumped = false
#//////////////////////////
# Variables para el dash
#//////////////////////////
var dash_horizontal_distance = 200  
var dash_vertical_distance = 200  
var dash_duration = 0.4 
var dash_timer = 0.0
var is_dashing = false
var dash_horizontal_velocity = 0.0
var dash_vertical_velocity = 0.0

var flip_offset = 8


func _physics_process(delta):
	#//////////////////////////
	# debug reset PRESS R
	#//////////////////////////
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		Global.minijuego1Completado = false
	
	
	#//////////////////////////
	# Animaciones
	#//////////////////////////

		
	
	if isRunning == false and has_jumped == false :
		$AnimationPlayer.play("idle") # Animación idle
	else:
		if isRunning == true and is_on_floor():		
			$AnimationPlayer.play("run") # Animación correr
		else:
			$AnimationPlayer.play("jump") # Animación salto  	
	
	if is_dashing:
		$AnimationPlayer.play("Dash")
	
		
		
		
		
					
	#//////////////////////////
	# Movimiento y gravedad
	#//////////////////////////
	if not is_dashing:
		if not is_on_floor(): #gravedad
			velocity.y += gravity * delta
			
		if Input.is_action_just_pressed("saltar") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			has_jumped = true		
				
		if Input.is_action_just_pressed("saltar") and not is_on_floor() and not has_double_jumped and Global.minijuego1Completado == true:
			has_double_jumped = true
			has_jumped = true
			velocity.y = JUMP_VELOCITY
			
		if is_on_floor():
			has_jumped = false
			has_double_jumped = false
			
		# Dirección del personaje
		var direction = Input.get_axis("mover_izquierda", "mover_derecha")
		if direction:
			$Sprite2D.flip_h=false
			$Sprite2D.position.x=+flip_offset
			isRunning = true
			velocity.x = direction * SPEED
			 
			if direction < 0:
				$Sprite2D.flip_h =true
				$Sprite2D.position.x=-flip_offset	
			
			
							
		else:
			isRunning = false
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		perform_dash(delta)
	
	#if $Sprite2D.flip_h: 
#		$Sprite2D.offset = Vector2(-16,0)
#	else:
#		$Sprite2D.offset = Vector2(0,0)
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




