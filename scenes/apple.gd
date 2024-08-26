extends Area2D

@onready var animation = $animation
@onready var collision = $collision

var points = 2

func _on_body_entered(body):
	if body.name == "player":
		await collision.call_deferred("queue_free")
		animation.animation = "collected"
		await animation.animation_finished
		
		Manager.score += points
		
		queue_free()
