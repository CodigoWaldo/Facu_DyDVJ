extends Node


@onready var animacion = $AnimationPlayer


func _ready():
	animacion.play("Lava")


