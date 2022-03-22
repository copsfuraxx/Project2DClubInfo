extends Node

func _physics_process(delta):
	$PrefabFly.position.x -= 1000 * delta
