extends Area2D

func _ready() -> void:
	Globals.reset_xp.connect(suicide)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Globals.xp_increase.emit(10)
		queue_free()

func suicide():
	queue_free()
