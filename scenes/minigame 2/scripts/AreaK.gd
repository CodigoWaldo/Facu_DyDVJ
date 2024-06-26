extends Area2D

@onready var letterK=$"../Letters/K"


func _on_body_entered(body):
	if body==letterK:
		body.queue_free()
		self.queue_free()
