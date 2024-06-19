extends Area2D



func _on_area2D_entered(body):
	if body.get_name()=="player":
		die()
		
		
func die():
	get_tree().reload_current_scene()
