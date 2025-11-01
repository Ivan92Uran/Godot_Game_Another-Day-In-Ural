extends Control

func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("game_menu"):  # Esc или P, в зависимости от настройки
		if visible:
			get_tree().paused = false
			hide()
		else:
			get_tree().paused = true
			show()


func _on_resume_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/adiu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
