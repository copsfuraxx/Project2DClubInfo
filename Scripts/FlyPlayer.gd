extends KinematicBody2D

var fall = 1500
#longueur saut = 600
#hauteur saut = 130
var jump_force = 500
#speed = 1000
var velocity = 0

func _ready():
	Globals.set_pause_node(self, true)

func _physics_process(delta):
	if position.x < -10:
		get_tree().paused = true
		var scene = load("res://Scenes/Menu/DeadMenu.tscn")
		get_node("/root/EndLessRun").add_child(scene.instance())
		return
	Globals.score += int(100 * delta)
	if position.x < 0:
		position.x += 1
	velocity = min(fall, velocity + fall * delta)
	if Input.is_action_pressed("jump"):
		if velocity > -jump_force:
			velocity = -jump_force
	move_and_slide(Vector2(0, velocity), Vector2.UP)

func _process(_delta):
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		var scene = load("res://Scenes/Menu/PauseMenu.tscn")
		get_parent().add_child(scene.instance())

func bump(force):
	velocity = -force
