extends State
class_name idle

var bullet = preload("res://scene/bullet.tscn")
var bullet_timer : float
var bullet_speed = 1500

func Enter():
	pass

func Exit():
	pass

func Update(_delta: float):
	#shoot_delay(_delta, 0.1)
	shot_gun(_delta, 0.1, 10)


func Physics_Update(_delta: float):
	pass
	

func shoot_delay(_delta: float, rate: float):
	bullet_timer += _delta
	if Input.is_action_pressed("left_mouse") and bullet_timer >= rate: 
		bullet_timer = 0
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = $"../../point".get_global_position()
		bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated($"../..".rotation), Vector2())
		bullet_instance.rotation_degrees = $"../..".rotation_degrees
		bullet_instance.tag = "bullet"
		add_child(bullet_instance)

func shot_gun(_delta: float, rate: float, amount: int):
	bullet_timer += _delta
	if Input.is_action_pressed("left_mouse") and bullet_timer >= rate: 
		bullet_timer = 0
		var arc = amount * 0.1
		for i in range(amount):
			var increment = arc / (amount - 1)
			var rot = $"../..".rotation + increment * i - arc / 2
			var bullet_instance = bullet.instantiate()
			bullet_instance.position = $"../../point".get_global_position()
			bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated(rot) , Vector2())
			bullet_instance.rotation_degrees = $"../..".rotation_degrees
			bullet_instance.name = "bullet"
			add_child(bullet_instance)
