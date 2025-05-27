extends Node2D

@export_range(1, 100) var _scale : float = 1.0
@export_range(1, 100) var Row = 1
@export_range(1, 100) var Column = 1
@export_range(1, 100) var gap = 1

var cell = preload("res://scene/inventory_cell.tscn")
var img = preload("res://extra_img/All Potions/Green potions/empty.png")

func _ready() -> void:
	position = Vector2(113, 111)
	var pos : Vector2
	for i in range(Row):
		for j in range(Column):
			pos = Vector2(position.x + (((20 * _scale) + gap) * j), position.y + (((20 * _scale) + gap)) * i)
			add_cell(pos, ("id" + str(i) + str(j)))
	for i in range(Globals.inventory_items.size()):
		load_item(Globals.inventory_anim[i], Globals.inventory_items[i], Globals.inventory_desc[i])

func _process(delta: float) -> void:
	for i in get_children():
		if i.Mouse_click_click():
			$"../Panel/ItemName".text = i.desc
			$"../Panel/ItemDescription".text = i.Get_item_id() 

func add_cell(pos: Vector2, id: String):
	var cell_instance = cell.instantiate()
	cell_instance.position = pos
	cell_instance._scale = _scale
	cell_instance.id = id
	add_child(cell_instance)

func load_item(anim: String, item_id: String, des: String):
	if not check_avail(): return
	for i in get_children():
		if not i.is_occupied():
			i.load_data(anim, item_id, des)
			break

func check_avail() -> bool:
	for i in get_children():
		if not i.is_occupied():
			return true
	return false

func check_avail_count() -> int:
	var num = 0
	for i in get_children():
		if not i.is_occupied():
			num += 1
	return num

func check_not_avail_count() -> int:
	var num = 0
	for i in get_children():
		if i.is_occupied():
			num += 1
	return num
