extends Node

var puedeGanar = false;


		
func _process(delta):
	if puedeGanar and Input.is_action_just_pressed("accion"):		
		print("2")
		get_tree().change_scene_to_file("res://scenes/menu_win.tscn")

func _on_body_entered(body: Node):	
	if body.get_name()== "player" and Global.minijuego1Completado == true:
		print("1")
		puedeGanar=true
