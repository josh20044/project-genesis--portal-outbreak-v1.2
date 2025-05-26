extends Node2D

var portal = preload("res://scene/portal.tscn")

var stages = [
	{"forest": preload("res://scene/Forest.tscn").instantiate()},
	{"beach": preload("res://scene/Grassland.tscn").instantiate()},
	{"waste": preload("res://scene/wasteland.tscn").instantiate()},
	{"winter": preload("res://scene/winterland.tscn").instantiate()},
	{"laboratory": preload("res://scene/stage_5___the_laboratory.tscn").instantiate()}
]

func _ready() -> void:
	AudioPlayer.stop_bg()
	if Globals.stage_selected == 1:
		$Stage.add_child(stages[0]["forest"])
		$player.position = Vector2(1800, 1000)
	elif Globals.stage_selected == 2:
		$Stage.add_child(stages[1]["beach"])
		$player.position = Vector2(1500, 500)
	elif Globals.stage_selected == 3:
		$Stage.add_child(stages[2]["waste"])
		$player.position = Vector2(2500, -1300)
	elif Globals.stage_selected == 4:
		$Stage.add_child(stages[3]["winter"])
		$player.position = Vector2(1500, 500)
	elif Globals.stage_selected == 5:
		$Stage.add_child(stages[4]["laboratory"])
		$player.position = Vector2(1500, 500)
	
	for i in Globals.forest_spawn_pos:
		portal_spawn(10, i)
		print("spawn at :" + str(i))

func _process(delta: float) -> void:
	pass

func _on_pause_menu_game_paused() -> void:
	get_tree().paused = true

func _on_pause_menu_game_resumed() -> void:
	get_tree().paused = false
	
func portal_spawn(quantity: int, pos: Vector2):
	var portal_inatance = portal.instantiate()
	portal_inatance.player = $player
	portal_inatance.position = pos
	portal_inatance.to_spawn = quantity
	portal_inatance.spawn_speed = 1.0
	get_tree().get_root().add_child(portal_inatance)
