extends Control

func _ready():
	$Panel.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Panel/LineEdit.grab_focus()

func _on_Restart_pressed():
	Globals.score = 0
	if get_tree().reload_current_scene() != OK:
			print ("Errorr on reloading current scene")

func _on_Menu_pressed():
	if get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn") != OK:
		print ("Errorr on loading menu scene")

func _on_Button_pressed():
	if $Panel/LineEdit.text.length() > 1 && $Panel/LineEdit.text.split(" ", false).size() > 0:
		Globals.addScore($Panel/LineEdit.text)
	else:
		Globals.addScore("anon")
	Globals.saveScore()
	$Panel.queue_free()
	$Restart.grab_focus()

func _on_HighScore_pressed():
	var txt =""
	for score in Globals.scores:
		txt += String(score) + "\n"
	$Panel2/Label2.text = txt
	$Panel2.visible = true
	$Panel2/Button2.grab_focus()

func _on_Button2_pressed():
	$Panel2.visible = false
	$Restart.grab_focus()

func _on_LineEdit_gui_input(event):
	if Input.is_action_just_pressed("ui_accept"):
		_on_Button_pressed()
