extends Node2D

var pause_overlay = null

func _ready():
	var pause_scene = load("res://Scenes/pause_overlay.tscn")
	pause_overlay = pause_scene.instantiate()
	add_child(pause_overlay)
	pause_overlay.hide()  
