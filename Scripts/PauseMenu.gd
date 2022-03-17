extends Control

func _ready():
	get_parent().get_node("./Camera2D").pause_mode = Node.PAUSE_MODE_STOP
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_reprendre_pressed():
	get_tree().paused = false
	get_parent().get_node("Camera2D").pause_mode = Node.PAUSE_MODE_PROCESS
	queue_free()

func _on_mainMenu_pressed():
	if get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn") != OK:
		print ("Errorr on loading menu scene")
