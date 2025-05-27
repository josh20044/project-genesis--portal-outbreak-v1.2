extends Area2D

var num = 0
var item_tag = "_potion"
var anim = ""
var desc = ""

func _ready() -> void:
	Globals.reset_potion.connect(suicide)
	num = Globals.RandNum(0, 4)
	if num == 0:
		$AnimatedSprite2D.play("blue")
		item_tag = "blue_potion"
		anim = "blue"
		desc = "A blue mysterious potion..."
	if num == 1:
		$AnimatedSprite2D.play("green")
		item_tag = "green_potion"
		anim = "green"
		desc = "A green mysterious potion..."
	if num == 2:
		$AnimatedSprite2D.play("yellow")
		item_tag = "yellow_potion"
		anim = "yellow"
		desc = "A yellow mysterious potion..."
	if num == 3:
		$AnimatedSprite2D.play("purple")
		item_tag = "purple_potion"
		anim = "purple"
		desc = "A purple mysterious potion..."
	if num == 4:
		$AnimatedSprite2D.play("red")
		item_tag = "red_potion"
		anim = "red"
		desc = "A red mysterious potion..."
	


func _on_body_entered(body: Node2D) -> void:
	Globals.inventory_items.append(item_tag)
	Globals.inventory_anim.append(anim)
	Globals.inventory_desc.append(desc)
	queue_free()

func suicide():
	queue_free()
