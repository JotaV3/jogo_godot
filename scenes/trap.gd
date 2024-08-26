extends Area2D

@onready var player = $"../player"

signal test

#func _process(delta):
	#if position.x == 600:
		#_movement(1000)
		
	#else:
		#_movement(600)
		
	#print("\nDepois______")
	#print("PX: ", position.x)

func _on_body_entered(body):
	if body.name == "player":
		player._hit()
		
#func _movement(destino):
	#while(position.x != destino):
		#position.x = 1
