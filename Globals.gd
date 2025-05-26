extends Node

signal stages_pressed_mainmenu
signal  enemy_hit(id: int, damage: int)
signal xp_increase(amount: int)
signal attack_recieved(damage: int)
signal reset_enemy
signal reset_portal
signal endgame
signal playbgmusic(index: int)
signal start_wave(value: int)

var char_selected = ""
var stage_selected = 0
var enemy_id = 0
var New

var forest_spawn_pos : Array = [
	Vector2(500, 700),
	Vector2(2700, 300),
	Vector2(2000, 1000),
	Vector2(1600, 2000),
	Vector2(400, 2100)
]

func _ready() -> void:
	playbgmusic.connect(play_bgmusic)
	
func play_bgmusic(index: int):
	print(index)


func read_json_file(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	
	var data = file.get_as_text()
	var json_object = JSON.new()
	
	json_object.parse(data)
	
	return json_object.data
	
func write_json_file(file_path: String, data: Dictionary):
	if FileAccess.file_exists(file_path):
		print("File exist. Writing to it")
	else:
		print("File does not exist. Creating file")
		
	var file = FileAccess.open(file_path, FileAccess.ModeFlags.WRITE)
	
	if file:
		var text = JSON.stringify(data, "\t")
		file.store_string(text)
		print("Data writtren to the file")
	else:
		print("Failed to open or create the file")

func Check_file(file_path: String, data: Dictionary):
	var file
	if not FileAccess.file_exists(file_path):
		file = FileAccess.open(file_path, FileAccess.ModeFlags.WRITE)
		if file:
			var text = JSON.stringify(data, "\t")
			file.store_string(text)
			print("Data writtren to the file")
		else:
			print("Failed to open or create the file")
