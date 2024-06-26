extends Area2D

@onready var player=$"../player"
var SPEED=10


func _on_body_entered(body):
	if body==player:
		print("mover caja")	
		var direction= Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
		$CollisionShape2D/Sprite2D.position+= direction*SPEED
		$CollisionShape2D.position+= direction*SPEED		
