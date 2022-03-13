extends Area2D

export var jump_force = 1700
export(NodePath) var player_path = null
signal bump(force)

func _ready():
	if player_path == null:
		connect("bump", get_node("/root/EndLessRun/Player"), "bump")
	else:
		connect("bump", get_node(player_path), "bump")		

func _on_Bump_body_entered(_body):
	emit_signal("bump", jump_force)
