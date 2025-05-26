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
