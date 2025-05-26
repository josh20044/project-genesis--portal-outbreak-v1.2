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
		Globals.xp_increase.emit(10)
		$"../..".queue_free()

func Physics_Update(_delta: float):
	pass
