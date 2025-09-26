extends Button

@export var target_scene: String = "res://Scenes/settings.tscn"

#Проверка нажатия
func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	#Меняем текущую сцену на выбранную
	get_tree().change_scene_to_file(target_scene)
