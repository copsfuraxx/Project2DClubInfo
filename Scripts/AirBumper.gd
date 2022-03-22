extends Area2D

export var jump_force = 1275
signal bump(force)
var isIn = false;
var player
var jump = false

func _ready():
	connect("bump", get_node("/root/EndLessRun/Player"), "bump")

func _physics_process(_delta):
	if jump && isIn:
		emit_signal("bump", jump_force)
		isIn = false
	if jump :
		jump = false
			
func _process(delta):
	if Input.is_action_pressed("jump") && !jump :
		jump = true

func _on_AirBumper_body_entered(body):
	isIn = true
	player = body


func _on_AirBumper_body_exited(_body):
	isIn = false
	player = null
