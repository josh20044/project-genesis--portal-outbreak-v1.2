extends State
class_name enemy_death_white_warewolf


func Enter():
	$"../../AnimatedSprite2D".play("death")
	$"../..".collision_mask = 0
	$"../..".collision_layer = 0

func Exit():
	pass

func Update(_delta: float):
	#print($"../../AnimatedSprite2D".frame)
	if $"../../AnimatedSprite2D".frame >= 1:
		Globals.xp_increase.emit(10)
		$"../..".queue_free()

func Physics_Update(_delta: float):
	pass
