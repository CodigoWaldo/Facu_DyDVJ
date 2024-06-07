extends Area2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped = false;
func _physics_process(delta):
	# Add the gravity.
	position.y -= 0.3 #velocidad de la lava.

func _on_body_entered(body):
	if body.get_name()=="player":
		die()
		
		
func die():
	get_tree().reload_current_scene()
