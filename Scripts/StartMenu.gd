extends Control

func _ready():
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _process(_delta):
	if Input.is_action_pressed("jump"):
		get_tree().paused = false
		queue_free()
