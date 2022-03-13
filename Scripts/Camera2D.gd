extends Camera2D

export(NodePath) var path
var player

func _ready():
	player = get_node(path)

func _process(_delta):
	position.x = player.position.x
	if Input.is_action_pressed("pause"):
		var scene = load("res://Scenes/Menu/PauseMenu.tscn")
		add_child(scene.instance())
