extends CharacterBody2D

#Выдача имени обьекту анимации
@onready var _animatied_sprite = $Zombie

func _process(delta: float) -> void:
	_animatied_sprite.flip_h = true #Разворот
	_animatied_sprite.play("Idle") #Анимация
