extends Control

var XPCapacity = 100
var CurrentLevel = 1
var TotalHealth = 50
var CurrentHealth = 50
var ElapsedTime = 5 * 60
var to_add_xp = 0
var xp_timer = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"XpProgressBar0-79".value = 0
	$"XpProgressBar80-100".value = 0
	$HP2.text = str(TotalHealth) + " / " + str(TotalHealth)
	$HpProgressBar.max_value = TotalHealth
	$HpProgressBar.value = TotalHealth
	$"Hp Demo SliderSlider".max_value = TotalHealth
	Globals.xp_increase.connect(increase_xp)
	Globals.attack_recieved.connect(attack_recieved)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if xp_timer >= 0.03:
		xp_timer = 0
		withdraw_xp()
	ElapsedTime -= delta
	xp_timer += delta
	$TimerLabel.text = sec_To_minsec(ElapsedTime)
	if $"XpProgressBar80-100".value == XPCapacity:
		$"XpProgressBar0-79".value = 0
		$"XpProgressBar80-100".value = 0
		$"Xp Demo Slider".value = 0
		CurrentLevel += 1
		$LabelForXPLevel.text = str("LVL: ") + str(CurrentLevel)

	if $HpProgressBar.value <= 0:
		pass

func _on_xp_demo_slider_value_changed(value: float) -> void:
	$"XpProgressBar0-79".value = value
	$"XpProgressBar80-100".value = value
	
func increase_xp(amount: int):
	to_add_xp += amount

func attack_recieved(damage: int):
	$HpProgressBar.value -= damage
	damage_effect()
	CurrentHealth -= damage
	$HP2.text = str(CurrentHealth) + " / " + str(TotalHealth)

func withdraw_xp():
	if to_add_xp <= 0: return
	
	if $"XpProgressBar0-79".value >= 79:
		$"XpProgressBar80-100".value += 1
		to_add_xp -= 1
	else:
		$"XpProgressBar0-79".value += 1
		to_add_xp -= 1
	

func _on_hp_demo_slider_slider_value_changed(value: float) -> void:
	$HpProgressBar.value = value
	$HP2.text = str(value) + " / " + str(TotalHealth)

func _on_button_pressed() -> void:
	$"Hp Demo SliderSlider".value = 10
	
func sec_To_minsec(sec: int) -> String:
	var minutes = floor(sec / 60)
	var seconds = sec - minutes * 60
	return str(minutes) + ":" + str(seconds)

func damage_effect():
	var tween = $blood.create_tween()
	tween.tween_method(blood_modulate, 1.0, 0.0, 1.5)

func blood_modulate(value: float):
	$blood.modulate.a = value
