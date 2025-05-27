extends Node

signal stages_pressed_mainmenu
signal enemy_hit(id: int, damage: int)
signal xp_increase(amount: int)
signal coin_increase(amount: int)
signal attack_recieved(damage: int)
signal reset_enemy
signal reset_portal
signal reset_coin
signal reset_xp
signal reset_potion
signal endgame
signal playbgmusic(index: int)
signal start_wave(value: int)
signal stage_finished
signal game_over
signal level_up
signal pickup_item(tag: String)

signal game_paused
signal game_resumed

var char_selected = ""
var stage_selected = 0
var enemy_id = 0
var New
var rng = RandomNumberGenerator.new()
var total_gold = 0
var score = 0

# player upgradables
var player_damage = 50
var shot_gun_mode = false
var shot_gun_bullet = 2
var gun_fire_rate = 0.2
var regen_amount = 1
var player_speed = 200

var damage_degrade = 1.0

var inventory_items = []
var inventory_anim = []
var inventory_desc = []

var xp = preload("res://scene/xp_drop.tscn")
var coin = preload("res://scene/coin_drop.tscn")
var potion = preload("res://enemy_scene/potion_drop.tscn")
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

func drop_xp(pos: Vector2) -> Node:
	var xp_ins = xp.instantiate()
	xp_ins.position = pos
	return xp_ins
	
func drop_coin(pos: Vector2) -> Node:
	var coin_ins = coin.instantiate()
	coin_ins.position = pos
	return coin_ins

func drop_potion(pos: Vector2) -> Node:
	var potion_ins = potion.instantiate()
	potion_ins.position = pos
	potion_ins.scale = Vector2(3.0, 3.0)
	return potion_ins

func gacha(favo: int, total: int) -> bool:
	return RandNum(1, total) <= favo
		
