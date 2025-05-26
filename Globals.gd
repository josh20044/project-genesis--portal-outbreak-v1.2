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
var rng = RandomNumberGenerator.new()

var forest_spawn_pos : Array = [
	Vector2(500, 700),
	Vector2(2700, 300),
	Vector2(2000, 1000),
	Vector2(1600, 2000),
	Vector2(400, 2100)
]

var beach_spawn_pos : Array = [
	Vector2(1031, 734),
	Vector2(2218, 665),
	Vector2(2805, 1221),
	Vector2(499, 316),
	Vector2(944, 1197)
]

var waste_spawn_pos : Array = [
	Vector2(3146, 1185),
	Vector2(1790, 102),
	Vector2(812, -2131),
	Vector2(4166, -1785),
	Vector2(4428, -33)
]

var winter_spawn_pos : Array = [
	Vector2(670, -10),
	Vector2(6010, -26),
	Vector2(6213, -2688),
	Vector2(6137, -4852),
	Vector2(3600, -2550),
	Vector2(1606, -4520)
]

var lab_spawn_pos : Array = [
	Vector2(363, 378),
	Vector2(282, 2236),
	Vector2(3738, 2851),
	Vector2(282, 4453),
	Vector2(5498, 1171),
	Vector2(3181, 388),
	Vector2(2653, 4451)
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
			
func RandNum(min: int, max: int) -> int:
	return rng.randi_range(min, max)
