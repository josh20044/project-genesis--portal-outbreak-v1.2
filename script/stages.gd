extends Control

signal stages_pressed_back

var entries = [
	{
		"texture": preload("res://Icons/Example Forest.png"),
		"StageLevel": "STAGE - 1",
		"StageTitle": "The Forest",
		"stage": 1
	},
	{
		"texture": preload("res://extra_img/beach.png"),
		"StageLevel": "STAGE - 2",
		"StageTitle": "The Beach",
		"stage": 2
	},
	{
		"texture": preload("res://extra_img/wasteland.png"),
		"StageLevel": "STAGE - 3",
		"StageTitle": "The Waste Land",
		"stage": 3
	},
	{
		"texture": preload("res://extra_img/winterland.png"),
		"StageLevel": "STAGE - 4",
		"StageTitle": "The Winter land",
		"stage": 4
	},
	{
		"texture": preload("res://extra_img/laboratory.png"),
		"StageLevel": "STAGE - 5",
		"StageTitle": "The Laboratory",
		"stage": 5
	}
]

var current_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_display()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_display():
	$PictureHolder/TextureRect.texture = entries[current_index]["texture"]
	$StageLevel.text = entries[current_index]["StageLevel"]
	$StageTitle.text = entries[current_index]["StageTitle"]
	Globals.stage_selected = entries[current_index]["stage"]
	
func _on_next_button_pressed() -> void:
	current_index = (current_index + 1) % entries.size()
	update_display()

func _on_previous_button_pressed() -> void:
	current_index = (current_index - 1 + entries.size()) % entries.size()
	update_display()

func _on_back_button_pressed() -> void:
	$".".visible = false
	emit_signal("stages_pressed_back")

func _on_main_menu_button_pressed() -> void:
	$".".visible = false
	get_tree().change_scene_to_file("res://scene/tower_defense_main_menu.tscn")

func _on_select_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/game.tscn")
