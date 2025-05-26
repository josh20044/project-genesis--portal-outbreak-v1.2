extends Control

signal character_creation_closed

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_back_button_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$".".visible = false
	emit_signal("character_creation_closed")

func _on_character_1_mouse_entered() -> void:
	AudioPlayer.play_sfx(1)
	$"Background/Character 1/SelectButton 1".visible = true


func _on_character_1_mouse_exited() -> void:
	$"Background/Character 1/SelectButton 1".visible = false


func _on_character_2_mouse_entered() -> void:
	AudioPlayer.play_sfx(1)
	$"Background/Character 2/SelectButton 2".visible = true


func _on_character_2_mouse_exited() -> void:
	$"Background/Character 2/SelectButton 2".visible = false


func _on_character_3_mouse_entered() -> void:
	AudioPlayer.play_sfx(1)
	$"Background/Character 3/SelectButton 3".visible = true


func _on_character_3_mouse_exited() -> void:
	$"Background/Character 3/SelectButton 3".visible = false


func _on_select_button_1_mouse_entered() -> void:
	$"Background/Character 1/SelectButton 1".visible = true


func _on_select_button_2_mouse_entered() -> void:
	$"Background/Character 2/SelectButton 2".visible = true


func _on_select_button_3_mouse_entered() -> void:
	$"Background/Character 3/SelectButton 3".visible = true


func _on_select_button_1_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$Background.visible = false
	$Panel.visible = false
	$Stages.visible = true
	Globals.char_selected = "char1"

func _on_select_button_2_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$Background.visible = false
	$Panel.visible = false
	$Stages.visible = true
	Globals.char_selected = "char2"

func _on_select_button_3_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$Background.visible = false
	$Panel.visible = false
	$Stages.visible = true
	Globals.char_selected = "char3"

func _on_stages_stages_pressed_back() -> void:
	$Background.visible = true


func _on_stages_stages_pressed_mainmenu() -> void:
	pass # Replace with function body.
