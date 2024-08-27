extends CanvasLayer

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://main.tscn") # emite o sinal de restart com destino no main
	
func _on_quit_pressed(): # botão para sair 
	get_tree().quit()
