extends Control

var skills = [
	{
		"value": 10,
		"name": "Normal Gun Damage",
		"desc": "Minor increase gun damage."
	},
	{
		"value": 20,
		"name": "Big Gun Damage",
		"desc": "Major increase gun damage."
	},
	{
		"value": true,
		"name": "Shot Gun",
		"desc": "Turn your gun into shot gun."
	},
	{
		"value": 0.01,
		"name": "Normal Gun Firerate",
		"desc": "Minor increase gun firerate."
	},
	{
		"value": 0.02,
		"name": "Big Gun Firerate",
		"desc": "Major increase gun firerate."
	},
	{
		"value": 0.5,
		"name": "Normal Health Regen",
		"desc": "Minor increase in health regeneration."
	},
	{
		"value": 1,
		"name": "Big Health Regen",
		"desc": "Major increase in health regeneration."
	},
	{
		"value": 15,
		"name": "Normal speed",
		"desc": "Minor increase in movement speed."
	},
	{
		"value": 45,
		"name": "Big speed",
		"desc": "Major increase in movement speed."
	},
	{
		"value": 1,
		"name": "Shot gun bullet",
		"desc": "increase shot gun bullet by 1."
	},
]

var skill1 = 0
var skill2 = 0
var skill3 = 0


func  _ready() -> void:
	Globals.level_up.connect(find_skill)

func _on_skill_button_3_pressed() -> void:
	Globals.game_resumed.emit()
	visible = false
	apply_skill(skill1)
	
func _on_skill_button_2_pressed() -> void:
	Globals.game_resumed.emit()
	visible = false
	apply_skill(skill2)

func _on_skill_button_1_pressed() -> void:
	Globals.game_resumed.emit()
	visible = false
	apply_skill(skill3)
	
func find_skill():
	skill1 = Globals.RandNum(0, 2)
	skill2 = Globals.RandNum(3, 5)
	skill3 = Globals.RandNum(6, 8)
	
	if skill1 == 2 and Globals.shot_gun_mode:
		skill1 = 9
	
	$SkillButton3/Label.text = skills[skill1]["name"]
	$SkillButton3/Label2.text = skills[skill1]["desc"]
	$SkillButton2/Label.text = skills[skill2]["name"]
	$SkillButton2/Label2.text = skills[skill2]["desc"]
	$SkillButton1/Label.text = skills[skill3]["name"]
	$SkillButton1/Label2.text = skills[skill3]["desc"]
	
func apply_skill(index: int):
	if index == 0 or index == 1:
		Globals.player_damage += skills[index]["value"]
		print(Globals.player_damage)
	if index == 2:
		Globals.shot_gun_mode = skills[index]["value"]
		print(Globals.shot_gun_mode)
	if index == 3 or index == 4:
		Globals.gun_fire_rate -= skills[index]["value"]
		print(Globals.gun_fire_rate)
	if index == 5 or index == 6:
		Globals.regen_amount += skills[index]["value"]
		print(Globals.regen_amount)
	if index == 7 or index == 8:
		Globals.player_speed += skills[index]["value"]
		print(Globals.player_speed)
	if index == 9:
		Globals.shot_gun_bullet += skills[index]["value"]
		print(Globals.shot_gun_bullet)
