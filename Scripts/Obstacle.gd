extends Node2D

var timer = 0.5
var spawn_rate = 0.5
var time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer > spawn_rate && time < 9:
		var obstacle = load("res://Scenes/AirObstacle.tscn").instance()
		obstacle.position.y += Globals.rng.randi_range(-150, 150)
		add_child(obstacle)
		obstacle.global_position.x = get_parent().global_position.x + 1000 + 1000 * time
		timer = 0.0
	
	timer += delta
	time += delta
