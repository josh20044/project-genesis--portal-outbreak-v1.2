extends Control


func _ready() -> void:
	$AnimationPlayer.speed_scale = 3.0
	$AnimationPlayer.play("DriftZ")
	

func _process(delta: float) -> void:
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "DriftZ":
		get_tree().change_scene_to_file("res://scene/tower_defense_main_menu.tscn")
