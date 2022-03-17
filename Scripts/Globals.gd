extends Node

var rng = RandomNumberGenerator.new()
var score = 0
var volume = 80
var music = true
var scores = [["none", 0],["none", 0],["none", 0],["none", 0],["none", 0]]

func _ready():
	rng.randomize()
	loadScore()

func addScore(nom):
	for i in range(0, scores.size()):
		if(scores[i][1] < score):
			for j in range(scores.size()-1, i, -1):
				scores[j][0] = scores[j-1][0]
				scores[j][1] = scores[j-1][1]
			scores[i][0] = nom
			scores[i][1] = score
			return

func loadScore():
	var save_score = File.new()
	if not save_score.file_exists("user://scores.save"):
		return
	save_score.open("user://scores.save", File.READ)
	var i = 0
	while save_score.get_position() < save_score.get_len():
		var line = save_score.get_line().split(" ")
		scores[i][0] = line[0]
		scores[i][1] = int(line[1])
		i += 1

func saveScore():
	var save_score = File.new()
	save_score.open("user://scores.save", File.WRITE)
	for s in scores:
		save_score.store_line(s[0] + " " + String(s[1]))
