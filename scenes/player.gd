extends CharacterBody2D

@onready var animation = $animation

const MOVEMENT_SPEED = 400.0 # velociade de movimento
const JUMP_VELOCITY = -800.0 # força do pulo

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # gravidade
var life = 1 # vida do player
var direction = 0

func _physics_process(delta):
	velocity.y += gravity * delta
	
	_movement()
	move_and_slide()

func _movement(): # função para movimentação do personagem e animações
	# ANIMAÇÕES
	if !is_on_floor() && velocity.y < 0: # se não estiver no chão e estiver no ar
		animation.animation = "jumping"
	elif !is_on_floor() && velocity.y > 0: # se não estiver no chão e estiver caindo
		animation.animation = "falling"
	
	# ADICIONA FORÇA AO PULO
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# MOVIMENAR PARA OS LADOS
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * MOVEMENT_SPEED
		animation.scale.x = direction # inverte o personagem
		
	else:
		velocity.x = move_toward(velocity.x, 0, MOVEMENT_SPEED)
	
	if is_on_floor(): # se estiver no chão
		if direction != 0:
			animation.animation = "runing"
		else:
			animation.animation = "idle"

func _hit(): # função para quando o player levar dano
	life -= 1
	
	#animation.animation = "hit"
	
	print("\nAntes_________")
	print("X: ", velocity.x)
	print("Y: ", velocity.y)
	
	if velocity.x || velocity.y: 
		var directionJump = 0
		
		if velocity.y > 0:
			directionJump = -1
		elif velocity.y < 0:
			directionJump = 1

		velocity = Vector2(direction * -2000, directionJump * 250)
	
	print("\nDepois_________")
	print("X: ", velocity.x)
	print("Y: ", velocity.y)
	
	if life <= 0: # se o player não tiver mais vida
		get_tree().change_scene_to_file("res://scenes/game_over.tscn") # muda para cena de game over
