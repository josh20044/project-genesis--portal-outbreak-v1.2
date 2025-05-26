extends CharacterBody2D

var target_to_chase: CharacterBody2D

var hp = 100
var damage = 2
var tag = "enemy_mino"
var id : int = 0

var attack_rate = 1.0
var attack_timer
var attack_available = true
var player_in_range = false

signal dead_now
signal attack_now


func _ready() -> void:
	attack_timer = attack_rate
	
	Globals.enemy_hit.connect(hit)
	$hp.value = hp

func _physics_process(delta: float) -> void:
	if player_in_range:
		attack_timer += delta
		if attack_timer >= attack_rate:
			attack_timer = 0
			attack_now.emit()
	
func hit(_id: int, damage: int):
	if _id == id:
		hp -= damage
		$hp.value = hp
		blink()
	if hp <= 0:
		dead_now.emit()
		
func blink():
	var tween = get_tree().create_tween()
	tween.tween_method(SetShader_BlinkIntensity, 1.0, 0.0, 0.2)

func SetShader_BlinkIntensity(value: float):
	$AnimatedSprite2D.material.set_shader_parameter("blink_intensity", value)


func _on_attack_range_body_entered(body: Node2D) -> void:
	if body.name == "player":
		attack_available = false
		player_in_range = true

func _on_attack_range_body_exited(body: Node2D) -> void:
	player_in_range = false
