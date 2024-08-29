extends CanvasLayer

@onready var score = $control_hud/margin/container_score/score
@onready var timerLabel = $control_hud/container_timer/timer
@onready var timer = $timer

var seconds = 0

@export_range(0, 59) var secDefault = 0

func _ready():
	score.text = str("Score: %d" % Manager.score)
	timerLabel.text = str("%d" % secDefault)
	
	seconds = secDefault
	
func _process(delta):
	score.text = str("Score: %d" % Manager.score)
	
	if seconds <= 0 && Manager.score < 30:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	elif Manager.score == 30:
		get_tree().change_scene_to_file("res://scenes/game_won.tscn")

func _on_timer_timeout():
	seconds -= 1

	timerLabel.text = str("%d" % seconds)
