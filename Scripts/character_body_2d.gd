extends CharacterBody2D

#Различные переменные для нормального обращения к функциям
var was_in_air = false
var coyote_time = 0.1
var coyote_timer = 0.0
var Jamp_St = -600
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var speed = 400
var sp_run = 600
@onready var _animated_sprite = $AnimatedSprite2D

#Получение направление
func get_direction():
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
		if direction < 0:
			_animated_sprite.flip_h = true
		elif direction > 0:
			_animated_sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	

#Функция передвижения
func get_walk():
	var input_derection = Input.get_axis("Left","Right")
	#Бег и ходьба сразу
	if Input.is_action_pressed("Run"):
		velocity.x = input_derection * sp_run
	else:
		velocity.x = input_derection * speed 

#Функция прыжка и падения
func get_jump(delta):
	if is_on_floor():
		coyote_timer = coyote_time
	else:
		coyote_timer -= delta
	
	if Input.is_action_just_pressed("Jump") and coyote_timer > 0:
		velocity.y = Jamp_St
		coyote_timer = 0.0
		
	if Input.is_action_just_released("Jump") and velocity.y < 0:
		velocity.y *= 0.5  #Уменьшаем скорость подъема
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	

#Функция для анимации
func _process(delta):
	#Приземление
	if was_in_air and is_on_floor():
		_animated_sprite.play("Land")
		was_in_air = false
	
	#Ввоздухе
	if not is_on_floor():
		was_in_air = true
		if velocity.y < 0:
			_animated_sprite.play("Jump")#Прыгаем
		else:
			_animated_sprite.play("Fall")#Падаем
			
	else: 
		#Персонаж на земле
		if Input.is_action_pressed("Run") and Input.get_axis("Left","Right"):
			_animated_sprite.play("Run")#Бежим
		elif Input.get_axis("Left","Right"):
			_animated_sprite.play("Walk")#Идйм
		else:
			_animated_sprite.play("Idle")#Стоим на месте
	
	

func _physics_process(delta):	
	get_direction()
	get_jump(delta)
	get_walk()
	move_and_slide()
