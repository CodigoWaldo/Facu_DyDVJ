extends Node2D

@onready var player = $CharacterBody2D

func _on_exit_body_entered(body):
	if body == player:
		self.queue_free()
