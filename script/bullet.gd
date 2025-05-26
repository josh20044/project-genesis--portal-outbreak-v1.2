extends RigidBody2D

var timer : float = 0.0
var delay = 1
var temp_num = 0
var tag = "bullet"
var bullet_life_timer = 0

func _ready() -> void:
	# contact = collision
	set_contact_monitor(true)
	set_max_contacts_reported(100)

func _process(delta: float) -> void:
	#explode_timer(delay, delta)
	bullet_life_timer += delta
	
	if bullet_life_timer >= 2.0:
		bullet_life_timer = 0
		queue_free()

func explode_timer(delay: float, delta: float):
	timer += delta
	if timer >= delay:
		collision_mask = 0
		collision_layer = 0
		$AnimatedSprite2D.scale = Vector2(7, 7)
		$AnimatedSprite2D.play("explosion")
		if !$AudioStreamPlayer.playing:
			$AudioStreamPlayer.play(0.28)
		set_deferred("freeze", true)
		if $AnimatedSprite2D.frame >= 10:
			queue_free()

func explode_on_hit():
	if get_contact_count() > 0:
		#print(str(get_colliding_bodies()))
		collision_mask = 0
		collision_layer = 0
		queue_free()

func _on_body_entered(body: Node) -> void:
	if body.name == "player":
		return
	if "tag" in body:
		if "id" in body:
			#print(body.tag + " " + str(body.id))
			Globals.enemy_hit.emit(body.id, 32.0)
		if body.tag == "bullet":
			return
	queue_free()
