extends AudioStreamPlayer

export(Array, AudioStream) var musics

func _ready():
	playMusic()

func _on_AudioStreamPlayer_finished():
	playMusic()

func playMusic():
	if Globals.music:
		stream = musics[Globals.rng.randi_range(0, musics.size()-1)]
		playing = true
