extends Area2D

var initial_position = position.y
var acceleration = 1.5  # a
var vy0=5
var time_elapsed = 0  # t
var is_stop=false

func _physics_process(delta):
	#formula de aceleracion y= y0 + vy0*t+ (1/2)*a*t^2
	#y0: posicion inicial
	#vy0: velocidad inicial
	#a: aceleracion
	#t: tiempo
	# Actualizar el tiempo transcurrido
	
	
	# Calcular la nueva posición usando la fórmula	
	if position.y > -1045 and Global.minijuego1Completado and not is_stop:
		time_elapsed += delta
		position.y = initial_position -vy0*time_elapsed - 0.5 * acceleration * pow(time_elapsed, 2)
		
		if Global.minijuego2Completado:
			vy0+=0.005
		
func _on_body_entered(body):
	if body.get_name()=="player":
		die()
		
		
func die():	
	Global.minijuego1Completado = false
	Global.minijuego2Completado = false
	get_tree().change_scene_to_file("res://scenes/menu_loss.tscn")

func stop():
	is_stop=true

func resume():
	is_stop=false

	
