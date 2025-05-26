extends AudioStreamPlayer

var sfx_volume = 0.0

var sfx_arr = [
	preload("res://Audio/minimal-pop-click-ui-2-198302.mp3"),
	preload("res://Audio/hover-button-287656.mp3")
]

func play_music(music: AudioStream, volume: float):
	if stream == music: return
	stream = music
	volume_db = volume
	play()

func change_bg_volume(volume: float):
	volume_db = volume

func stop_bg():
	playing = false

func play_sfx(sfx_index: int):
	var sfx_player = AudioStreamPlayer.new()
	sfx_player.stream = sfx_arr[sfx_index]
	sfx_player.name = "SFX_PLAYER"
	sfx_player.volume_db = sfx_volume
	add_child(sfx_player)
	sfx_player.play()
	
	await sfx_player.finished
	
	sfx_player.queue_free()

func change_sfx_volume(volume: float):
	sfx_volume = volume
