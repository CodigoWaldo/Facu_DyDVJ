extends Node2D

@onready var player = $CharacterBody2D
@onready var exit = $TileMap/Exit

var done = false
var dead = false
func _on_exit_body_entered(body): 
	if exit.open:
		if body == player:
			done = true

func is_done() -> bool:
	return done
