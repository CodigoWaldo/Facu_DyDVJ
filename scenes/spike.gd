extends Area2D
@onready var player = $"../CharacterBody2D"
@onready var minigame_1 = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_degrees+=100 * delta
	pass


func _on_body_entered(body):
	print("helloasda")
	if body == player:
		minigame_1.dead = true
