extends CharacterBody2D

#Выдача имени обьекту анимации
@onready var _animatied_sprite = $Alien


func _process(delta: float) -> void:
	_animatied_sprite.play("Idle") #Анимация
