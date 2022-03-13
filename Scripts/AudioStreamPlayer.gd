extends AudioStreamPlayer

export(Array, AudioStream) var musics


func _on_AudioStreamPlayer_finished():
	stream = musics[Globals.rng.randi_range(0, musics.size()-1)]
	playing = true
