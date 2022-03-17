extends Control

func _ready():
	$Volume/Label.text = "Volume : " + String(Globals.volume)
	if Globals.music:
		$Music/Label.text = "Music : On"
	else:
		$Music/Label.text = "Music : Off"
		$Music/CheckButton.pressed =false
	$Volume/HSlider.grab_focus()

func _on_HSlider_value_changed(value):
	GlobalAudioStreamPlayer.volume_db = value - 100
	$Volume/Label.text = "Volume : " + String(value)
	Globals.volume = value

func _on_CheckButton_toggled(button_pressed):
	Globals.music = button_pressed
	GlobalAudioStreamPlayer.playing = button_pressed
	if button_pressed:
		$Music/Label.text = "Music : On"
	else:
		$Music/Label.text = "Music : Off"

func _on_Button_pressed():
	if get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn") != OK:
		print ("Errorr on loading menu scene")
