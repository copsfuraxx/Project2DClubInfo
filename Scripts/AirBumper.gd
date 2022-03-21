extends Area2D

export var jump_force = 1275
export(NodePath) var player_path = null
signal bump(force)
var isIn = false;

func _ready():
	if player_path == null:
		connect("bump", get_node("/root/EndLessRun/Player"), "bump")
	else:
		connect("bump", get_node(player_path), "bump")		

func _physics_process(_delta):
	if isIn && Input.is_action_just_pressed("jump"):
		emit_signal("bump", jump_force)
		isIn = false

func _on_AirBumper_body_entered(body):
	if isIn && Input.is_action_just_pressed("jump"):
		emit_signal("bump", jump_force)
		isIn = false

func _on_Area2D_body_entered(body):
	isIn = true

func _on_Area2D_body_exited(body):
	isIn = false
