extends Button

func _on_pressed():
	PlayerVars.lives = 3;
	get_tree().change_scene_to_file("res://scenes/level_01.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
