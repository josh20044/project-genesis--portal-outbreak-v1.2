extends Node2D

var portal = preload("res://scene/portal.tscn")

var stages = [
	{"forest": preload("res://scene/Forest.tscn").instantiate()},
	{"beach": preload("res://scene/Grassland.tscn").instantiate()},
	{"waste": preload("res://scene/wasteland.tscn").instantiate()},
	{"winter": preload("res://scene/winterland.tscn").instantiate()},
	{"laboratory": preload("res://scene/stage_5___the_laboratory.tscn").instantiate()}
]

var portal_spawn_pos : Array

func _ready() -> void:
	Globals.start_wave.connect(start_wave)
	Globals.endgame.connect(end)
	Globals.game_paused.connect(_on_pause_menu_game_paused)
	Globals.game_resumed.connect(_on_pause_menu_game_resumed)
	AudioPlayer.stop_bg()
	if Globals.stage_selected == 1:
		$Stage.add_child(stages[0]["forest"])
		$player.position = Vector2(1800, 1000)
		portal_spawn_pos = Globals.forest_spawn_pos
	elif Globals.stage_selected == 2:
		$Stage.add_child(stages[1]["beach"])
		$player.position = Vector2(1500, 500)
		portal_spawn_pos = Globals.beach_spawn_pos
	elif Globals.stage_selected == 3:
		$Stage.add_child(stages[2]["waste"])
		$player.position = Vector2(2500, -1300)
		portal_spawn_pos = Globals.waste_spawn_pos
	elif Globals.stage_selected == 4:
		$Stage.add_child(stages[3]["winter"])
		$player.position = Vector2(3600, -2000)
		portal_spawn_pos = Globals.winter_spawn_pos
	elif Globals.stage_selected == 5:
		$Stage.add_child(stages[4]["laboratory"])
		$player.position = Vector2(2100, 1200)
		portal_spawn_pos = Globals.lab_spawn_pos

func _process(delta: float) -> void:
	pass

func _on_pause_menu_game_paused() -> void:
	get_tree().paused = true

func _on_pause_menu_game_resumed() -> void:
	get_tree().paused = false
	
func portal_spawn(quantity: int, variant: Vector2, pos: Vector2, spawn_speed: float):
	var portal_inatance = portal.instantiate()
	portal_inatance.player = $player
	portal_inatance.position = pos
	portal_inatance.to_spawn = quantity
	portal_inatance.variant = variant
	portal_inatance.spawn_speed = spawn_speed
	$portal.add_child(portal_inatance)

func start_wave(value: int):
	if value == 1:
		print("wave 1 started")
		for i in portal_spawn_pos:
			portal_spawn(10, Vector2(0, 4), i, 3.0)
			print("spawn at :" + str(i))
	if value == 2:
		print("wave 2 started")
		for i in portal_spawn_pos:
			portal_spawn(15, Vector2(5, 7), i, 2.5)
			print("spawn at :" + str(i))
		Globals.damage_degrade = 0.8
	if value == 3:
		print("wave 3 started")
		for i in portal_spawn_pos:
			portal_spawn(20, Vector2(8, 11), i, 2.5)
			print("spawn at :" + str(i))
		Globals.damage_degrade = 0.7
	if value == 4:
		print("wave 4 started")
		for i in portal_spawn_pos:
			portal_spawn(30, Vector2(12, 14), i, 2.0)
			print("spawn at :" + str(i))
		Globals.damage_degrade = 0.6
	if value == 5:
		print("wave 5 started")
		for i in portal_spawn_pos:
			portal_spawn(50, Vector2(0, 15), i, 1.5)
			print("spawn at :" + str(i))
		Globals.damage_degrade = 0.5

func end():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/tower_defense_main_menu.tscn")
