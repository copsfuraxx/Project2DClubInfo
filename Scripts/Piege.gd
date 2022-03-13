extends Area2D

func _on_body_entered(_body):
	if get_tree().reload_current_scene() != OK:
		print ("Errorr on reloading current scene")
