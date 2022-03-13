extends Control

func _ready():
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_reprendre_pressed():
	get_tree().paused = false
	queue_free()

func _on_mainMenu_pressed():
	if get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn") != OK:
		print ("Errorr on loading menu scene")
