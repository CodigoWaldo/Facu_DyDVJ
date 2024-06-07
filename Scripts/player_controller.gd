extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 1100
var has_double_jumped = false;



func _physics_process(delta):
	# Add the gravity.
	
	
	$AnimationPlayer.play("idle") #animacion idle
	
	if Input.is_action_pressed("mover_derecha"):
		$Sprite2D.flip_h=false

	if Input.is_action_pressed("mover_izquierda"):
		$Sprite2D.flip_h=true
	
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if is_on_floor():
		has_double_jumped = false
	if Input.is_action_just_pressed("saltar") and not is_on_floor() and not has_double_jumped:
		has_double_jumped = true
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("mover_izquierda", "mover_derecha")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
