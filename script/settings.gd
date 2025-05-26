extends Control

signal settings_closed

var json_path = "user://data/setting.json"

var save_data : Dictionary = {
	"music": 0,
	"sfx": 0
	}

func _ready() -> void:
	$Panel/MusicSlider.value = Globals.read_json_file(json_path)["music"]
	$Panel/SfxSlider.value = Globals.read_json_file(json_path)["sfx"]
	AudioPlayer.change_bg_volume(Globals.read_json_file(json_path)["music"])

func _process(delta: float) -> void:
	pass


func _on_music_slider_value_changed(value: float) -> void:
	save_data["music"] = value
	AudioPlayer.change_bg_volume(value)

func _on_sfx_slider_value_changed(value: float) -> void:
	save_data["sfx"] = value
	AudioPlayer.change_sfx_volume(value)
	AudioPlayer.play_sfx(0)


func _on_exit_button_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$".".visible = false
	emit_signal("settings_closed")
	Globals.write_json_file(json_path, save_data)
