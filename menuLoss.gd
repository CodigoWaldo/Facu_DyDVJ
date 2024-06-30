extends Node


@onready var score_label = $tiempo
# Called when the node enters the scene tree for the first time.
func _ready():	
	score_label.text = "Te llevó " + str(Global.tiempo) + " segundos."
	Global.minijuego1Completado = false
	Global.minijuego2Completado = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://scenes/nivel.tscn")

func _on_salir_pressed():
	get_tree().quit()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
