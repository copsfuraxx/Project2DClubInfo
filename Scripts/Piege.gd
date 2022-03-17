extends Area2D

func _on_body_entered(_body):
	get_tree().paused = true
	var scene = load("res://Scenes/Menu/DeadMenu.tscn")
	get_node("/root/EndLessRun").add_child(scene.instance())
