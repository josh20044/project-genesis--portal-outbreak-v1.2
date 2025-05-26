extends State
class_name enemy_follow_BringerOfDeath

@onready var navigation_agent: NavigationAgent2D = $"../../NavigationAgent2D"
var target_to_chase: CharacterBody2D
const speed = 180.0
func Enter():
	$"../../AnimatedSprite2D".play("slime")
	target_to_chase = $"../..".target_to_chase

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	move()

func move():
	if target_to_chase.position.x > $"../..".position.x:
		$"../../AnimatedSprite2D".flip_h = true
		$"../../AnimatedSprite2D".offset.x = 70
	else:
		$"../../AnimatedSprite2D".flip_h = false
		$"../../AnimatedSprite2D".offset.x = 0
	navigation_agent.target_position = target_to_chase.global_position
	$"../..".velocity = $"../..".global_position.direction_to(navigation_agent.get_next_path_position()) * speed
	$"../..".move_and_slide()

func _on_enemy_dead_now() -> void:
	Transitioned.emit(self, "enemy_death")

func _on_enemy_attack_now() -> void:
	Transitioned.emit(self, "enemy_attack")
