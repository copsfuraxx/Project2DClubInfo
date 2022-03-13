extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_PlayEndLess_pressed():
	if get_tree().change_scene("res://Scenes/EndLessRun.tscn") != OK:
		print ("Errorr on loading game scene")

func _on_Credits_pressed():
	if get_tree().change_scene("res://Scenes/Menu/Credit.tscn") != OK:
		print ("Errorr on loading credit scene")

func _on_Quit_pressed():
	get_tree().quit()
