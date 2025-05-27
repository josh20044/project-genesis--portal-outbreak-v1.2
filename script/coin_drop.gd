extends Area2D

func _ready() -> void:
	Globals.reset_coin.connect(suicide)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		AudioPlayer.play_sfx(3)
		Globals.coin_increase.emit(1)
		queue_free()

func suicide():
	queue_free()
