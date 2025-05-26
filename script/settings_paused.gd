extends Control

var json_path = "user://data/setting.json"

var save_data : Dictionary = {"music": 0}

func _ready() -> void:
	$Panel/MusicSlider.value = Globals.read_json_file(json_path)["music"]

func _process(delta: float) -> void:
	pass


func _on_music_slider_value_changed(value: float) -> void:
	save_data["music"] = value


func _on_exit_button_pressed() -> void:
	visible = false
	Globals.write_json_file(json_path, save_data)
