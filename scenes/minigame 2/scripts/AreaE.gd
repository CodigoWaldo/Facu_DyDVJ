extends Area2D

@onready var letterE=$"../Letters/E"


func _on_body_entered(body):
	if body==letterE:
		body.queue_free()
		self.queue_free()
