extends Camera2D

func _process(_delta):
	position.x = get_parent().get_node("Player").position.x
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		var scene = load("res://Scenes/Menu/PauseMenu.tscn")
		get_parent().add_child(scene.instance())
