extends KinematicBody2D

var fall = 3000
#longueur saut = 600
#hauteur saut = 130
var jump_force = 850
var speed = 1000
var velocity = 0
var angleDroit = PI/2
var rotate = angleDroit

func _physics_process(delta):
	if is_on_wall() || is_on_ceiling():
		get_tree().paused = true
		var scene = load("res://Scenes/Menu/DeadMenu.tscn")
		get_node("/root/EndLessRun").add_child(scene.instance())
		return
	Globals.score += int(100 * delta)
	velocity = min(fall, velocity + fall * delta)
	if Input.is_action_pressed("jump") && is_on_floor():
		if velocity > -jump_force:
			velocity = -jump_force
			rotate = 0
	move_and_slide(Vector2(speed, velocity), Vector2.UP)
	if rotate < angleDroit:
		var angle = angleDroit * delta * 3
		rotate += angle
		if rotate > angleDroit:
			rotate = angleDroit
			rotation = 0
		else:
			rotate(angle)

func bump(force):
	velocity = -force
	rotate = -angleDroit
