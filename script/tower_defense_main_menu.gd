extends Control

var bg_music_1 = preload("res://Audio/Erika ( German soldier song ) Japanese ver  With Romaji lyrics.mp3")
var music_save_path = "user://setting.json"

func _ready() -> void:
	$AnimationPlayer.play_backwards("GetDownMisterPresident")
	AudioPlayer.play_music(bg_music_1, Globals.read_json_file(music_save_path)["music"])
	Globals.connect("stages_pressed_mainmenu", signal_from_stage)
	Globals.player_damage = 50
	Globals.shot_gun_mode = false
	Globals.shot_gun_bullet = 2
	Globals.gun_fire_rate = 0.2
	Globals.regen_amount = 1
	Globals.player_speed = 200
	update_image()
	start_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_settings_button_mouse_entered() -> void:
	$Settings.visible = true


func _on_settings_button_mouse_exited() -> void:
	$Settings.visible = false


func _on_play_button_mouse_entered() -> void:
	$Play.visible = true


func _on_play_button_mouse_exited() -> void:
	$Play.visible = false


func _on_exit_button_mouse_entered() -> void:
	$Exit.visible = true


func _on_exit_button_mouse_exited() -> void:
	$Exit.visible = false


func _on_exit_button_pressed() -> void:
	AudioPlayer.play_sfx(0)
	get_tree().quit()

func _on_play_button_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$SavedDataInterface.visible = true
	$AnimationPlayer.play("GetDownMisterPresident")

func _on_saved_data_interface_data_saved_interface_closed() -> void:
	$AnimationPlayer.play_backwards("GetDownMisterPresident")

func _on_settings_button_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$Settings2.visible = true
	$AnimationPlayer.play("GetDownMisterPresident")

func _on_settings_2_settings_closed() -> void:
	$AnimationPlayer.play_backwards("GetDownMisterPresident")


func _on_shop_button_mouse_entered() -> void:
	$Shop.visible = true


func _on_shop_button_mouse_exited() -> void:
	$Shop.visible = false


func _on_inventory_button_mouse_entered() -> void:
	$Inventory.visible = true


func _on_inventory_button_mouse_exited() -> void:
	$Inventory.visible = false


func _on_shop_2_shop_closed() -> void:
	$AnimationPlayer.play_backwards("GetDownMisterPresident")


func _on_shop_button_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$Shop2.visible = true
	$AnimationPlayer.play("GetDownMisterPresident")


func _on_inventory_button_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$AnimationPlayer.play("GetDownMisterPresident")
	$Inventory2.visible = true


func signal_from_stage() -> void:
	$AnimationPlayer.play_backwards("GetDownMisterPresident")


func _on_inventory_2_inventory_close() -> void:
	AudioPlayer.play_sfx(0)
	$AnimationPlayer.play_backwards("GetDownMisterPresident")
	$Inventory2.visible = false

var images = [
	preload("res://Tile Assets/forest.png"),
	preload("res://Tile Assets/laboratory.png"),
	preload("res://Tile Assets/winter.png"),
	preload("res://Tile Assets/beach.png"),
	preload("res://Tile Assets/wasteland.png")
]

var current_index = 0
var interval = 3.0
	

func start_timer():
	var timer = Timer.new()
	timer.wait_time = interval
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)

func _on_timer_timeout():
	current_index = (current_index + 1) % images.size()
	update_image()

func update_image():
	$TextureRect.texture = images[current_index]
