extends Area2D

@onready var letterY=$"../Letters/Y"

func _on_body_entered(body):
	if body==letterY:
		body.queue_free()
		self.queue_free()
