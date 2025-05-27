extends CharacterBody2D

func  _ready() -> void:
	if Globals.char_selected == "char1":
		$AnimatedSprite2D.rotation_degrees = 0.0
		$AnimatedSprite2D.scale = Vector2(7.0, 7.0)
	if Globals.char_selected == "char2":
		$AnimatedSprite2D.rotation_degrees = 0.0
		$AnimatedSprite2D.scale = Vector2(6.0, 6.0)
		$point.position.x += 100
		$point.position.y -= 15
	$AnimatedSprite2D.play(Globals.char_selected)
	
func _process(delta: float) -> void:
	var dir = Input.get_vector("a", "d", "w", "s")
	velocity = dir * Globals.player_speed
	move_and_slide()
	look_at(get_global_mouse_position())
