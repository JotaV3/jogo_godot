extends CanvasLayer

var isPaused = false

func _on_pause_pressed(): # função para quando o botão de pause for pressionado
	_pause() 
	
func _on_quit_pressed():
	get_tree().quit() # função para sair do jogo quando o botão de sair for pressionado

func _on_restart_pressed(): # função para reiniciar a cena principal(main) quando o botão de reiniciar for pressionado
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main.tscn")
		
func _pause(): # função para pausar o jogo
	isPaused = !isPaused
	get_tree().paused = isPaused
