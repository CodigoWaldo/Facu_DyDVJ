extends Node2D

func _ready():
	Global.minijuego1Completado = false
	Global.minijuego2Completado = false
	

func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://scenes/nivel.tscn")


func _on_salir_pressed():
	get_tree().quit()





func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")


func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://scenes/creditos.tscn")
