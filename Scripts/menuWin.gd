extends Node2D


@onready var score_label = $tiempo

func _ready():
	score_label.text = "Te llevó " + str(Global.tiempo) + " segundos."
	Global.minijuego1Completado = false
	Global.minijuego2Completado = false

func _on_jugar_de_nuevo_pressed():
	get_tree().change_scene_to_file("res://scenes/nivel.tscn")



func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")


func _on_salir_pressed():
	get_tree().quit()
