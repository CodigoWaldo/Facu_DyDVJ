extends Area2D

@onready var sprite_2d = $ExitArea/Sprite2D
@onready var letters=$"../../Letters"
var open = false


func _ready():
	sprite_2d.hide()


func _process(delta):
	if letters.get_child_count() == 0:
		open = true
		sprite_2d.show()
	else:
		open = false
		sprite_2d.hide()
