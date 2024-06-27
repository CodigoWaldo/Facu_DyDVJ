extends CharacterBody2D

#Variables del personaje
#//////////////////////////
const SPEED = 300

var flip_offset = 4


func _physics_process(delta):
	$AnimationPlayer.play("idle") 
	#//////////////////////////
	# Movimiento y gravedad
	#//////////////////////////
	
	var direction= Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
	velocity=direction*SPEED
	
	if Input.is_action_pressed("mover_derecha"):
		$AnimationPlayer.play("run")
		$Sprite2D.flip_h=false
		$Sprite2D.position.x=+flip_offset
		 
	if Input.is_action_pressed("mover_izquierda"):
		$AnimationPlayer.play("run")
		$Sprite2D.flip_h =true
		$Sprite2D.position.x=-flip_offset	
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if collision.get_collider() and collision.get_collider().is_in_group("pushable"):
			var pushable = collision.get_collider()
			if pushable is RigidBody2D:
				pushable.apply_central_impulse(velocity*delta)

