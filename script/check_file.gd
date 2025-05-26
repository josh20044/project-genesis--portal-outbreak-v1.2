extends Node

var music_save_path = "user://setting.json"

func _ready() -> void:
	if ! FileAccess.file_exists(music_save_path):
		pass
