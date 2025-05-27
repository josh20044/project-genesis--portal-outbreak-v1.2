extends Control

signal game_paused
signal game_resumed

var active = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc") and not active:
		visible = not visible
		active = true
		game_paused.emit()
	elif Input.is_action_just_pressed("esc") and active:
		visible = not visible
		active = false
		game_resumed.emit()

func _on_button_pressed() -> void:
	visible = not visible
	active = false
	game_resumed.emit()

func _on_button_2_pressed() -> void:
	$Settings.visible = true

func _on_button_3_pressed() -> void:
	Globals.reset_enemy.emit()
	Globals.reset_portal.emit()
	Globals.endgame.emit()
	Globals.reset_coin.emit()
	Globals.reset_xp.emit()
	Globals.reset_potion.emit()
