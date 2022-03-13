extends KinematicBody2D

var fall = 3000
#longueur saut = 600
#hauteur saut = 130
var jump_force = 850
export var speed = 1000
var velocity = 0
var angleDroit = PI/2
var rotate = angleDroit

var y = 1000

func _physics_process(delta):
	y = position.y
	if is_on_wall() || is_on_ceiling():
		if get_tree().reload_current_scene() != OK:
			print ("Errorr on reloading current scene")
	velocity = min(fall, velocity + fall * delta)
	if Input.is_action_pressed("jump") && is_on_floor():
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
			rotation+=angle

func bump(force):
	velocity = -force
	rotate = -angleDroit
