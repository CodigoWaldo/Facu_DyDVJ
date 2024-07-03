extends Area2D
@onready var player = $"../../CharacterBody2D"
@onready var audio_stream_player = $AudioStreamPlayer
@onready var sprite_2d = $Sprite2D

var timer = 0
var start_timer = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_timer:
		timer+=delta;
	if timer>0.2:
		self.queue_free();

func _on_body_entered(body):
	if body == player:
		audio_stream_player.play();
		sprite_2d.hide();
		start_timer = true;

