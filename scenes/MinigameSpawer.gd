extends Area2D

@export var minigame_scene: PackedScene
@onready var player = $"../player"
@onready var camera2d = $"../player/Camera2D"

var minigame_instance: Node = null
var done : bool = false
func _on_body_entered(body: Node):
	if body == player:
		spawn_minigame()
		immobilize_player()

func spawn_minigame():
	minigame_instance = minigame_scene.instantiate()
	camera2d.add_child(minigame_instance)

func immobilize_player():
	player.set_physics_process(false)
	player.set_process(false)
	done = true

func _process(delta: float) -> void:
	if minigame_instance == null or not is_instance_valid(minigame_instance):
		reactivate_player()
		if done:
			self.queue_free()

func reactivate_player():
	player.set_physics_process(true)
	player.set_process(true)
