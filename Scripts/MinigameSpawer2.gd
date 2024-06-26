extends Area2D

@export var minigame_scene: PackedScene
@onready var player = $"../player"
@onready var camera2d = $"../player/Camera2D"
@onready var deadzone=$"../LavaPrincipal"

var minigame_instance: Node = null
var done : bool = false

var should_spawn_minigame = false

func _on_body_entered(body: Node):
	if body == player:
		should_spawn_minigame = true

func _process(delta):
	if should_spawn_minigame and Input.is_action_just_pressed("accion"):
		spawn_minigame()
		immobilize_player()
		should_spawn_minigame = false
		
	if minigame_instance == null or not is_instance_valid(minigame_instance):
		return
		
	if minigame_instance.dead:
		minigame_instance.queue_free()
		minigame_instance = minigame_scene.instantiate()
		camera2d.add_child(minigame_instance)
	elif minigame_instance.done:
		minigame_instance.queue_free()
		reactivate_player()
		self.queue_free()
		
		
func spawn_minigame():
	minigame_instance = minigame_scene.instantiate()
	camera2d.add_child(minigame_instance)
	

func immobilize_player():
	deadzone.stop()
	player.set_physics_process(false)
	player.set_process(false)
	done = true

func reactivate_player():
	deadzone.resume()
	player.set_physics_process(true)
	player.set_process(true)
	Global.minijuego2Completado = true
	
	

	
	

