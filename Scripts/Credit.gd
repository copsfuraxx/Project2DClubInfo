extends Control

func _ready():
	grab_focus()

func _process(_delta):
	if Input.is_action_just_pressed("left_click") ||Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn")
