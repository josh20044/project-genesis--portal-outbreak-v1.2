extends Node2D

var enemy = [
	preload("res://scene/enemy.tscn"),
	preload("res://enemy_scene/enemy_test.tscn"),
	preload("res://enemy_scene/enemy_drone.tscn"),
	preload("res://enemy_scene/enemy_BringerOfDeath.tscn")
]

var player: CharacterBody2D
var to_spawn = 3
var variant = 0
var spawn_speed = 1
var spawn_timer = 0

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	spawn_timer += delta
	if spawn_timer >= spawn_speed and to_spawn > 0:
		spawn_timer = 0
		to_spawn -= 1
		spawn_Enemy()
	if to_spawn == 0:
		queue_free()
	
func spawn_Enemy():
	var enemy_instance = enemy[variant].instantiate()
	var x = rng.randi_range(-70, 70)
	var y = rng.randi_range(-70, 70)
	enemy_instance.position = Vector2(position.x + x, position.y + y)
	enemy_instance.target_to_chase = player
	enemy_instance.scale = Vector2(2.0, 2.0)
	enemy_instance.id = Globals.enemy_id
	Globals.enemy_id += 1
	get_tree().get_root().add_child(enemy_instance)
