extends Area2D

var flyPlayer
var player

func _ready():
	flyPlayer = get_node("/root/EndLessRun/FlyPlayer")
	player = get_node("/root/EndLessRun/Player")

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		flyPlayer.position.y = body.global_position.y
		body.visible = false
		Globals.set_pause_node(body, true)
		flyPlayer.visible = true
		Globals.set_pause_node(flyPlayer, false)


func _on_Area2D2_body_entered(body):
	if body.is_in_group("flyPlayer"):
		player.position.y = body.global_position.y
		body.visible = false
		Globals.set_pause_node(body, true)
		player.visible = true
		Globals.set_pause_node(player, false)
