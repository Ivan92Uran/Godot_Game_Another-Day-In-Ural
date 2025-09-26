extends Button

#Проверка нажатия
func _ready():
	pressed.connect(_on_pressed)

#Выход при нажатии
func _on_pressed():
	get_tree().quit()
