extends State
class_name enemy_attack_golem

var attack_available = true

func Enter():
	attack_available = true
	$"../../AnimatedSprite2D".play("attack")

func Exit():
	pass

func Update(_delta: float):
	
	if $"../../AnimatedSprite2D".frame == 1:
		if  $"../..".player_in_range and attack_available:
			Globals.attack_recieved.emit($"../..".damage)
			attack_available = false
			
	if $"../../AnimatedSprite2D".frame >= 7:
		Transitioned.emit(self, "enemy_follow")
		attack_available = true
	
func Physics_Update(_delta: float):
	pass
