extends Control

signal inventory_close

func _ready() -> void:
	pass

func _on_exit_button_pressed() -> void:
	inventory_close.emit()
	visible = false
