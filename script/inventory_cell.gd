extends Area2D

var id : String = ""
var _scale : float = 1.0
var _mouse_entered : bool = false

var item_id : String = "none"
var desc = ""

var occupied = false

func _ready() -> void:
	$ColorRect.scale = Vector2(_scale, _scale)
	$Shape.scale = Vector2(_scale, _scale)
	$Shape.position = Vector2((_scale - 1) * 10, (_scale - 1) * 10)
	$AnimatedSprite2D.scale = Vector2(2.0, 2.0)
	$AnimatedSprite2D.position = Vector2((_scale - 1) * 10, (_scale - 1) * 10)

func _process(delta: float) -> void:
	pass


func Get_size() -> Vector2:
	return $ColorRect.size * _scale
	
func Get_item_id() -> String:
	return item_id


func Mouse_click_hold() -> bool:
	if not _mouse_entered: return false
	if Input.is_action_pressed("left_mouse"):
		$ColorRect.modulate = Color.DARK_GRAY
		return true
	else:
		$ColorRect.modulate = Color.GRAY
		return false


func Mouse_click_click() -> bool:
	if not _mouse_entered: return false
	if Input.is_action_just_pressed("left_mouse"):
		$ColorRect.modulate = Color.DARK_GRAY
		return true
	else:
		$ColorRect.modulate = Color.GRAY
		return false


func load_data(anim: String, itemid: String, des: String):
	occupied = true
	desc = des
	$AnimatedSprite2D.play(anim)
	item_id = itemid

func delete_data():
	item_id = "none"
	occupied = false

func is_occupied() -> bool:
	return occupied

func _on_area_entered(area: Area2D) -> void:
	$ColorRect.modulate = Color.GRAY
	_mouse_entered = true

func _on_area_exited(area: Area2D) -> void:
	$ColorRect.modulate = Color.WHITE
	_mouse_entered = false
