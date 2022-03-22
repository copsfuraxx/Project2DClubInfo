extends Area2D

export var jump_force = 1700
signal bump(force)

func _ready():
	connect("bump", get_node("/root/EndLessRun/Player"), "bump")

func _on_Bump_body_entered(_body):
	emit_signal("bump", jump_force)
