extends Node

func _process(delta):
	if $Background.position.x < -1920:
		$Background.position.x += 3840
	if $Background2.position.x < -1920:
		$Background2.position.x += 3840
	$Background.position.x -= 200 * delta
	$Background2.position.x -= 200 * delta
