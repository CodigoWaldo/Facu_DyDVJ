extends Area2D

func _on_body_entered(body):
	if body.get_name()=="player":
		die()


func die():
	Global.minijuego1Completado = false
	Global.minijuego2Completado = false
	get_tree().change_scene_to_file("res://scenes/menu_loss.tscn")


