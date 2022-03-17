extends Node

var prefabs = ['A','B','C','D']
var fils1
var fils2
var fils3
export(NodePath) var player_path
var player

func _ready():
	player = get_node(player_path)
	var scene = preload("res://Scenes/Prefabs/PrefabStart.tscn")
	fils1 = scene.instance()
	fils1.position.x -= 1920
	add_child(fils1)
	fils2 = scene.instance()
	add_child(fils2)
	fils3 = rand_prefab()
	fils3.position.x = 860#1920
	add_child(fils3)

func _physics_process(delta):
	for child in get_children():
		child.position.x -= 1000 * delta

func _process(_delta):
	if fils1.position.x < -1000 - fils1.lenght:
		fils1.queue_free()
		fils1 = fils2
		fils2 = fils3
		fils3 = rand_prefab()
		fils3.position.x = fils2.position.x + fils2.lenght
		add_child(fils3)
		
func rand_prefab():
	return load("res://Scenes/Prefabs/Prefab" + prefabs[Globals.rng.randi_range(0, prefabs.size()-1)] + ".tscn").instance()
