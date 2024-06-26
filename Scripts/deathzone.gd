extends Area2D

var initial_position = position.y
var acceleration = 2  # a
var time_elapsed = 0  # t

func _physics_process(delta):
	#formula de aceleracion y= y0 + vy0*t+ (1/2)*a*t^2
	#y0: posicion inicial
	#vy0: velocidad inicial
	#a: aceleracion
	#t: tiempo
	# Actualizar el tiempo transcurrido
	
	
	# Calcular la nueva posición usando la fórmula	
	if position.y > -1045 and Global.minijuego1Completado == true:
		time_elapsed += delta
		position.y = initial_position - 0.5 * acceleration * pow(time_elapsed, 2)
		
		
func _on_body_entered(body):
	if body.get_name()=="player":
		print("moriste")
		die()
		
		
func die():	
	Global.minijuego1Completado = false
	Global.minijuego2Completado = false
	get_tree().change_scene_to_file("res://scenes/menu_loss.tscn")
