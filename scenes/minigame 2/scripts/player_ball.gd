extends CharacterBody2D

var speed = 100  # move speed in pixels/sec
var rotation_speed =6  # turning speed in radians/sec

func _physics_process(delta):
	#var move_input = Input.get_axis("down", "up")
	var rotation_direction = Input.get_axis("ui_left", "ui_right")
	#velocity = transform.x * move_input * speed
	velocity = transform.x * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
