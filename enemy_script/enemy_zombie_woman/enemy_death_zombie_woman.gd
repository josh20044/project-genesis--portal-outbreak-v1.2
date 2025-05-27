extends State
class_name enemy_death_zombie_woman


func Enter():
	$"../../AnimatedSprite2D".play("death")
	$"../..".collision_mask = 0
	$"../..".collision_layer = 0

func Exit():
	pass

func Update(_delta: float):
	#print($"../../AnimatedSprite2D".frame)
	if $"../../AnimatedSprite2D".frame >= 3:
		get_tree().get_root().add_child(Globals.drop_xp($"../..".position))
		if Globals.gacha(1, 10): get_tree().get_root().add_child(Globals.drop_coin($"../..".position))
		if Globals.gacha(1, 20): get_tree().get_root().add_child(Globals.drop_potion($"../..".position))
		$"../..".queue_free()

func Physics_Update(_delta: float):
	pass
