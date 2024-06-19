extends Area2D

var initial_position = position.y
var acceleration = 0  # a
var time_elapsed = 0  # t


	
# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped = false;


	
func _physics_process(delta):
	#formula de aceleracion y= y0 + vy0*t+ (1/2)*a*t^2
	#y0: posicion inicial
	#vy0: velocidad inicial
	#a: aceleracion
	#t: tiempo
	# Actualizar el tiempo transcurrido
	time_elapsed += delta
	
	# Calcular la nueva posición usando la fórmula
	position.y = initial_position - 0.5 * acceleration * pow(time_elapsed, 2)

func _on_body_entered(body):
	if body.get_name()=="player":
		die()
		
		
func die():
	get_tree().reload_current_scene()
