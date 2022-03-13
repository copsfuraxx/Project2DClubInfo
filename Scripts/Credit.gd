extends Control

func _on_Credit_gui_input(event):
	if event.is_action("left_click"):
		get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn")
