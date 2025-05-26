extends Control

signal data_saved_interface_closed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_button_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$".".visible = false
	emit_signal("data_saved_interface_closed")

func _on_slot_2_pressed() -> void:
	AudioPlayer.play_sfx(0)
	$Background.visible = false
	$"Panel".visible = false
	$CharacterSelection.visible = true



func _on_character_selection_character_creation_closed() -> void:
	$"Panel".visible = true
