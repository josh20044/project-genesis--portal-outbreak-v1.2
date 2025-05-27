extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.game_over.connect(play)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$TotalScore.text = "TOTAL SCORE: " + str(Globals.score)
	$CoinsEarned.text = "COINS EARNED: " + str(Globals.total_gold)

func play():
	visible = true
	Globals.game_paused.emit()
	$AnimationPlayer.play("FirstPlay")

func _on_main_menu_button_pressed() -> void:
	Globals.game_resumed.emit()
	Globals.reset_enemy.emit()
	Globals.reset_portal.emit()
	Globals.endgame.emit()
	Globals.reset_coin.emit()
	Globals.reset_xp.emit()
	Globals.reset_potion.emit()
