extends Node

var prefabs = ['A','B','C','D','E']
var fils = []
export(NodePath) var player_path
var player
var length = 860
var air = true

func _ready():
	player = get_node(player_path)
	var scene = preload("res://Scenes/Prefabs/PrefabStart.tscn")
	fils.push_back (scene.instance())
	fils[0].position.x = -960
	add_child(fils[0])
	fils.push_back (rand_prefab())
	fils[1].position.x = 960#1920
	length += fils[1].length
	add_child(fils[1])

func _physics_process(delta):
	for child in get_children():
		child.position.x -= 1000 * delta

func _process(_delta):
	if fils[0].position.x < -fils[0].length - 960:
		fils[0].queue_free()
		fils.remove(0)
		length -= fils[0].length
	if length < 3840:
		fils.push_back (rand_prefab())
		fils[-1].position.x = fils[-2].position.x + fils[-2].length
		length += fils[-1].length
		add_child(fils[-1])
		
func rand_prefab():
	if(air && Globals.score > 400):
		air = false
		return load("res://Scenes/Prefabs/PrefabFly.tscn").instance()
	return load("res://Scenes/Prefabs/Prefab" + prefabs[Globals.rng.randi_range(0, prefabs.size()-1)] + ".tscn").instance()
